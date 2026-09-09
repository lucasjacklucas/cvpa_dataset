###############################################################################
# 99_build.R -- rebuild the dataset from the original survey files.
#
#   Rscript "2 Code/99_build.R"       (run from the Dataset folder)
#
# Every respondent in every file, unfiltered. A survey whose file is missing
# from 1 Raw Data/ is skipped rather than treated as an error.
#
# Writes 3 Clean Data/dataset.parquet: one row per answer. Each row carries the
# respondent's demographic variables, the question answered, its policy domain,
# and the recoded value. Vote choice and vote intention are questions here like
# any other, under the domain "Vote Intention & Choice".
###############################################################################

library(arrow)

# find 00_setup.R beside this file; it works out every other path from there
.code <- local({
  a <- commandArgs(trailingOnly = FALSE)
  f <- sub("^--file=", "", a[grep("^--file=", a)])
  # Rscript writes every space in --file= as "~+~", which matters here because
  # the path to this folder has several
  f <- gsub("~+~", " ", f, fixed = TRUE)
  f <- f[file.exists(f)]
  if (length(f)) return(dirname(normalizePath(f[[1]])))
  for (i in rev(seq_len(sys.nframe()))) {
    of <- sys.frame(i)$ofile
    if (!is.null(of) && file.exists(of)) return(dirname(normalizePath(of)))
  }
  if (dir.exists("2 Code")) "2 Code" else getwd()
})
source(file.path(.code, "00_setup.R"))
for (f in c("01_gallup.R", "02_ces.R", "03_environics.R", "04_pollara.R", "05_bridge.R"))
  source(file.path(.code, f))

message("registered ", length(.registry$surveys), " survey blocks")

out <- run_all()
respondents <- out$respondents
responses   <- out$responses

# com_100 and com_500 for CES 2015/2019/2021 and Democracy Checkup 2019-2022
# were built by hand from the population of the respondent's municipality, not
# read from the survey file, so nothing in 1 Raw Data/ can regenerate them.
# They are carried in 5 Supporting Data/external_community_size.csv, keyed on
# response_id. Without this step 92,317 respondents lose their community size.
ext <- read_csv(dpath("5 Supporting Data", "external_community_size.csv"),
                show_col_types = FALSE, progress = FALSE)
respondents <- respondents %>%
  left_join(ext %>% select(response_id, .c100 = com_100, .c500 = com_500), by = "response_id") %>%
  mutate(com_100 = coalesce(com_100, .c100),
         com_500 = coalesce(com_500, .c500)) %>%
  select(-.c100, -.c500)
message("merged external community size for ", format(nrow(ext), big.mark = ","), " respondents")

# ---------------------------------------------------------------- checks

validate_respondents(respondents)
validate_responses(responses)
cat("duplicate assignments:", nrow(check_duplicate_assignments()), "\n")

if (length(missing_files())) {
  cat("\n-- files not found under 1 Raw Data/ (their blocks were skipped) --\n")
  cat(paste0("  ", missing_files(), collapse = "\n"), "\n")
}

# ---------------------------------------------------------------- assemble

domains <- read_csv(question_codebook_file, show_col_types = FALSE, progress = FALSE) %>%
  distinct(question_id = issue_question_id, policy_domain, policy_domain_label, issue_label)
stopifnot(!any(duplicated(domains$question_id)))

# Fieldwork dates were never recoded from the survey files -- they are carried
# metadata -- so they live in a survey-level table built by make_survey_dates.R.
# date_source records how each survey's window was established.
dates <- read_csv(dpath("5 Supporting Data", "survey_dates.csv"),
                  show_col_types = FALSE, progress = FALSE) %>%
  select(survey_id, year, start_date, end_date, date_source)

dataset <- responses %>%
  left_join(domains, by = "question_id") %>%
  left_join(dates, by = "survey_id") %>%
  # survey_id and source travel with the response, so the two Gallup polls that
  # carry issue questions but no demographics keep their answers
  left_join(respondents %>% select(-survey_id, -source), by = "response_id") %>%
  select(response_id, survey_id, source, year, start_date, end_date, date_source,
         any_of(c("gender", "age", "age_cats", "region", "province", "com_100", "com_500",
                  "degree", "occupation", "religion", "union_household",
                  "language", "language_var", "language_home", "mother_tongue",
                  "survey_mode")),
         policy_domain, policy_domain_label, issue_label, question_id, value) %>%
  arrange(source, survey_id, response_id, question_id)

stopifnot(!any(is.na(dataset$year)))

lost <- setdiff(respondents$response_id, dataset$response_id)
cat("\nrespondents with no answer to any question: ", format(length(lost), big.mark = ","),
    " of ", format(nrow(respondents), big.mark = ","), " (dropped)\n", sep = "")

# ---------------------------------------------------------------- write

dir.create(dpath("3 Clean Data"), showWarnings = FALSE)
write_parquet(dataset, dpath("3 Clean Data", "dataset.parquet"), compression = "zstd")

cat("\ndataset.parquet: ", format(nrow(dataset), big.mark = ","), " rows x ",
    ncol(dataset), " columns\n", sep = "")
cat("years: ", min(dataset$year), "-", max(dataset$year), "\n", sep = "")
print(dataset %>% count(policy_domain_label, name = "rows"), n = Inf)
cat("\nwritten to: ", dpath("3 Clean Data"), "\n", sep = "")

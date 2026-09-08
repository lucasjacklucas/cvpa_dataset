###############################################################################
# Create Integrated Dataset.R -- join the rebuilt issue data to the
# demographic / vote backbone. Issue columns come from issues_wide.parquet;
# the old issue columns in source files/ are dropped and replaced wholesale.
# Supersedes "2026 Create Integrated Dataset (with Issues).R".
###############################################################################

suppressPackageStartupMessages({library(tidyverse); library(arrow); library(here)})

# backbone

gallup_data     <- rio::import(here("source files", "gallup_vote_and_issues.csv"))
ces_data        <- rio::import(here("source files", "ces_vote_and_issues.csv"))
environics_data <- rio::import(here("source files", "env_vote_and_issues.csv"))
bridge26_data   <- rio::import(here("source files", "bridge_vote_and_issues.csv"))

# drop every issue column: the id pattern, plus the raw Bridge names
crosswalk  <- read_csv(here("source files", "bridge_crosswalk.csv"), show_col_types = FALSE)
bridge_raw <- na.omit(crosswalk$bridge26)
ID_PATTERN <- "^(bri|ces|env|gal)_[a-z]{4}_[0-9]{3}$"

drop_issues <- function(d) {
  d %>% select(-matches(ID_PATTERN), -any_of(bridge_raw))
}
gallup_data     <- drop_issues(gallup_data)
ces_data        <- drop_issues(ces_data)
environics_data <- drop_issues(environics_data)
bridge26_data   <- drop_issues(bridge26_data)

# dates are character in some sources, Date in others
as_chr_dates <- function(d) {
  d %>% mutate(across(any_of(c("start_date","end_date","survey_date","survey_date_post")),
                      as.character))
}
backbone <- bind_rows(as_chr_dates(gallup_data), as_chr_dates(environics_data),
                      as_chr_dates(ces_data),    as_chr_dates(bridge26_data))

# derived demographics, unchanged from the previous script

backbone <- backbone %>%
  mutate(language = coalesce(language_home, mother_tongue),
         survey_mode = car::recode(survey_mode,
           "'Face to face' = 1; 'Online' = 2; 'Telephone' = 3; 'Unknown' = 4"),
         agetmp = car::recode(age, "0:29=1; 30:49=2; 50:125=3"),
         age_cats = coalesce(age_cats, agetmp)) %>%
  select(-agetmp)

backbone$age[backbone$age == 17] <- 18
backbone$language_var <- ifelse(!is.na(backbone$language_home), 1,
                         ifelse(!is.na(backbone$mother_tongue), 2, NA))
backbone$religion[backbone$religion == 98] <- 5

# misbehaving survey, excluded upstream of everything
backbone <- backbone %>% filter(survey_id != "cipo-359-E-1973-05_F1.tab")

# rebuilt issue data

issues <- read_parquet(here("issues_wide.parquet")) %>%
  select(-survey_id, -survey_id_main, -source)   # the backbone is authoritative

n_before <- nrow(backbone)
integrated <- backbone %>% left_join(issues, by = "response_id")
stopifnot(nrow(integrated) == n_before)          # response_id must be unique

# column order

issue_cols <- names(integrated)[str_detect(names(integrated), ID_PATTERN)]
init_vars  <- setdiff(names(integrated), c("response_id","language","language_var", issue_cols))

integrated <- integrated %>%
  select(response_id, language, language_var, all_of(init_vars),
         all_of(sort(issue_cols[str_starts(issue_cols, "bri_")])),
         all_of(sort(issue_cols[str_starts(issue_cols, "ces_")])),
         all_of(sort(issue_cols[str_starts(issue_cols, "env_")])),
         all_of(sort(issue_cols[str_starts(issue_cols, "gal_")])))

# write

rio::export(integrated, file = here("dataset.csv"))
write_parquet(integrated, here("dataset.parquet"), compression = "zstd")

# report

matched <- sum(!is.na(match(issues$response_id, backbone$response_id)))
cat("\nbackbone respondents:   ", format(n_before, big.mark = ","), "\n", sep = "")
cat("respondents with issues:", format(nrow(issues), big.mark = ","), "\n", sep = "")
cat("  of those, matched:    ", format(matched, big.mark = ","),
    sprintf(" (%.1f%%)", 100*matched/nrow(issues)), "\n", sep = "")
cat("issue columns:          ", length(issue_cols), "\n", sep = "")
cat("dataset:                ", format(nrow(integrated), big.mark = ","), " rows x ",
    ncol(integrated), " columns\n", sep = "")
cat("answers in the dataset: ",
    format(sum(!is.na(integrated[issue_cols])), big.mark = ","), "\n", sep = "")

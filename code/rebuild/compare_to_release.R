###############################################################################
# compare_to_release.R -- check a rebuilt dataset against the published one.
#
#   Rscript code/rebuild/compare_to_release.R "<rebuilt.parquet>" "<published.parquet>"
#
# A rebuild from Dataverse cannot include every survey (the Pollara surveys are
# restricted and the 2026 Bridge Survey is not deposited), so the comparison
# covers the surveys the rebuild produced: for those, every row and every
# column should be identical to the published dataset.
###############################################################################

suppressMessages({ library(arrow); library(dplyr) })

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2)
  stop("Usage: Rscript compare_to_release.R \"<rebuilt.parquet>\" \"<published.parquet>\"",
       call. = FALSE)

rebuilt   <- read_parquet(args[[1]])
published <- read_parquet(args[[2]])

covered <- unique(rebuilt$survey_id)
missing <- published %>%
  filter(!survey_id %in% covered) %>%
  distinct(source, survey_id) %>%
  count(source, name = "surveys")

cat("surveys rebuilt:   ", length(covered), " of ", n_distinct(published$survey_id), "\n", sep = "")
cat("rows rebuilt:      ", format(nrow(rebuilt), big.mark = ","), " of ",
    format(nrow(published), big.mark = ","), "\n", sep = "")
if (nrow(missing)) {
  cat("surveys not rebuilt, by source:\n")
  print(as.data.frame(missing), row.names = FALSE)
}

# put both in the same order before comparing
key <- c("response_id", "question_id")
a <- rebuilt %>% arrange(across(all_of(key))) %>% as.data.frame()
b <- published %>% filter(survey_id %in% covered) %>% arrange(across(all_of(key))) %>% as.data.frame()

if (!identical(names(a), names(b))) {
  cat("\nThe columns differ.\n  rebuilt:   ", paste(names(a), collapse = ", "),
      "\n  published: ", paste(names(b), collapse = ", "), "\n", sep = "")
  quit(status = 1)
}
if (nrow(a) != nrow(b)) {
  cat("\nThe rebuilt surveys have ", format(nrow(a), big.mark = ","), " rows; the same surveys in the ",
      "published dataset have ", format(nrow(b), big.mark = ","), ".\n", sep = "")
  quit(status = 1)
}

differs <- names(a)[!vapply(names(a), function(v) identical(a[[v]], b[[v]]), logical(1))]
if (length(differs)) {
  cat("\nColumns with differences: ", paste(differs, collapse = ", "), "\n", sep = "")
  quit(status = 1)
}
cat("\nEvery row of the rebuilt surveys is identical to the published dataset.\n")

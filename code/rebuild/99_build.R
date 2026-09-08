###############################################################################
# 99_build.R -- rebuild the issue data from the original survey files.
# Paths come from here(); the project root holds data/ and codebook.csv.
# Output is every respondent in every file, unfiltered.
# Surveys whose file is missing from data/ are skipped, not an error.
###############################################################################

library(here)
source(here("code", "rebuild", "00_setup.R"))
source(here("code", "rebuild", "01_gallup.R"))
source(here("code", "rebuild", "02_environics.R"))
source(here("code", "rebuild", "03_ces.R"))
source(here("code", "rebuild", "04_bridge.R"))

message("registered ", length(.registry$surveys), " survey blocks")

issues_long <- run_all()

# checks

v <- validate(issues_long)

cat("\n-- raw codes no rule mentions --\n")
um <- unmapped_codes()
if (nrow(um) == 0) cat("none\n") else print(um, n = Inf)

if (length(missing_files())) {
  cat("\n-- files not found under ./data/ (their blocks were skipped) --\n")
  cat(paste0("  ", missing_files(), collapse = "\n"), "\n")
}

# write. long is canonical; wide is what the integration script wants.
# parquet not csv -- the wide table is 680k x 634 and almost all empty.

issues_wide <- issues_long %>%
  select(response_id, survey_id, survey_id_main, source, issue_question_id, value) %>%
  pivot_wider(names_from = issue_question_id, values_from = value)

arrow::write_parquet(issues_long, here("issues_long.parquet"))
arrow::write_parquet(issues_wide, here("issues_wide.parquet"))

cat("\nissues_long:  ", nrow(issues_long), " rows\n", sep = "")
cat("issues_wide:  ", nrow(issues_wide), " rows x ", ncol(issues_wide), " columns\n", sep = "")
cat("written to:   ", here(), "\n", sep = "")

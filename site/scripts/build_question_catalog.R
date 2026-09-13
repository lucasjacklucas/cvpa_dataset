# Writes site/data/question_catalog.json from cvpa::question_catalog(). Hugo
# reads it to build the question catalog table on the Data page (see
# layouts/shortcodes/question-catalog.html).
#
# Rerun from the repository root whenever the cvpa package or its data
# changes, then commit the updated JSON:
#   Rscript site/scripts/build_question_catalog.R
# Needs the cvpa data cache; run cvpa::update_cvpa_data() first if it's missing.

out <- "site/data/question_catalog.json"

catalog <- cvpa::question_catalog()

dir.create(dirname(out), showWarnings = FALSE)
jsonlite::write_json(catalog, out, pretty = TRUE, auto_unbox = TRUE)
message("Wrote ", nrow(catalog), " questions to ", out)

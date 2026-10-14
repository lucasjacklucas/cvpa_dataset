###############################################################################
# setup_rebuild.R -- rebuild the CVPA dataset from a clone of this repository.
#
#   Rscript code/rebuild/setup_rebuild.R "<new folder>"   (from the repository root)
#
# The build scripts in code/ were written for the project's working layout:
#   1 Raw Data/         the original survey files, by source
#   2 Code/             the build scripts
#   3 Clean Data/       output
#   4 Documentation/    the two codebooks the build reads
#   5 Supporting Data/  inputs that are not survey files
# This script creates that layout in a new folder, copies the build scripts,
# codebooks, supporting data and Bridge Survey file into it from the
# repository, and then runs rebuild_from_dataverse.R, which downloads the
# original survey files from Dataverse and runs the build. The build scripts
# are copied unchanged.
#
# The rebuilt dataset is written to <new folder>/3 Clean Data/dataset.parquet.
# Run compare_to_release.R afterwards to check it against the published one.
###############################################################################

# the directory holding this file, whether run by Rscript or by source()
here <- local({
  a <- commandArgs(trailingOnly = FALSE)
  f <- sub("^--file=", "", a[grep("^--file=", a)])
  # Rscript writes every space in --file= as "~+~"
  f <- gsub("~+~", " ", f, fixed = TRUE)
  f <- f[file.exists(f)]
  if (length(f)) return(dirname(normalizePath(f[[1]])))
  for (i in rev(seq_len(sys.nframe()))) {
    of <- sys.frame(i)$ofile
    if (!is.null(of) && file.exists(of)) return(dirname(normalizePath(of)))
  }
  getwd()
})
repo <- normalizePath(file.path(here, "..", ".."))

args <- commandArgs(trailingOnly = TRUE)
if (!length(args))
  stop("Name a folder to rebuild into, e.g.\n",
       "  Rscript code/rebuild/setup_rebuild.R \"../cvpa_rebuild\"", call. = FALSE)
target <- args[[1]]
if (normalizePath(target, mustWork = FALSE) == repo)
  stop("Rebuild into a new folder, not the repository itself.", call. = FALSE)

for (d in c("1 Raw Data", "2 Code", "4 Documentation", "5 Supporting Data"))
  dir.create(file.path(target, d), recursive = TRUE, showWarnings = FALSE)
target <- normalizePath(target)
message("rebuilding into: ", target)

copy_into <- function(files, dest) {
  ok <- file.copy(files, file.path(target, dest), overwrite = TRUE)
  if (!all(ok)) stop("Could not copy: ", paste(files[!ok], collapse = ", "), call. = FALSE)
}
copy_into(list.files(file.path(repo, "code"), pattern = "\\.R$", full.names = TRUE), "2 Code")
copy_into(file.path(here, c("rebuild_from_dataverse.R", "dataverse_files.csv")), "2 Code")
copy_into(file.path(repo, c("question_codebook.csv", "demographics_codebook.csv")), "4 Documentation")
copy_into(list.files(file.path(repo, "supporting_data"), full.names = TRUE), "5 Supporting Data")

# The 2026 Bridge Survey is not on Dataverse. The repository carries a minimal
# version of it (bridge_survey/bridge_clean.csv: every respondent, in the
# original row order, but only the columns the build reads), so it goes where
# the build looks for it.
dir.create(file.path(target, "1 Raw Data", "5 Bridge", "surveys"), recursive = TRUE, showWarnings = FALSE)
copy_into(file.path(repo, "bridge_survey", "bridge_clean.csv"), file.path("1 Raw Data", "5 Bridge", "surveys"))

# Download the survey files and run the build, as a separate R process so that
# the build finds its own files exactly as it does when run by hand.
status <- system2(file.path(R.home("bin"), "Rscript"),
                  c(shQuote(file.path(target, "2 Code", "rebuild_from_dataverse.R")),
                    shQuote(target)))
if (status != 0) stop("The rebuild failed (exit status ", status, ")", call. = FALSE)

message("\nDone. The rebuilt dataset is in: ", file.path(target, "3 Clean Data", "dataset.parquet"))

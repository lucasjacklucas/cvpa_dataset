###############################################################################
# rebuild_from_dataverse.R -- rebuild the dataset from the survey files as
# they are archived on Dataverse, instead of from a local copy of them.
#
#   Rscript rebuild_from_dataverse.R "<Dataset folder>"
#
# The Dataset folder is the one holding 2 Code/, 4 Documentation/ and
# 5 Supporting Data/. Without an argument the script looks in its own folder
# and the one above, so it also runs from inside 2 Code/.
#
#   1. reads dataverse_files.csv, kept beside this script: one row per survey
#      file the build reads, and the Dataverse file it comes from
#   2. downloads each file into 1 Raw Data/ and checks it against the checksum
#      in dataverse_files.csv. A file already anywhere under 1 Raw Data/ is left
#      alone, so this never overwrites a local copy.
#   3. runs 2 Code/99_build.R, which skips any survey whose file could not be
#      had -- restricted, not on Dataverse, or failed to download
#
# No API key is needed: every file marked "available" is public.
###############################################################################

suppressMessages({ library(httr2); library(readr); library(dplyr) })

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

dataset <- local({
  a <- commandArgs(trailingOnly = TRUE)
  cand <- if (length(a)) a[[1]] else c(here, dirname(here))
  ok <- cand[dir.exists(file.path(cand, "2 Code"))]
  if (!length(ok))
    stop("Cannot find the Dataset folder -- the one holding '2 Code'.\n",
         "  Run it as:  Rscript rebuild_from_dataverse.R \"<Dataset folder>\"\n",
         "  Looked in: ", paste(cand, collapse = ", "), call. = FALSE)
  normalizePath(ok[[1]])
})
raw <- file.path(dataset, "1 Raw Data")
message("dataset folder: ", dataset)

files <- read_csv(file.path(here, "dataverse_files.csv"),
                  col_types = cols(.default = col_character()))

# ---------------------------------------------------------------- download

# the build finds a file by name anywhere under 1 Raw Data/, so that is what
# counts as already having it
have <- basename(list.files(raw, recursive = TRUE))
todo <- files %>% filter(status == "available", !file_name %in% have)
message(sum(files$file_name %in% have), " files already in 1 Raw Data; ",
        nrow(todo), " to download")

# A file can serve more than one row -- the CES panel files are read once per
# wave -- so each Dataverse file is downloaded once and copied to every name.
fetched  <- list()
failed   <- character()
mismatch <- character()
for (i in seq_len(nrow(todo))) {
  f <- todo[i, ]
  zipped <- !is.na(f$zip_member)
  key <- paste(f$file_id, f$zip_member)
  if (is.null(fetched[[key]])) {
    message(sprintf("[%d/%d] %s", i, nrow(todo), f$file_name))
    tmp <- tempfile(fileext = if (zipped) ".zip" else paste0(".", tools::file_ext(f$file_name)))
    req <- request(paste0(f$server, "/api/access/datafile/", f$file_id)) |>
      req_retry(max_tries = 4, backoff = ~ 2 ^ .x)
    # ingested files are served as .tab unless the original upload is asked for
    if (identical(f$format, "original")) req <- req_url_query(req, format = "original")
    ok <- tryCatch({ req_perform(req, path = tmp); TRUE },
                   error = function(e) { message("   failed: ", conditionMessage(e)); FALSE })
    if (!ok) { failed <- c(failed, f$file_name); next }
    # the older CES deposits hold their Stata files only inside a zip
    if (zipped) {
      out <- tempfile()
      utils::unzip(tmp, files = f$zip_member, exdir = out, junkpaths = TRUE)
      tmp <- file.path(out, basename(f$zip_member))
    }
    # a deposit that has been re-versioned since dataverse_files.csv was made
    # would change the results without a word, so it stops the run below
    if (!file.exists(tmp) || unname(tools::md5sum(tmp)) != f$md5) {
      mismatch <- c(mismatch, f$file_name); next
    }
    fetched[[key]] <- tmp
  }
  dest <- file.path(raw, f$folder, f$file_name)
  dir.create(dirname(dest), recursive = TRUE, showWarnings = FALSE)
  file.copy(fetched[[key]], dest)
}

unavailable <- files %>% filter(status != "available")
cat("\n-- download --\n")
cat("downloaded:        ", length(fetched), " files for ", nrow(todo) - length(failed) - length(mismatch),
    " rows\n", sep = "")
cat("failed:            ", length(failed), "\n", sep = "")
cat("checksum mismatch: ", length(mismatch), "\n", sep = "")
cat("not available:     ", nrow(unavailable), "\n", sep = "")
if (nrow(unavailable)) print(count(unavailable, source, status), n = Inf)
if (length(failed)) cat("failed downloads (their surveys will be skipped):\n",
                        paste0("  ", failed, collapse = "\n"), "\n")
if (length(mismatch))
  stop("These files no longer match the checksum in dataverse_files.csv, so the ",
       "deposit has probably been re-versioned. Check them before rebuilding:\n",
       paste0("  ", mismatch, collapse = "\n"), call. = FALSE)

# ---------------------------------------------------------------- build

# run as its own process, exactly as it is run by hand, so 99_build.R finds
# 00_setup.R and the rest from its own location
cat("\n-- build --\n")
setwd(dataset)
status <- system2(file.path(R.home("bin"), "Rscript"), shQuote(file.path("2 Code", "99_build.R")))
if (status != 0) stop("99_build.R failed (exit status ", status, ")", call. = FALSE)

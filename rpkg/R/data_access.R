## -----------------------------------------------------------------------
## Data access layer: cvpa no longer ships policy-attitude data bundled in
## the package. Instead it reads the same Parquet files the policy-attitudes
## web app is built from (https://policyattitudes.ca/app/), hosted by the
## Canadian Voting and Policy Attitudes Project site at
## https://policyattitudes.ca/cp3_parquet/ -- vbl_data.parquet
## (the question catalog), code_labels.parquet (demographic + party value
## labels), and one resp/question=<code>/data_0.parquet file per question.
##
## Design: local-cache-first, not query-the-network-on-every-call. Nothing
## in this package touches the network except update_cvpa_data() itself --
## every other function reads only from the local cache and errors with a
## pointer to update_cvpa_data() if the file it needs isn't there yet. This
## mirrors the cvpa_dataset repo's code/rebuild/populate_db.R Parquet export
## (same file layout, written to site/static/cp3_parquet/) and
## site/static/app/app.js's DATA_BASE_URL/respUrlFor() (same URL scheme), so
## keep those three in sync if the hosted layout ever changes.
## -----------------------------------------------------------------------

.cvpa_official_url <- "https://policyattitudes.ca/cp3_parquet/"

#' Base URL for the hosted cp3 policy-attitude Parquet files
#'
#' Override with `options(cvpa.data_url = ...)` to point the package at a
#' different mirror (e.g. a local copy of the cvpa_dataset repo's
#' `site/static/cp3_parquet/` during development, or the small bundled
#' example data from [cvpa_example_url()]). Anything other than the official
#' URL, `https://policyattitudes.ca/cp3_parquet/`, makes [update_cvpa_data()]
#' -- and the functions that read the data it cached -- warn. Reset with
#' `options(cvpa.data_url = NULL)`.
#' @return A single character string: the base URL of the cp3 Parquet files
#'   (the `cvpa.data_url` option if set, otherwise the official URL).
#' @keywords internal
.cvpa_data_base_url <- function() {
  getOption("cvpa.data_url", .cvpa_official_url)
}

.cvpa_is_official <- function(url) {
  identical(sub("/*$", "/", url), .cvpa_official_url)
}

# Per-session record of which unofficial sources have already been warned
# about, so the functions that read the cache warn once, not on every call.
.cvpa_state <- new.env(parent = emptyenv())
.cvpa_state$warned <- list()

# Warn when `url` is anything other than the official live data, and say how
# to get back to it. update_cvpa_data() warns on every call; the readers of
# the cache pass once = TRUE.
.cvpa_warn_unofficial <- function(url, once = FALSE, cached = FALSE) {
  if (.cvpa_is_official(url)) return(invisible(FALSE))
  if (once) {
    if (isTRUE(.cvpa_state$warned[[url]])) return(invisible(FALSE))
    .cvpa_state$warned[[url]] <- TRUE
  }
  what <- if (cached) {
    paste0("The cvpa data cached in ", cvpa_cache_dir(), " was downloaded from '", url, "'")
  } else {
    paste0("cvpa is using data from '", url, "'")
  }
  # Classed so it can be silenced on its own, without hiding other warnings:
  #   withCallingHandlers(expr, cvpa_unofficial_data = function(w) invokeRestart("muffleWarning"))
  rlang::warn(
    paste0(what, ", not the official live data at ", .cvpa_official_url, ".\n",
           "  It may be a subset or out of date, so don't report results from it as results from ",
           "the Canadian Voting and Policy Attitudes data.\n",
           "  To use the official data, run options(cvpa.data_url = NULL) and then update_cvpa_data()."),
    class = "cvpa_unofficial_data"
  )
  invisible(TRUE)
}

# update_cvpa_data() records where the cache came from, so the functions that
# only read the cache can warn if it holds anything but the official data.
.cvpa_path_source <- function() file.path(cvpa_cache_dir(), "cvpa_source.txt")

.cvpa_write_source <- function(url) {
  tryCatch(writeLines(url, .cvpa_path_source()), error = function(e) NULL)
}

.cvpa_check_cache_source <- function() {
  path <- .cvpa_path_source()
  if (!file.exists(path)) return(invisible(FALSE))
  url <- tryCatch(readLines(path, n = 1L, warn = FALSE), error = function(e) character(0))
  if (length(url) == 1L && nzchar(url)) .cvpa_warn_unofficial(url, once = TRUE, cached = TRUE)
  invisible(TRUE)
}

#' URL of the small example dataset bundled with cvpa
#'
#' cvpa ships a tiny copy of the hosted cp3 Parquet layout -- a handful of
#' questions (`bri_econ_013`, `env_econ_027`, `vote_choice`,
#' `vote_intention`) and a random sample of respondents from each survey
#' year -- so that the examples in the help pages can run without a network
#' connection. Point cvpa at it by setting the `cvpa.data_url` option to this
#' URL (and, so you don't touch your real cache, `cvpa.cache_dir` to a
#' temporary directory), then call [update_cvpa_data()] as usual.
#'
#' The example data is for illustration only: it is a subset, and estimates
#' from it are not estimates from the full data. Because it is not the
#' official data, [update_cvpa_data()] and the functions that read the cache
#' warn while it is in use. Undo with `options(cvpa.data_url = NULL)`, or
#' restore the options you saved.
#'
#' @return A `file://` URL (with a trailing slash) for the bundled example
#'   data, suitable for `options(cvpa.data_url = ...)`.
#' @examples
#' old <- options(
#'   cvpa.data_url = cvpa_example_url(),
#'   cvpa.cache_dir = tempfile("cvpa-cache-")
#' )
#' update_cvpa_data(questions = "bri_econ_013", quiet = TRUE)  # warns: example data
#' head(question_catalog(domain = "econ"))
#' unlink(getOption("cvpa.cache_dir"), recursive = TRUE)
#' options(old)
#' @export
cvpa_example_url <- function() {
  dir <- system.file("extdata", "cp3_example", package = "cvpa")
  if (!nzchar(dir)) {
    stop("The bundled example data was not found; try reinstalling cvpa.", call. = FALSE)
  }
  dir <- normalizePath(dir, winslash = "/", mustWork = TRUE)
  if (grepl("^[A-Za-z]:", dir)) dir <- paste0("/", dir)  # Windows drive letter
  # No percent-encoding: R's file:// downloader doesn't decode it, so a path
  # containing a space only works as-is.
  paste0("file://", dir, "/")
}

#' Local cache directory used by cvpa
#'
#' Where [update_cvpa_data()] stores downloaded Parquet files and every
#' other cvpa function reads them from. Defaults to a per-user cache
#' directory managed by R (see [tools::R_user_dir()]); override with
#' `options(cvpa.cache_dir = ...)`.
#'
#' @return The cache directory path (created if it doesn't exist yet).
#' @examples
#' # Point the cache at a temporary directory (the default is a per-user
#' # directory under tools::R_user_dir("cvpa", "cache")).
#' old <- options(cvpa.cache_dir = tempfile("cvpa-cache-"))
#' cvpa_cache_dir()
#' unlink(cvpa_cache_dir(), recursive = TRUE)
#' options(old)
#' @export
cvpa_cache_dir <- function() {
  dir <- getOption("cvpa.cache_dir", NULL)
  if (is.null(dir)) dir <- tools::R_user_dir("cvpa", "cache")
  if (!dir.exists(dir)) dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  dir
}

.cvpa_path_catalog <- function() file.path(cvpa_cache_dir(), "vbl_data.parquet")
.cvpa_path_code_labels <- function() file.path(cvpa_cache_dir(), "code_labels.parquet")
.cvpa_path_resp <- function(question) {
  file.path(cvpa_cache_dir(), "resp", paste0("question=", question), "data_0.parquet")
}

# A real Parquet file starts and ends with the 4-byte magic "PAR1". Checking
# both ends catches the two ways a download goes wrong without raising an
# error: an HTML error page served with a 200, and a truncated transfer.
.cvpa_is_parquet <- function(path) {
  size <- file.size(path)
  if (is.na(size) || size < 12) return(FALSE)
  magic <- charToRaw("PAR1")
  con <- file(path, "rb")
  on.exit(close(con))
  head <- readBin(con, "raw", 4)
  seek(con, size - 4)
  tail <- readBin(con, "raw", 4)
  identical(head, magic) && identical(tail, magic)
}

# Cache-busted single-file download. The query-string cache-buster mirrors
# app.js's DATA_VERSION fix (see the cvpa_dataset repo's
# code/rebuild/populate_db.R comment above its Parquet-export step) -- cheap
# insurance against a CDN edge cache serving a stale copy of a just-updated
# file right after a data refresh.
#
# Writes to a temporary file next to `dest` and only moves it into place
# once it has downloaded cleanly and checks out as Parquet, so a failed or
# partial download can never overwrite a good cached copy (it used to
# download straight onto `dest`, leaving a corrupt file behind on failure).
# Returns TRUE on success and FALSE on any failure, leaving `dest` untouched;
# callers decide whether a failure is fatal.
.cvpa_download_one <- function(url, dest, quiet = TRUE) {
  dir.create(dirname(dest), recursive = TRUE, showWarnings = FALSE)
  # Only web URLs get the cache-buster: for a file:// URL (a local mirror via
  # options(cvpa.data_url = ...)) the query string would become part of the
  # file name and the file would never be found.
  sep <- if (grepl("?", url, fixed = TRUE)) "&" else "?"
  bust_url <- if (grepl("^https?://", url)) paste0(url, sep, "t=", as.integer(Sys.time())) else url
  tmp <- tempfile(pattern = ".download-", tmpdir = dirname(dest), fileext = ".part")
  on.exit(unlink(tmp), add = TRUE)
  ok <- tryCatch(
    identical(
      suppressWarnings(utils::download.file(bust_url, tmp, mode = "wb", quiet = quiet)),
      0L
    ),
    error = function(e) FALSE
  )
  if (!ok || !.cvpa_is_parquet(tmp)) return(FALSE)
  file.rename(tmp, dest) || file.copy(tmp, dest, overwrite = TRUE)
}

#' Download or refresh cvpa's local cache of the cp3 policy-attitude data
#'
#' cvpa reads policy-attitude and vote data from Parquet files hosted
#' alongside the cp3 web app, not from data bundled in the package. Call
#' this first (and again whenever you want the latest data) before using
#' [question_catalog()], [question_data()], [wtd_response()], or
#' [response_gap_analysis()].
#'
#' The question catalog (`vbl_data.parquet`) and the demographic/party
#' value-label table (`code_labels.parquet`) are small and are always
#' refreshed. Per-question respondent-level data
#' (`resp/question=<code>/data_0.parquet`) is only fetched for the
#' questions you name in `questions` -- there are several hundred of these
#' across all domains, so nothing downloads them until you ask.
#'
#' @param questions Which questions' respondent-level data to fetch, in
#'   addition to the catalog: `NULL` (default) fetches none, or a character
#'   vector of specific question codes (see [question_catalog()]). There is
#'   deliberately no "fetch everything" option -- if you want the full
#'   dataset, download `dataset.parquet` from
#'   <https://github.com/lucasjacklucas/cvpa_dataset> instead.
#' @param force If `FALSE` (default), question files already in the cache
#'   are left alone. If `TRUE`, every requested file is re-downloaded.
#' @param quiet Suppress progress messages.
#' @details Downloads are written to a temporary file and checked to be
#'   valid Parquet before they replace anything in the cache, so a failed or
#'   interrupted download never leaves a corrupt file behind or overwrites a
#'   good one. If the catalog or the code labels can't be downloaded, this
#'   stops with an error (and your existing cached copies are untouched). If
#'   an individual *question* file can't be downloaded -- e.g. a question
#'   that is listed in the catalog but has no respondent-level data
#'   available -- it is skipped with a warning naming the question(s), and
#'   the rest are still fetched.
#'
#'   Data comes from the official live data,
#'   `https://policyattitudes.ca/cp3_parquet/`, unless you have changed
#'   `options(cvpa.data_url = ...)` (for example to a local mirror, or to the
#'   small example data from [cvpa_example_url()]). If you have, this warns on
#'   every call and the functions that read the cache warn too, because the
#'   data may be a subset or out of date; `options(cvpa.data_url = NULL)`
#'   restores the official URL.
#' @return Invisibly, `TRUE`, with an attribute `"skipped"` holding the
#'   question codes (if any) that could not be downloaded.
#' @examples
#' # These examples use the tiny example data bundled with cvpa, in a
#' # temporary cache, so they run offline and leave your own cache alone.
#' # For real analysis, skip the options() lines: by default cvpa downloads
#' # the official live data.
#' old <- options(
#'   cvpa.data_url = cvpa_example_url(),
#'   cvpa.cache_dir = tempfile("cvpa-cache-")
#' )
#'
#' update_cvpa_data()                                   # just the catalog
#' update_cvpa_data(questions = "bri_econ_013")         # + one question
#' update_cvpa_data(questions = c("vote_choice", "vote_intention"))
#' dir(cvpa_cache_dir(), recursive = TRUE)
#'
#' unlink(getOption("cvpa.cache_dir"), recursive = TRUE)
#' options(old)
#' @export
update_cvpa_data <- function(questions = NULL, force = FALSE, quiet = FALSE) {
  base <- .cvpa_data_base_url()
  .cvpa_warn_unofficial(base)

  # The catalog and code labels are required for everything else, so a
  # failure here is fatal -- but because downloads go through a temp file,
  # it leaves any previously cached copy exactly as it was.
  if (!quiet) message("Fetching question catalog (vbl_data.parquet)...")
  if (!.cvpa_download_one(paste0(base, "vbl_data.parquet"), .cvpa_path_catalog())) {
    stop("Could not download the question catalog from ", base,
         "\n  Your cached data (if any) has been left unchanged. ",
         "Check your connection, or options(cvpa.data_url).", call. = FALSE)
  }

  if (!quiet) message("Fetching code labels (code_labels.parquet)...")
  if (!.cvpa_download_one(paste0(base, "code_labels.parquet"), .cvpa_path_code_labels())) {
    stop("Could not download the code labels from ", base,
         "\n  Your cached data (if any) has been left unchanged. ",
         "Check your connection, or options(cvpa.data_url).", call. = FALSE)
  }
  .cvpa_write_source(base)

  skipped <- character(0)
  if (!is.null(questions)) {
    if (identical(questions, "all")) {
      stop("questions = \"all\" is no longer supported; name the question codes you ",
           "need (see question_catalog()).\n  To get the full dataset, download ",
           "dataset.parquet from https://github.com/lucasjacklucas/cvpa_dataset",
           call. = FALSE)
    }
    cat_df <- .cvpa_catalog_raw(check_source = FALSE)
    bad <- setdiff(questions, unique(cat_df$question))
    if (length(bad) > 0) {
      stop("Unknown question code(s): ", paste(bad, collapse = ", "),
           "\n  See question_catalog() for valid codes.", call. = FALSE)
    }
    have <- vapply(questions, function(q) file.exists(.cvpa_path_resp(q)), logical(1))
    todo <- if (force) questions else questions[!have]
    n <- length(todo)
    if (!quiet && n > 0) message(sprintf("Fetching %d question file(s)...", n))
    for (i in seq_along(todo)) {
      q <- todo[i]
      if (!quiet) message(sprintf("  [%d/%d] %s", i, n, q))
      url <- paste0(base, "resp/question=", utils::URLencode(q, reserved = TRUE), "/data_0.parquet")
      if (!.cvpa_download_one(url, .cvpa_path_resp(q))) skipped <- c(skipped, q)
    }
    if (!quiet && n == 0) message("All requested question files already cached (use force = TRUE to re-fetch).")
    if (length(skipped) > 0) {
      warning(sprintf(
        "Could not download data for %d question(s), which were skipped: %s\n  They are listed in the catalog but may have no respondent-level data available.",
        length(skipped), paste(skipped, collapse = ", ")), call. = FALSE)
    }
  }
  res <- TRUE
  attr(res, "skipped") <- skipped
  invisible(res)
}

# Every function that reads the cache goes through here, so this is also
# where they warn (once per session) if the cache holds anything other than
# the official live data.
.cvpa_require_cache <- function(path, what, hint, check_source = TRUE) {
  if (!file.exists(path)) {
    stop(what, " is not cached yet. Run ", hint, " first (see ?update_cvpa_data).",
         call. = FALSE)
  }
  if (check_source) .cvpa_check_cache_source()
}

# Full (un-deduplicated, one row per question x survey_id x type) catalog,
# read fresh from the local cache every call -- it's small (a few thousand
# rows) so there's no need for an in-memory cache on top of the file one.
.cvpa_catalog_raw <- function(check_source = TRUE) {
  path <- .cvpa_path_catalog()
  .cvpa_require_cache(path, "The question catalog", "update_cvpa_data()",
                      check_source = check_source)
  cat_df <- nanoparquet::read_parquet(path)
  # Two wordings in the published catalog (ces_dpin_016, env_intd_012) have
  # their quotation marks escaped repeatedly upstream, so each quote arrives
  # as a run of four quote characters instead of one -- an artifact of the
  # source CSV. Collapse any run of 2+ quotes back to one, here where every
  # function reads the catalog, so it can't leak into question_catalog()
  # output. Checked against the whole catalog: those two are the only
  # wordings containing any quote character at all, so nothing legitimate is
  # affected, and this is a harmless no-op once the source is fixed.
  cat_df$question_wording <- gsub('"{2,}', '"', cat_df$question_wording)
  cat_df
}

.cvpa_code_labels <- function() {
  path <- .cvpa_path_code_labels()
  .cvpa_require_cache(path, "The code-labels table", "update_cvpa_data()")
  nanoparquet::read_parquet(path)
}

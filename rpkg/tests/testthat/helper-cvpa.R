# Helpers shared by the test files. Nothing here touches the network or the
# user's real cache: every test runs against the small example data bundled in
# inst/extdata/cp3_example (via cvpa_example_url()) in a throwaway cache
# directory, or against a tampered copy of it ("mirror") built in a tempdir.

# Run `expr` with the "not the official data" warning muffled. That warning
# is intended (every test mirror is unofficial) and is tested on its own in
# test-unofficial-data.R; this keeps it from drowning out the warnings a test
# is actually about.
quiet_unofficial <- function(expr) {
  withCallingHandlers(
    expr,
    cvpa_unofficial_data = function(w) invokeRestart("muffleWarning")
  )
}

# Forget which unofficial sources have already been warned about, so each
# test starts as if it were a fresh R session.
reset_unofficial_warnings <- function() {
  assign("warned", list(), envir = cvpa:::.cvpa_state)
}

# Point cvpa at `url` with a fresh empty cache, undone when the calling test
# (or `env`) finishes. Returns the cache directory.
local_cvpa_source <- function(url = cvpa_example_url(), env = parent.frame()) {
  cache <- withr::local_tempdir("cvpa-cache-", .local_envir = env)
  withr::local_options(cvpa.data_url = url, cvpa.cache_dir = cache, .local_envir = env)
  reset_unofficial_warnings()
  withr::defer(reset_unofficial_warnings(), envir = env)
  cache
}

# local_cvpa_source() + download the catalog, code labels and `questions`.
local_cvpa_example <- function(questions = NULL, env = parent.frame()) {
  cache <- local_cvpa_source(env = env)
  quiet_unofficial(update_cvpa_data(questions = questions, quiet = TRUE))
  reset_unofficial_warnings()
  invisible(cache)
}

# A writable copy of the example data, for tests that tamper with it (corrupt
# a file, remove one, edit the catalog). Returns its file:// URL.
local_mirror <- function(env = parent.frame()) {
  dir <- withr::local_tempdir("cvpa-mirror-", .local_envir = env)
  src <- system.file("extdata", "cp3_example", package = "cvpa")
  file.copy(list.files(src, full.names = TRUE), dir, recursive = TRUE)
  path <- normalizePath(dir, winslash = "/")
  if (grepl("^[A-Za-z]:", path)) path <- paste0("/", path)  # Windows drive letter
  attr(dir, "url") <- paste0("file://", path, "/")
  dir
}
mirror_url <- function(mirror) attr(mirror, "url")

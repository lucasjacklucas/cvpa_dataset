test_that("cvpa_cache_dir() honours the cvpa.cache_dir option and creates the directory", {
  dir <- file.path(withr::local_tempdir(), "nested", "cache")
  withr::local_options(cvpa.cache_dir = dir)
  expect_false(dir.exists(dir))
  expect_equal(cvpa_cache_dir(), dir)
  expect_true(dir.exists(dir))
})

test_that("cvpa_cache_dir() falls back to R's per-user cache directory", {
  base <- withr::local_tempdir()
  withr::local_envvar(R_USER_CACHE_DIR = base)
  withr::local_options(cvpa.cache_dir = NULL)
  expect_equal(normalizePath(cvpa_cache_dir()), normalizePath(file.path(base, "R", "cvpa")))
})

test_that(".cvpa_is_parquet() accepts real files and rejects everything else", {
  good <- file.path(system.file("extdata", "cp3_example", package = "cvpa"), "code_labels.parquet")
  expect_true(cvpa:::.cvpa_is_parquet(good))

  # Truncated transfer: starts like Parquet, doesn't end like it.
  bytes <- readBin(good, "raw", file.size(good))
  truncated <- withr::local_tempfile()
  writeBin(bytes[seq_len(length(bytes) %/% 2)], truncated)
  expect_false(cvpa:::.cvpa_is_parquet(truncated))

  # An HTML error page served with a 200.
  html <- withr::local_tempfile()
  writeLines("<html><body>404 Not Found</body></html>", html)
  expect_false(cvpa:::.cvpa_is_parquet(html))

  tiny <- withr::local_tempfile()
  writeBin(charToRaw("PAR1"), tiny)
  expect_false(cvpa:::.cvpa_is_parquet(tiny))
  expect_false(cvpa:::.cvpa_is_parquet(file.path(tempdir(), "does-not-exist")))
})

test_that(".cvpa_download_one() writes a valid file and leaves no temp files behind", {
  src <- file.path(system.file("extdata", "cp3_example", package = "cvpa"), "code_labels.parquet")
  dest_dir <- withr::local_tempdir()
  dest <- file.path(dest_dir, "sub", "code_labels.parquet")
  expect_true(cvpa:::.cvpa_download_one(paste0("file://", src), dest))
  expect_true(cvpa:::.cvpa_is_parquet(dest))
  expect_equal(unname(tools::md5sum(dest)), unname(tools::md5sum(src)))
  expect_identical(list.files(dirname(dest), all.files = TRUE, no.. = TRUE), "code_labels.parquet")
})

test_that(".cvpa_download_one() never replaces a good file with a failed or bogus download", {
  src <- file.path(system.file("extdata", "cp3_example", package = "cvpa"), "code_labels.parquet")
  dest <- file.path(withr::local_tempdir(), "code_labels.parquet")
  file.copy(src, dest)
  before <- unname(tools::md5sum(dest))

  # Source doesn't exist.
  expect_false(cvpa:::.cvpa_download_one("file:///no/such/file.parquet", dest))
  expect_equal(unname(tools::md5sum(dest)), before)

  # Source downloads fine but is an HTML page, not Parquet.
  html <- withr::local_tempfile(fileext = ".parquet")
  writeLines("<html>Not Found</html>", html)
  expect_false(cvpa:::.cvpa_download_one(paste0("file://", html), dest))
  expect_equal(unname(tools::md5sum(dest)), before)

  expect_identical(list.files(dirname(dest), all.files = TRUE, no.. = TRUE), "code_labels.parquet")
})

test_that("update_cvpa_data() fetches the catalog and code labels, and records where they came from", {
  cache <- local_cvpa_source()
  res <- quiet_unofficial(update_cvpa_data(quiet = TRUE))
  expect_true(res)
  expect_identical(attr(res, "skipped"), character(0))
  expect_true(file.exists(file.path(cache, "vbl_data.parquet")))
  expect_true(file.exists(file.path(cache, "code_labels.parquet")))
  expect_false(dir.exists(file.path(cache, "resp")))  # no questions asked for
  expect_equal(readLines(file.path(cache, "cvpa_source.txt")), cvpa_example_url())
})

test_that("update_cvpa_data() returns invisibly and reports progress unless quiet", {
  local_cvpa_source()
  expect_invisible(quiet_unofficial(update_cvpa_data(quiet = TRUE)))
  expect_message(quiet_unofficial(update_cvpa_data()), "Fetching question catalog")
})

test_that("update_cvpa_data() fetches only the questions asked for, and skips ones already cached", {
  cache <- local_cvpa_source()
  quiet_unofficial(update_cvpa_data(questions = "bri_econ_013", quiet = TRUE))
  f <- file.path(cache, "resp", "question=bri_econ_013", "data_0.parquet")
  expect_true(file.exists(f))
  expect_false(dir.exists(file.path(cache, "resp", "question=vote_choice")))

  # Not forced: a cached file is left alone, even if it has been altered...
  writeLines("altered", f)
  expect_message(
    quiet_unofficial(update_cvpa_data(questions = "bri_econ_013")),
    "already cached"
  )
  expect_equal(readLines(f), "altered")

  # ...but force = TRUE re-downloads it.
  quiet_unofficial(update_cvpa_data(questions = "bri_econ_013", force = TRUE, quiet = TRUE))
  expect_true(cvpa:::.cvpa_is_parquet(f))
})

test_that("update_cvpa_data() rejects unknown questions and questions = 'all'", {
  local_cvpa_source()
  expect_error(
    quiet_unofficial(update_cvpa_data(questions = "not_a_question", quiet = TRUE)),
    "Unknown question code.*not_a_question"
  )
  expect_error(
    quiet_unofficial(update_cvpa_data(questions = "all", quiet = TRUE)),
    "no longer supported"
  )
})

test_that("update_cvpa_data() skips a question whose file is missing, warning and reporting it", {
  mirror <- local_mirror()
  unlink(file.path(mirror, "resp", "question=env_econ_027"), recursive = TRUE)
  cache <- local_cvpa_source(mirror_url(mirror))

  expect_warning(
    res <- quiet_unofficial(
      update_cvpa_data(questions = c("bri_econ_013", "env_econ_027"), quiet = TRUE)
    ),
    "env_econ_027"
  )
  expect_identical(attr(res, "skipped"), "env_econ_027")
  # The question that does exist was still fetched.
  expect_true(file.exists(file.path(cache, "resp", "question=bri_econ_013", "data_0.parquet")))
  expect_false(file.exists(file.path(cache, "resp", "question=env_econ_027", "data_0.parquet")))
})

test_that("a bad catalog download is an error and leaves the existing cache untouched", {
  cache <- local_cvpa_example(questions = "bri_econ_013")
  before <- tools::md5sum(file.path(cache, c("vbl_data.parquet", "code_labels.parquet")))

  mirror <- local_mirror()
  writeLines("<html>Not Found</html>", file.path(mirror, "vbl_data.parquet"))
  withr::local_options(cvpa.data_url = mirror_url(mirror))
  expect_error(
    quiet_unofficial(update_cvpa_data(quiet = TRUE)),
    "Could not download the question catalog"
  )
  expect_equal(tools::md5sum(file.path(cache, c("vbl_data.parquet", "code_labels.parquet"))), before)
})

test_that("a bad code-labels download is an error and leaves the existing cache untouched", {
  cache <- local_cvpa_example()
  before <- tools::md5sum(file.path(cache, "code_labels.parquet"))

  mirror <- local_mirror()
  writeLines("<html>Not Found</html>", file.path(mirror, "code_labels.parquet"))
  withr::local_options(cvpa.data_url = mirror_url(mirror))
  expect_error(
    quiet_unofficial(update_cvpa_data(quiet = TRUE)),
    "Could not download the code labels"
  )
  expect_equal(tools::md5sum(file.path(cache, "code_labels.parquet")), before)
})

test_that("a failed update does not record a new source for the cache", {
  cache <- local_cvpa_example()
  mirror <- local_mirror()
  writeLines("<html>Not Found</html>", file.path(mirror, "vbl_data.parquet"))
  withr::local_options(cvpa.data_url = mirror_url(mirror))
  try(quiet_unofficial(update_cvpa_data(quiet = TRUE)), silent = TRUE)
  expect_equal(readLines(file.path(cache, "cvpa_source.txt")), cvpa_example_url())
})

test_that("a local mirror in a directory whose path contains a space works", {
  mirror <- local_mirror()
  spaced <- file.path(dirname(mirror), "mirror with space")
  file.rename(mirror, spaced)
  path <- normalizePath(spaced, winslash = "/")
  if (grepl("^[A-Za-z]:", path)) path <- paste0("/", path)
  cache <- local_cvpa_source(paste0("file://", path, "/"))
  quiet_unofficial(update_cvpa_data(questions = "vote_choice", quiet = TRUE))
  expect_true(file.exists(file.path(cache, "resp", "question=vote_choice", "data_0.parquet")))
})

test_that("functions that read the cache say so when nothing has been downloaded", {
  local_cvpa_source()
  expect_error(question_catalog(), "not cached yet.*update_cvpa_data")
  expect_error(question_response_labels("vote_choice"), "not cached yet")
  expect_error(question_data("bri_econ_013"), "not cached yet.*update_cvpa_data")
})

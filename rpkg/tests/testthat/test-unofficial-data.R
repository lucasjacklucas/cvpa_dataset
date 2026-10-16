# Anything other than the official live data must warn, and say how to get
# back to it.

official <- "https://policyattitudes.ca/cp3_parquet/"

test_that("the official URL is the default and is recognised, with or without a trailing slash", {
  withr::local_options(cvpa.data_url = NULL)
  expect_identical(cvpa:::.cvpa_data_base_url(), official)
  expect_true(cvpa:::.cvpa_is_official(official))
  expect_true(cvpa:::.cvpa_is_official("https://policyattitudes.ca/cp3_parquet"))
  expect_false(cvpa:::.cvpa_is_official("https://quantoid.ca/cp3_parquet/"))
  expect_false(cvpa:::.cvpa_is_official(cvpa_example_url()))
})

test_that("the official URL never triggers the warning", {
  reset_unofficial_warnings()
  expect_no_warning(cvpa:::.cvpa_warn_unofficial(official))
  expect_no_warning(cvpa:::.cvpa_warn_unofficial(official, once = TRUE, cached = TRUE))
  expect_false(cvpa:::.cvpa_warn_unofficial(official))
})

test_that("update_cvpa_data() warns on every call when the URL is unofficial, and points to the official one", {
  local_cvpa_source()
  w <- expect_warning(update_cvpa_data(quiet = TRUE), class = "cvpa_unofficial_data")
  msg <- conditionMessage(w)
  expect_match(msg, official, fixed = TRUE)
  expect_match(msg, "options(cvpa.data_url = NULL)", fixed = TRUE)
  expect_match(msg, "update_cvpa_data()", fixed = TRUE)
  expect_match(msg, cvpa_example_url(), fixed = TRUE)
  # Not once-per-session: it warns again on the next call.
  expect_warning(update_cvpa_data(quiet = TRUE), class = "cvpa_unofficial_data")
})

test_that("the unofficial-data warning can be silenced without hiding other warnings", {
  mirror <- local_mirror()
  unlink(file.path(mirror, "resp", "question=env_econ_027"), recursive = TRUE)
  local_cvpa_source(mirror_url(mirror))
  # The skipped-question warning gets through; the unofficial one is muffled.
  expect_warning(
    quiet_unofficial(update_cvpa_data(questions = "env_econ_027", quiet = TRUE)),
    "Could not download data for 1 question"
  )
})

test_that("functions that read the cache warn, once per session, when it came from an unofficial source", {
  local_cvpa_example(questions = "bri_econ_013")

  w <- expect_warning(question_catalog(), class = "cvpa_unofficial_data")
  expect_match(conditionMessage(w), "cached in")
  expect_match(conditionMessage(w), official, fixed = TRUE)

  # Already warned about this source: every reader is now quiet.
  expect_no_warning(question_catalog())
  expect_no_warning(question_data("bri_econ_013"))
  expect_no_warning(question_response_labels("bri_econ_013"))

  # A new session (state reset) warns again.
  reset_unofficial_warnings()
  expect_warning(question_data("bri_econ_013"), class = "cvpa_unofficial_data")
})

test_that("each reader of the cache triggers the warning", {
  for (reader in list(
    function() question_catalog(),
    function() question_response_labels("vote_choice"),
    function() question_data("vote_choice")
  )) {
    local_cvpa_example(questions = "vote_choice")
    expect_warning(reader(), class = "cvpa_unofficial_data")
  }
})

test_that("a cache recorded as official data does not warn", {
  cache <- local_cvpa_example(questions = "bri_econ_013")
  writeLines(official, file.path(cache, "cvpa_source.txt"))
  expect_no_warning(question_catalog())
  expect_no_warning(question_data("bri_econ_013"))
})

test_that("a cache with no recorded source (e.g. from an older cvpa) does not warn", {
  cache <- local_cvpa_example(questions = "bri_econ_013")
  unlink(file.path(cache, "cvpa_source.txt"))
  expect_no_warning(question_catalog())
  expect_no_warning(question_data("bri_econ_013"))
})

test_that("an unreadable or empty source record is ignored rather than causing an error", {
  cache <- local_cvpa_example()
  writeLines("", file.path(cache, "cvpa_source.txt"))
  expect_no_warning(question_catalog())
})

test_that("resetting the option to NULL restores the official URL", {
  withr::local_options(cvpa.data_url = cvpa_example_url())
  expect_false(cvpa:::.cvpa_is_official(cvpa:::.cvpa_data_base_url()))
  options(cvpa.data_url = NULL)
  expect_identical(cvpa:::.cvpa_data_base_url(), official)
})

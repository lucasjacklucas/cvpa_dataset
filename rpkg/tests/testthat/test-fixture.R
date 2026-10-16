# The bundled example data has to be self-consistent, or every example and
# test built on it is suspect.

test_that("the example data is bundled and cvpa_example_url() points at it", {
  url <- cvpa_example_url()
  expect_match(url, "^file://")
  expect_match(url, "/$")
  dir <- system.file("extdata", "cp3_example", package = "cvpa")
  expect_true(nzchar(dir))
  for (f in c("vbl_data.parquet", "code_labels.parquet")) {
    expect_true(file.exists(file.path(dir, f)), info = f)
    expect_true(cvpa:::.cvpa_is_parquet(file.path(dir, f)), info = f)
  }
})

test_that("every catalogued example question has a respondent-level file", {
  dir <- system.file("extdata", "cp3_example", package = "cvpa")
  catalog <- nanoparquet::read_parquet(file.path(dir, "vbl_data.parquet"))
  for (q in unique(catalog$question)) {
    f <- file.path(dir, "resp", paste0("question=", q), "data_0.parquet")
    expect_true(file.exists(f), info = q)
    expect_true(cvpa:::.cvpa_is_parquet(f), info = q)
  }
})

test_that("the example respondent files have the documented columns", {
  dir <- system.file("extdata", "cp3_example", package = "cvpa")
  f <- file.path(dir, "resp", "question=bri_econ_013", "data_0.parquet")
  d <- nanoparquet::read_parquet(f)
  expect_true(all(c("response", "weight", "year", cvpa_grouping_vars) %in% names(d)))
  expect_gt(nrow(d), 0)
  expect_false(anyNA(d$weight))
  expect_gt(min(d$weight), 0)
})

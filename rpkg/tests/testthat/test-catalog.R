test_that("question_catalog() has one row per question with the documented columns", {
  local_cvpa_example()
  cat_df <- suppressWarnings(question_catalog())
  expect_s3_class(cat_df, "data.frame")
  expect_setequal(
    names(cat_df),
    c("question", "domain", "domain_label", "issue_label", "question_wording",
      "n_waves", "type", "value_labels")
  )
  expect_setequal(cat_df$question, c("bri_econ_013", "env_econ_027", "vote_choice", "vote_intention"))
  expect_false(anyDuplicated(cat_df$question) > 0)
  expect_true(all(cat_df$n_waves >= 1))
  expect_identical(rownames(cat_df), as.character(seq_len(nrow(cat_df))))
  expect_equal(
    cat_df$type[cat_df$question == "bri_econ_013"], "lsm"
  )
  expect_equal(
    cat_df$value_labels[cat_df$question == "bri_econ_013"], "Less, Same, More"
  )
})

test_that("question_catalog() n_waves counts the surveys that asked the question", {
  local_cvpa_example()
  raw <- nanoparquet::read_parquet(file.path(cvpa_cache_dir(), "vbl_data.parquet"))
  cat_df <- suppressWarnings(question_catalog())
  for (q in cat_df$question) {
    expect_equal(cat_df$n_waves[cat_df$question == q], sum(raw$question == q), info = q)
  }
})

test_that("question_catalog() filters by domain and type, and rejects unknown values", {
  local_cvpa_example()
  econ <- suppressWarnings(question_catalog(domain = "econ"))
  expect_setequal(econ$question, c("bri_econ_013", "env_econ_027"))
  expect_true(all(econ$domain == "econ"))

  party <- suppressWarnings(question_catalog(type = "party"))
  expect_setequal(party$question, c("vote_choice", "vote_intention"))

  both <- suppressWarnings(question_catalog(domain = "econ", type = "lsm"))
  expect_equal(both$question, "bri_econ_013")

  expect_error(suppressWarnings(question_catalog(domain = "nonsense")), "Unknown domain.*nonsense")
  expect_error(suppressWarnings(question_catalog(type = "nonsense")), "Unknown type.*nonsense")
  expect_error(suppressWarnings(question_catalog(domain = c("econ", "nonsense"))), "nonsense")
})

test_that("question_catalog() collapses repeated quotation marks in wordings", {
  mirror <- local_mirror()
  raw <- nanoparquet::read_parquet(file.path(mirror, "vbl_data.parquet"))
  raw$question_wording[raw$question == "bri_econ_013"] <- 'Do you \"\"\"\"agree\"\"\"\" with it?'
  raw$question_wording[raw$question == "vote_choice"] <- 'Plain wording, no quotes'
  nanoparquet::write_parquet(raw, file.path(mirror, "vbl_data.parquet"))
  local_cvpa_source(mirror_url(mirror))
  quiet_unofficial(update_cvpa_data(quiet = TRUE))

  cat_df <- suppressWarnings(question_catalog())
  expect_equal(cat_df$question_wording[cat_df$question == "bri_econ_013"], 'Do you "agree" with it?')
  expect_equal(cat_df$question_wording[cat_df$question == "vote_choice"], "Plain wording, no quotes")
})

test_that("question_response_labels() decodes b/lsm questions positionally and party questions from code_labels", {
  local_cvpa_example()
  lsm <- suppressWarnings(question_response_labels("bri_econ_013"))
  expect_equal(lsm$code, c(-1, 0, 1))
  expect_equal(lsm$label, c("Less", "Same", "More"))
  expect_equal(lsm$sort_order, 1:3)

  b <- suppressWarnings(question_response_labels("env_econ_027"))
  expect_equal(b$code, c(0, 1))
  expect_equal(b$label, c("Disagree", "Agree"))

  party <- suppressWarnings(question_response_labels("vote_choice"))
  expect_named(party, c("code", "label", "sort_order"))
  expect_equal(party$label[1], "Liberal")
  expect_false(is.unsorted(party$sort_order))
  expect_gt(nrow(party), 5)

  expect_error(suppressWarnings(question_response_labels("not_a_question")), "Unknown question code")
})

test_that("question_data() returns decoded respondent-level data", {
  local_cvpa_example(questions = "bri_econ_013")
  d <- suppressWarnings(question_data("bri_econ_013"))
  expect_s3_class(d, "data.frame")
  expect_gt(nrow(d), 0)
  expect_true(all(c("response", "weight", "year", "response_id", "survey_id", cvpa_grouping_vars) %in% names(d)))

  expect_s3_class(d$response, "factor")
  expect_equal(levels(d$response), c("Less", "Same", "More"))
  expect_true(is.numeric(d$weight))
  expect_true(all(d$weight > 0))

  for (v in intersect(cvpa_grouping_vars, names(d))) {
    expect_s3_class(d[[v]], "factor")
  }
  expect_equal(levels(d$gender), c("Man", "Woman"))
  expect_equal(
    levels(d$region),
    c("Atlantic", "Quebec", "Ontario", "Prairies", "British Columbia", "North")
  )
})

test_that("decoding labels every demographic, and loses no values where every code has a label", {
  # Regression: code_labels once labelled gender as 'woman' while the data
  # column is 'gender', so every gender value decoded to NA and any analysis
  # grouped by gender came back empty.
  #
  # Some codes are deliberately left unlabelled so they decode to NA (vote
  # 95-98, religion 97/99, language 98/99: don't-know / unclassifiable /
  # other; see code/rebuild/populate_db.R), so only the variables without
  # any such codes are held to "no value is lost".
  has_unlabelled_codes <- c("vote_intention", "vote_choice", "religion", "language")
  qs <- c("bri_econ_013", "env_econ_027", "vote_choice", "vote_intention")
  local_cvpa_example(questions = qs)
  for (q in qs) {
    raw <- suppressWarnings(question_data(q, decode = FALSE))
    dec <- suppressWarnings(question_data(q))
    for (v in intersect(cvpa_grouping_vars, names(raw))) {
      if (all(is.na(raw[[v]]))) next  # variable not collected in these surveys
      info <- paste(q, v)
      expect_true(any(!is.na(dec[[v]])), info = paste("decodes to all NA:", info))
      if (!v %in% has_unlabelled_codes) {
        expect_equal(sum(is.na(dec[[v]])), sum(is.na(raw[[v]])), info = info)
      }
    }
    expect_true(any(!is.na(dec$response)), info = paste(q, "response"))
  }
})

test_that("code_labels uses the same variable names as the respondent columns", {
  local_cvpa_example()
  labelled <- unique(suppressWarnings(cvpa:::.cvpa_code_labels())$variable)
  expect_true("gender" %in% labelled)
  expect_false("woman" %in% labelled)
  demographics <- setdiff(cvpa_grouping_vars, c("vote_intention", "vote_choice"))
  expect_true(all(demographics %in% labelled), info = paste(setdiff(demographics, labelled), collapse = ", "))
})

test_that("decode = FALSE returns the raw numeric codes", {
  local_cvpa_example(questions = "bri_econ_013")
  raw <- suppressWarnings(question_data("bri_econ_013", decode = FALSE))
  expect_true(is.numeric(raw$response))
  expect_setequal(unique(na.omit(raw$response)), c(-1, 0, 1))
  expect_true(is.numeric(raw$gender))
  expect_setequal(unique(na.omit(raw$gender)), c(0, 1))
})

test_that("question_data() filters by year", {
  local_cvpa_example(questions = "bri_econ_013")
  all <- suppressWarnings(question_data("bri_econ_013"))
  yrs <- sort(unique(all$year))
  some <- suppressWarnings(question_data("bri_econ_013", years = yrs[1:2]))
  expect_setequal(some$year, yrs[1:2])
  expect_equal(nrow(some), sum(all$year %in% yrs[1:2]))
  expect_equal(nrow(suppressWarnings(question_data("bri_econ_013", years = 1800))), 0)
})

test_that("party questions decode to party names", {
  local_cvpa_example(questions = "vote_choice")
  vc <- suppressWarnings(question_data("vote_choice"))
  expect_s3_class(vc$response, "factor")
  expect_true("Liberal" %in% levels(vc$response))
  expect_true(all(levels(droplevels(vc$response)) %in% suppressWarnings(question_response_labels("vote_choice"))$label))
})

test_that("question_data() names the question and the fix when it isn't cached", {
  local_cvpa_example()  # catalog only, no question files
  expect_error(
    suppressWarnings(question_data("env_econ_027")),
    "Question 'env_econ_027' is not cached yet.*update_cvpa_data\\(questions = \"env_econ_027\"\\)"
  )
})

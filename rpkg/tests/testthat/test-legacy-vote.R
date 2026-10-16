# The original vote-choice/intention path, unchanged since before 0.2.0.

test_that("vote_data is the documented shape", {
  data("vote_data", package = "cvpa", envir = environment())
  expect_s3_class(vote_data, "data.frame")
  expect_true(all(c("type", "vote", "year", "gender", "weight") %in% names(vote_data)))
  expect_setequal(unique(vote_data$type), c("choice", "intention"))
})

test_that("wtd_vote() defaults to every year in the data", {
  data("vote_data", package = "cvpa", envir = environment())
  res <- wtd_vote(vote_data, "intention")
  # Every year with a recorded (non-missing, decided) intention is reported;
  # a year with only missing votes (2012, 2013) has nothing to report.
  has_vote <- vote_data$type == "intention" & !is.na(vote_data$vote) & vote_data$vote != "Undecided"
  expect_equal(sort(unique(res$year)), sort(unique(vote_data$year[has_vote])))
  # Regression: the old default of 1945:2023 silently dropped later years.
  expect_equal(max(res$year), max(vote_data$year[vote_data$type == "intention"]))
})

test_that("wtd_vote() shares sum to 1 within each year and group", {
  data("vote_data", package = "cvpa", envir = environment())
  res <- wtd_vote(vote_data, "intention", years = 2000:2022, grouping_vars = "gender")
  totals <- tapply(res$party_support, list(res$year, res$gender), sum)
  expect_true(all(abs(totals[!is.na(totals)] - 1) < 1e-8))
})

test_that("wtd_vote() reports unavailable years", {
  data("vote_data", package = "cvpa", envir = environment())
  expect_message(wtd_vote(vote_data, "intention", years = c(2000, 2012)), "not available: 2012")
})

test_that("gap_analysis() includes the latest year by default and returns a sane test", {
  data("vote_data", package = "cvpa", envir = environment())
  res <- gap_analysis(vote_data, "intention", grouping_var = "gender")
  expect_gt(nrow(res), 0)
  expect_true(all(res$p.value >= 0 & res$p.value <= 1))
  expect_true(all(c("cnt_Man", "cnt_Woman", "estimate1", "estimate2", "diff") %in% names(res)))
  # Regression: the old default of 1945:2022 dropped 2023 from gap_analysis().
  expect_equal(max(res$year), max(vote_data$year[vote_data$type == "intention"]))
})

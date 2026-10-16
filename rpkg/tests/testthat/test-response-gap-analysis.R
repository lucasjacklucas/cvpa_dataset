gap_example <- function() {
  local_cvpa_example(questions = "bri_econ_013", env = parent.frame())
  suppressWarnings(question_data("bri_econ_013"))
}

test_that("response_gap_analysis() returns a test for every year and response category", {
  d <- gap_example()
  res <- response_gap_analysis(d, grouping_var = "gender")
  expect_gt(nrow(res), 0)
  expect_true(all(c("year", "response", "cnt_Man", "cnt_Woman", "n_Man", "n_Woman", "flag",
                    "estimate1", "estimate2", "p.value", "conf.low", "conf.high", "diff") %in% names(res)))
  expect_true(all(res$p.value >= 0 & res$p.value <= 1))
  expect_true(all(res$conf.low < res$conf.high))
  expect_true(all(res$conf.low <= res$diff & res$diff <= res$conf.high))
  expect_true(all(res$flag %in% c("p-val reliable", "p-val unreliable")))
})

test_that("response_gap_analysis() estimates are the weighted shares, and diff is group 2 minus group 1", {
  d <- gap_example()
  res <- response_gap_analysis(d, grouping_var = "gender")
  shares <- wtd_response(d, grouping_vars = "gender")
  row <- res[res$year == res$year[1] & res$response == "More", ]
  man <- shares[shares$year == row$year & shares$response == "More" & shares$gender == "Man", ]
  woman <- shares[shares$year == row$year & shares$response == "More" & shares$gender == "Woman", ]
  expect_equal(row$estimate1, man$response_share)
  expect_equal(row$estimate2, woman$response_share)
  expect_equal(row$diff, woman$response_share - man$response_share)
  expect_equal(row$cnt_Man, man$count)
  expect_equal(row$cnt_Woman, woman$count)
})

test_that("response_gap_analysis() matches an independent prop.test", {
  d <- gap_example()
  res <- response_gap_analysis(d, grouping_var = "gender")
  r <- res[1, ]
  ref <- stats::prop.test(c(r$cnt_Man, r$cnt_Woman), c(r$n_Man, r$n_Woman))
  expect_equal(r$p.value, ref$p.value)
  # prop.test()'s interval is for p1 - p2; ours is for diff = p2 - p1, i.e.
  # the negated interval with its limits swapped. (Regression: the limits
  # were negated but not swapped, so conf.low was above conf.high.)
  expect_equal(r$conf.low, -ref$conf.int[2])
  expect_equal(r$conf.high, -ref$conf.int[1])
})

test_that("response_gap_analysis() needs exactly two groups, or `levels` to pick two", {
  d <- gap_example()
  expect_error(response_gap_analysis(d, grouping_var = "region"), "only two levels")
  res <- response_gap_analysis(d, grouping_var = "region", levels = c("Ontario", "Quebec"))
  expect_true(all(c("cnt_Ontario", "cnt_Quebec") %in% names(res)))
  expect_error(
    response_gap_analysis(d, grouping_var = "region", levels = c("Ontario", "Narnia")),
    "Narnia is not among"
  )
})

test_that("response_gap_analysis() restricts to years and errors when none have data", {
  d <- gap_example()
  yr <- sort(unique(d$year))[1]
  res <- response_gap_analysis(d, grouping_var = "gender", years = yr)
  expect_equal(unique(res$year), yr)
  expect_error(
    suppressMessages(response_gap_analysis(d, grouping_var = "gender", years = 1800)),
    "No data available"
  )
})

test_that("make_flag() flags small expected counts", {
  expect_equal(make_flag(c(30, 40), c(100, 120)), "p-val reliable")
  expect_equal(make_flag(c(2, 3), c(10, 20)), "p-val unreliable")
  # Exactly 5 expected in every cell is still reliable (the rule is "< 5").
  expect_equal(make_flag(c(5, 5), c(10, 10)), "p-val reliable")
  expect_equal(make_flag(c(4, 4), c(10, 10)), "p-val unreliable")
})

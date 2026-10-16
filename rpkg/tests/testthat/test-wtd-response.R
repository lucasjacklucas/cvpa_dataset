# Hand-built data: every number below can be checked by eye.
toy <- function() {
  data.frame(
    year     = c(2000, 2000, 2000, 2000, 2004, 2004),
    response = factor(c("a", "a", "b", "b", "a", "b")),
    weight   = c(1, 2, 3, 4, 5, 5),
    gender   = factor(c("Man", "Woman", "Man", "Woman", "Man", "Man"))
  )
}

test_that("wtd_response() computes weighted shares by year", {
  res <- wtd_response(toy())
  a2000 <- res[res$year == 2000 & res$response == "a", ]
  expect_equal(a2000$count, 3)            # weights 1 + 2
  expect_equal(a2000$response_share, 3 / 10)
  b2000 <- res[res$year == 2000 & res$response == "b", ]
  expect_equal(b2000$response_share, 7 / 10)
  expect_equal(res$response_share[res$year == 2004], c(0.5, 0.5))
})

test_that("wtd_response() shares sum to 1 within each year (and group)", {
  res <- wtd_response(toy())
  expect_equal(as.vector(tapply(res$response_share, res$year, sum)), c(1, 1))

  by_gender <- wtd_response(toy(), grouping_vars = "gender")
  totals <- tapply(by_gender$response_share, list(by_gender$year, by_gender$gender), sum)
  expect_true(all(abs(totals[!is.na(totals)] - 1) < 1e-12))
  expect_equal(by_gender$count[by_gender$year == 2000 & by_gender$gender == "Man" & by_gender$response == "a"], 1)
})

test_that("wtd_response() drops rows with a missing response, group or weight", {
  d <- toy()
  d$response[1] <- NA
  d$weight[2] <- NA
  res <- wtd_response(d)
  expect_equal(sum(res$count[res$year == 2000]), 7)  # only the two weight-3 and weight-4 rows
})

test_that("wtd_response() restricts to requested years and says which are unavailable", {
  expect_message(res <- wtd_response(toy(), years = c(2000, 1999)), "not available: 1999")
  expect_equal(unique(res$year), 2000)
  expect_no_message(wtd_response(toy(), years = 2004))
})

test_that("wtd_response() rejects grouping variables that aren't allowed", {
  expect_error(wtd_response(toy(), grouping_vars = "shoe_size"), "not present in the data.*shoe_size")
  # ...unless the caller widens the list.
  d <- toy(); d$shoe_size <- 1
  expect_no_error(wtd_response(d, grouping_vars = "shoe_size", avail_grps = c("shoe_size")))
})

test_that("wtd_response() honours response_var and gives the column back under that name", {
  d <- toy(); names(d)[names(d) == "response"] <- "answer"
  res <- wtd_response(d, response_var = "answer")
  expect_true("answer" %in% names(res))
  expect_false("response" %in% names(res))
  expect_equal(res$response_share[res$year == 2000 & res$answer == "a"], 0.3)
})

test_that("wtd_response() works on real (example) data and every gender cell is populated", {
  # Regression: with gender labels missing, gender decoded to NA and this
  # returned zero rows.
  local_cvpa_example(questions = "bri_econ_013")
  d <- suppressWarnings(question_data("bri_econ_013"))
  res <- wtd_response(d, grouping_vars = "gender")
  expect_gt(nrow(res), 0)
  expect_setequal(as.character(res$gender), c("Man", "Woman"))
  expect_setequal(as.character(res$response), c("Less", "Same", "More"))
  expect_equal(nrow(res), length(unique(d$year)) * 2 * 3)
  expect_equal(sum(res$count), sum(d$weight[!is.na(d$gender)]))
})

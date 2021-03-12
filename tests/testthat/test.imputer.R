data = data.frame(
  "col1" = c(NA, 4, 4, 7),
  "col2" = c(2, NA, NA, 2),
  "col3" = c(3, NA, 6, 6)
)

imp_mean = data.frame(
  "col1" = c(5.0, 4.0, 4.0, 7.0),
  "col2" = c(2.0, 2.0, 2.0, 2.0),
  "col3" = c(3.0, 5.0, 6.0, 6.0)
)

imp_median = data.frame(
  "col1" = c(4.0, 4.0, 4.0, 7.0),
  "col2" = c(2.0, 2.0, 2.0, 2.0),
  "col3" = c(3.0, 6.0, 6.0, 6.0)
)

imp_most_frequent = data.frame(
  "col1" = c(4.0, 4.0, 4.0, 7.0),
  "col2" = c(2.0, 2.0, 2.0, 2.0),
  "col3" = c(3.0, 6.0, 6.0, 6.0)
)

imp_constant = data.frame(
  "col1" = c(1.0, 4.0, 4.0, 7.0),
  "col2" = c(2.0, 1.0, 1.0, 2.0),
  "col3" = c(3.0, 1.0, 6.0, 6.0)
)

# testing the input df
test_that("The input df must be of 'data.frame' type", {
  expect_error(imputer(list(1, "str", c(1,2,3))))
  expect_error(imputer(10))
})

# testing the input strategy
test_that("The input strategy must be of 'character' type", {
  expect_error(imputer(data, strategy = 2))
})

# testing the input strategy
test_that("The input fill_value must be of 'numeric' type or NA", {
  expect_error(imputer(data, fill_value = "2"))
})

test_that("The input fill_value and strategy should be consistent.", {
  expect_error(imputer(data, strategy = "mean", fill_value = "2"))
  expect_error(imputer(data, strategy = "constant", fill_value = NA))
})














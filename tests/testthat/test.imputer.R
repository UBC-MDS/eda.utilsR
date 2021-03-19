data = data.frame(
  col1 = c(NA, 4, 4, 7),
  col2 = c(2, NA, NA, 2),
  col3 = c(3, NA, 6, 6)
)

imp_mean = data.frame(
  col1 = c(5, 4, 4, 7),
  col2 = c(2, 2, 2, 2),
  col3 = c(3, 5, 6, 6)
)

imp_median = data.frame(
  col1 = c(4, 4, 4, 7),
  col2 = c(2, 2, 2, 2),
  col3 = c(3, 6, 6, 6)
)

imp_most_frequent = data.frame(
  col1 = c(4, 4, 4, 7),
  col2 = c(2, 2, 2, 2),
  col3 = c(3, 6, 6, 6)
)

imp_constant = data.frame(
  col1 = c(1, 4, 4, 7),
  col2 = c(2, 1, 1, 2),
  col3 = c(3, 1, 6, 6)
)

# testing the input df
test_that("The input df must be of 'data.frame' type", {
  expect_error(imputer(list(1, "str", c(1, 2, 3))))
  expect_error(imputer(10))
})

# testing the input strategy
test_that("The input strategy must be of 'character' type and one of the four options",
          {
            expect_error(imputer(data, strategy = 2))
            expect_error(imputer(data, strategy = "test"))
          })

# testing the input fill_value
test_that("The input fill_value must be of 'numeric' type or NA", {
  expect_error(imputer(data, fill_value = "2"))
})

# testing consistency between the input fill_value and strategy
test_that("The input fill_value and strategy should be consistent.", {
  expect_error(imputer(data, strategy = "mean", fill_value = "2"))
  expect_error(imputer(data, strategy = "constant", fill_value = NA))
})


test_that("The imputed dataframe is not correct", {
  expect_true(all.equal(imputer(data, strategy = "mean"), imp_mean))
  expect_true(all.equal(imputer(data, strategy = "median"), imp_median))
  expect_true(all.equal(imputer(data, strategy = "most_frequent"), imp_most_frequent))
  expect_true(all.equal(imputer(data, strategy = "constant", 1), imp_constant))
})

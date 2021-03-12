data1 <- data.frame('col1' = (c(1, 2, 1)),
                    'col2' = (c(0, 1, 2)))

data1_standardize <-
  data.frame('col1' = (
    c(-0.5773502691896256, 1.1547005383792517, -0.5773502691896256)
  ),
  'col2' = (c(-1, 0, 1)))

data1_minmax <- data.frame('col1' = (c(0, 1, 0)),
                           'col2' = (c(0.0, 0.5, 1.0)))


data2 <- data.frame('col1' = (c(1, 0, 0, 3, 4)),
                    'col2' = (c(4, 1, 1, 0, 1)),
                    'col3' = (c(2, 0, 0, 2, 1)))

data2_standardize <-
  data.frame(
    'col1' = (
      c(
        -0.3302891295379082,-0.8807710121010884,-0.8807710121010884,
        0.7706746355884523,
        1.3211565181516325
      )
    ),
    'col2' = (
      c(
        1.714389230829046,-0.26375218935831474,-0.26375218935831474,-0.9231326627541017,
        -0.26375218935831474
      )
    ),
    'col3' = c(1.0, -1.0, -1.0, 1.0, 0.0)
  )

data2_minmax <-
  data.frame('col1' = (c(0.25, 0.00, 0.00, 0.75, 1.00)),
             'col2' = (c(1.00, 0.25, 0.25, 0.00, 0.25)),
             'col3' = (c(1.0, 0.0, 0.0, 1.0, 0.5)))

# test the input dataframe
test_that("The input must be of type 'data.frame'", {
  expect_error(cor_map(as.character(data), c('col1', 'col2')))
})

# test for numerical columns
test_that('columns must be a vector of characters', {
  expect_error(sclae(data1, c(1, 2, 3)))
})

# test for sclaer method if it's a character
test_that('scalser must be of character class', {
  expect_error(scale(data1, c('col1', 'col2'), scaler = 2))
})

# test if column names exist in the dataframe
test_that("The given column names must exist in the given dataframe.", {
  expect_error(scale(data1, c('one', 'two', 'three', 'five')))
})


# test minmax sclaed data output for data1 df above
test_that("The scaled dataframe is not correct", {
  expect_true(all.equal(scale(data1, c('col1', 'col2'), scaler = 'minmax'), data1_minmax))
})

# test standard sclaed data output for data1 df above
test_that("The scaled dataframe is not correct", {
  expect_true(all.equal(scale(data1, c('col1', 'col2'), scaler = 'standard'), data1_standardize))
})

# test minmax sclaed data output for data2 df above
test_that("The scaled dataframe is not correct", {
  expect_true(all.equal(scale(
    data2, c('col1', 'col2', 'col3'), scaler = 'minmax'
  ), data2_minmax))
})


# test standard sclaed data output for data2 df above
test_that("The scaled dataframe is not correct", {
  expect_true(all.equal(scale(
    data2, c('col1', 'col2', 'col3'), scaler = 'standard'
  ), data2_standardize))
})
test_df = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
  Species = c(
    'Iris-setosa',
    'Iris-virginica',
    'Iris-germanica',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa'
  )
)

num_df = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 50, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5)
)

test_column = c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm')

median_output = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 5.1, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 1.5, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 0.4),
  Species = c(
    'Iris-setosa',
    'Iris-virginica',
    'Iris-germanica',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa'
  )
)

trim_output = data.frame(
  SepalLengthCm = c(5.1, 4.9, 5.5, 5.1, 5.4, 5.0, 5.2, 5.3),
  SepalWidthCm = c(1.4, 1.4, 2.0, 0.7, 1.2, 1.4, 1.8, 1.5),
  PetalWidthCm  = c(0.2, 0.2, 0.3, 0.4, 0.5, 0.6, 0.4, 0.2),
  Species = c(
    'Iris-setosa',
    'Iris-virginica',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa'
  )
)

num_out = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 9.21, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 3.19, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 0.77)
)


mean_output = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 9.21, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 3.19, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 0.77),
  Species = c(
    'Iris-setosa',
    'Iris-virginica',
    'Iris-germanica',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa'
  )
)

column_output = data.frame(
  SepalLengthCm = c(5.1, 4.9, 4.7, 5.5, 5.1, 9.21, 5.4, 5.0, 5.2, 5.3, 5.1),
  SepalWidthCm = c(1.4, 1.4, 20, 2.0, 0.7, 1.6, 1.2, 1.4, 1.8, 1.5, 2.1),
  PetalWidthCm  = c(0.2, 0.2, 0.2, 0.3, 0.4, 0.5, 0.5, 0.6, 0.4, 0.2, 5),
  Species = c(
    'Iris-setosa',
    'Iris-virginica',
    'Iris-germanica',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa',
    'Iris-setosa'
  )
)

# dataframe argument test
test_that("Dataframe arument must be a data.frame", {
  expect_error(outlier_identifier("123", columns = test_column, "mean"))
  expect_error(outlier_identifier(c(1), columns = test_column, "mean"))
})

# columns argument test
test_that(
  "Columns argument is not vector of column names, or contains non-existing or non-numeric columns",
  {
    expect_error(outlier_identifier(test_df, columns = c(1, 2, 3), "mean"))
    expect_error(outlier_identifier(test_df, columns = c('Species'), "mean"))
    expect_error(outlier_identifier(test_df, "mean"))
    expect_error(outlier_identifier(test_df, columns = 123, method =  "mean"))
  }
)

# method argument test
test_that("selected method is not one of c('trim', 'median', 'mean')", {
  expect_error(outlier_identifier(test_df, columns = test_column, method = "bro"))
  expect_error(outlier_identifier(test_df, columns = test_column, method = 123))
})

# test for value equal
test_that("The outlier function has error values", {
  expect_true(all.equal(
    outlier_identifier(test_df, columns = test_column),
    trim_output
  ))
  expect_true(all.equal(
    outlier_identifier(test_df, columns = test_column, method = "median"),
    median_output
  ))
  expect_true(all.equal(
    outlier_identifier(test_df, columns = test_column, method = "mean"),
    mean_output
  ))
  expect_true(all.equal(
    outlier_identifier(
      test_df,
      columns = c("SepalLengthCm"),
      method = "mean"
    ),
    column_output
  ))
  expect_true(all.equal(
    outlier_identifier(
      num_df,
      method = "mean"
    ),
    num_out
  ))
})

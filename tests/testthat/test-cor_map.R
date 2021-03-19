data <- data.frame('SepalLengthCm' = (c(5.1, 4.9, 4.7)), 
                   'SepalWidthCm'= (c(1.4, 1.4, 1.3)),
                   'PetalWidthCm'= (c(0.2, 0.1, 0.2)),
                   'Species' = (c('Iris-setosa','Iris-virginica', 'Iris-germanica')))
num_col <- c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm')

plot_demo <- cor_map(data, num_col)

# testing the inputs
test_that("The input dataframe must be of 'data.frame' type", {
  data_test <- as.character(data)
  expect_error(cor_map(data_test,num_col))
})

test_that('num_col must be a vector of characters', {
  expect_error(cor_map(data,c(1,2,3)))
})

test_that('col_scheme must be of character class', {
  expect_error(cor_map(data,num_col,1))
})

test_that("This color scheme is not available, please use either 'purpleorange', 'blueorange' or 'redblue'", {
  expect_error(cor_map(data,num_col,'red'))
})

test_that("The given column names must exist in the given dataframe.", {
  expect_error(cor_map(data,c('hi','hi','hi')))
})

test_that("The given numerical columns must all be numeric.", {
  expect_error(cor_map(data,c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm', 'Species')))
})

#testing the outputs
# Tests whether output plot object is of type ggplot
test_that('Plot should be of ggplot type.',{
  expect_true(ggplot2::is.ggplot(plot_demo))
})

# Tests whether or not there are NaNs produced in the correlation values
test_that('Correlation should not have NA.',{
  expect_false(anyNA(plot_demo[[1]][3]))
})

# Tests whether heatmap portion of plot is geom_tile
test_that('Heatmap portion should be geom_tile.',{
  expect_true("GeomTile" %in% c(class(plot_demo$layers[[1]]$geom)))
})

# Tests whether axes is using correct calculated var column as reference
test_that('Plot should map x to Var1 and y to Var2',{
  expect_true('.data$Var1' == rlang::get_expr(plot_demo$mapping$x))
  expect_true('.data$Var2' == rlang::get_expr(plot_demo$mapping$y))
})

# Tests whether the first color in heatmap is orange
test_that('The first color cell should be orange',{
  expect_true('#DB8322' == ggplot2::ggplot_build(plot_demo)$data[[1]]['fill'][1,])
})
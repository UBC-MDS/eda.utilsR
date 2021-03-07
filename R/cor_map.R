#' A function to implement a correlation heatmap including coefficients based on given numeric columns of a data frame.
#'
#' @param dataframe The data frame to be used for EDA.
#' @param num_col A vector of string of column names with numeric data from the data frame.
#' @param col_scheme The color scheme of the heatmap desired, can only be one of the following: 'purpleorange', 'blueorange', 'redblue'. Defaults to 'purpleorange'.
#'
#' @return ggplot object; A correlation heatmap plot with correlation coefficient labels based on the numeric columns specified by user.
#' @export
#'
#' @examples
#' data <- data.frame('SepalLengthCm' = (c(5.1, 4.9, 4.7)), SepalWidthCm'= (c(1.4, 1.4, 1.3)), PetalWidthCm'= (c(0.2, 0.2, 0.2)), Species' = (c('Iris-setosa','Iris-virginica', 'Iris-germanica')))
#' numerical_columns <- c('SepalLengthCm','SepalWidthCm','PetalWidthCm')
#'  
#' cor_map(data, numerical_columns, col_scheme = 'purpleorange')
#' 
cor_map <- function(dataframe, num_col, col_scheme = 'purpleorange'){
    # to be implemented
}
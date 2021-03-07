#' A function to scale features either by using standard scaler or minmax scaler method
#'
#' @param df The data frame to be used for EDA. 
#' @param columns A vector of string of column names with numeric data from the data frame. 
#' @param scaler The method for scaling data and can only be one of the following: 'standard', 'minmax'
#'
#' @return The scaled dataframe for numerical features
#' @export 
#'
#' @examples
#' df = tibble::tibble(
#' col1 = c(1, 2, 1),
#' col2 = c(2, 2, 1)
#' )
#' scale(df, numerical_columns)
scale <- function(df, columns, scaler = "standard") {
  # to be implemented
}
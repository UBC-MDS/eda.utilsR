
#' A function to implement imputation functionality for completing missing values.
#'
#' @param df list 
#' @param strategy character 
#' @param fill_value character
#'
#' @return list
#' @export 
#'
#' @examples
#' df = tibble::tibble(
#' col1 = c(1, 2, NULL),
#' col2 = c(2, NULL, NULL)
#' )
#' imputer(df)
imputer <- function(df, strategy = "mean", fill_value = NULL) {
  # to be implemented
}
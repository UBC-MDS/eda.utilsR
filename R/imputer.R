library(tibble)
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
#' "col1" = c(1, 2, NA),
#' "col2" = c(2, NA, NA)
#' )
#' 
#' imputer(df)
imputer <- function(df, strategy = "mean", fill_value = NA) {
  if(!is.data.frame(df)) (
    stop("The ttt object to impute must be of 'data.frame' type")
  )
  if(!is.character(strategy))(
    stop("strategy must be of type 'character'")
  )
  if(!is.numeric(fill_value) & !is.na(fill_value))(
    stop("fill_value must be of type 'is.numeric' or NA")
  )
  if(strategy == "constant" & is.na(fill_value))(
    stop("fill_value must be a number when strategy is 'constant'")
  )
  if(strategy != "constant" & is.numeric(fill_value))(
    stop("fill_value can be a number only when strategy is 'constant'")
  )
  NA2mean <- function(x) replace(x, is.na(x), mean(x, na.rm = TRUE))
  return(replace(data, TRUE, lapply(data, NA2mean)))
  
}
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
    stop("The object to impute must be of 'data.frame' type")
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
  # NA2mean <- function(x) replace(x, is.na(x), mean(x, na.rm = TRUE))
  # NA2median <- function(x) replace(x, is.na(x), median(x, na.rm = TRUE))
  # NA2constant <- function(x) replace(x, is.na(x), fill_value)
  # NA2mostfreq <- function(x) replace(x, is.na(x), mode(x, na.rm = TRUE))
  # if(strategy == "mean") {
  #   replace(data, TRUE, lapply(data, NA2mean))
  # } else if(strategy == "median") {
  #   replace(data, TRUE, lapply(data, NA2median))
  # } else if (strategy == "most_frequent") {
  #   replace(data, TRUE, lapply(data, NA2mostfreq))
  # } else if (strategy == "constant") {
  #   replace(data, TRUE, lapply(data, NA2constant))
  # } else {
  #   stop("strategy should be one of 'mean', 'median', 'most_frequent' and 'constant'")
  # }
  for(i in 1:ncol(df)){
    if (strategy == "mean") {
      df[is.na(df[,i]), i] <- mean(df[,i], na.rm = TRUE)
    } else if (strategy == "median") {
      df[is.na(df[,i]), i] <- median(df[,i], na.rm = TRUE)
    } else if (strategy == "most_frequent") {
      df[is.na(df[,i]), i] <- as.numeric(names(which.max(table(df[,i]))))
    } else if (strategy == "constant") {
      df[is.na(df[,i]), i] <- fill_value
    } else {
      stop("strategy should be one of 'mean', 'median', 'most_frequent' and 'constant'")
    }
    
  }
  
  df
    
}
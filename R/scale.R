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
  # Check if input data is data.frame type
  if (!is.data.frame(df)) {
    stop("The input dataframe must be of 'data.frame' type")
  }
  
  # Check if input columns is a vector
  if (!is.vector(columns) | !is.character(columns)) {
    stop("columns must be a vector of characters")
  }
  
  # Check if whether input scaler is of class character
  if (!is.character(scaler)) {
    stop("scaler must be of character class")
  }
  
  # Check if scaler is one of two possible methods
  if (!(scaler %in% c("minmax", "standard"))) {
    stop("This method is not available, please use either 'standard' or 'minmax'")
  }
  
  # Tests whether all input columns exist in the input data
  for (col in columns) {
    if (!(col %in% colnames(df))) {
      stop("The given column names must exist in the given dataframe.")
    }
  }
  
  # Check if all input columns in columns are numeric columns
  numeric_col <- df %>% select_if(is.numeric) %>% colnames()
  for (col in columns) {
    if (!(col %in% numeric_col)) {
      stop("The given numerical columns must all be numeric.")
    }
  }
  
  data <- df %>% select(all_of(columns))
  
  if (scaler == 'minmax') {
    for (feature_name in 1:ncol(data)) {
      min <- min(data[, feature_name])
      max <- max(data[, feature_name])
      data[, feature_name] <-
        (data[, feature_name] - min) / (max - min)
    }
    
  }
  else{
    for (feature_name in 1:ncol(data)) {
      mean <- mean(data[, feature_name])
      stdev <- sd(data[, feature_name])
      data[, feature_name] <-
        (data[, feature_name] - mean) / stdev
    }
  }
  
  return(data)
}

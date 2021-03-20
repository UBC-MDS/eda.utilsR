#' A function to implement imputation functionality for completing missing values.
#'
#' @param df list. A dataframe that might contain missing data
#' @param strategy character type. Specifies imputation strategy. 
#' - If "mean", then replace missing values using the mean along each column. Can only be used with numeric data.
#' - If "median", then replace missing values using the median along each column. Can only be used with numeric data.
#' - If "most_frequent", then replace missing using the most frequent value along each column. Can be used with strings or numeric data. If there is more than one such value, only the smallest is returned.
#' - If "constant", then replace missing values with fill_value. Can be used with strings or numeric data.
#' @param fill_value double. A numeric value that is used to replace all occurrences of missing values when strategy is "constant".

#'
#' @return list. Imputed dataframe that contains no NA values
#'
#' @export
#'
#' @examples
#' df <- data.frame(
#'   "col1" = c(8, 2, NA, 4),
#'   "col2" = c(2, NA, NA, 2),
#'   "col3" = c(6, 3, NA, 9)
#' )
#'
#' imputer(df)
imputer <- function(df,
                    strategy = "mean",
                    fill_value = NA) {
  if (!is.data.frame(df)) {
    (stop("The object to impute must be of 'data.frame' type"))
  }
  if (!is.character(strategy)) {
    (stop("strategy must be of type 'character'"))
  }
  if (!is.numeric(fill_value) & !is.na(fill_value)) {
    (stop("fill_value must be of type 'is.numeric' or NA"))
  }
  if (strategy == "constant" & is.na(fill_value)) {
    (stop("fill_value must be a number when strategy is 'constant'"))
  }
  if (strategy != "constant" & is.numeric(fill_value)) {
    (stop("fill_value can be a number only when strategy is 'constant'"))
  }

  for (i in 1:ncol(df)) {
    if (strategy == "mean") {
      df[is.na(df[, i]), i] <- mean(df[, i], na.rm = TRUE)
    } else if (strategy == "median") {
      df[is.na(df[, i]), i] <- median(df[, i], na.rm = TRUE)
    } else if (strategy == "most_frequent") {
      df[is.na(df[, i]), i] <-
        as.numeric(names(which.max(table(df[, i]))))
    } else if (strategy == "constant") {
      df[is.na(df[, i]), i] <- fill_value
    } else {
      stop("strategy should be one of 'mean', 'median', 'most_frequent' and 'constant'")
    }
  }

  df
}

#' A function that identify by z-test with threshold of 3, and deal with outliers based on the method the user choose.
#'
#' @param dataframe The target dataframe where the function is performed.
#' @param columns A vector of the target columns where the function needed to be performed. Defualt is NULL, the function will check all columns
#' @param method The method of dealing with outliers. Defualt is "trim"  
#           - if "trim" : we completely remove data points that are outliers.
#           - if "median" : we replace outliers with median values
#           - if "mean" : we replace outliers with mean values
#'
#' @return dataframe object; a dataframe which the outlier has already process by the chosen method
#' @export
#'
#' @examples
#' data = data.Frame(
#' 'SepalLengthCm' = c(5.1, 4.9, 4.7),
#' 'SepalWidthCm' = c(1.4, 1.4, 99),
#' 'PetalWidthCm' = c(0.2, 0.2, 0.2)
#' )
#'  
#' outlier_identifier(data)
#' 
outlier_identifier <- function(dataframe, columns= NULL, method = 'trim'){
    #TODO
} 


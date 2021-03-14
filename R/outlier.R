#' A function that identify by z-test with threshold of 2.5, and deal with outliers based on the method the user choose.
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
#' data = data.frame(
#' SepalLengthCm = c(5.1, 4.9, 4.7, 5.4),
#' SepalWidthCm = c(1.4, 1.4, 20, 2.3),
#' PetalWidthCm = c(0.2, 0.2, 0.2, 0.9)
#' )
#'  
#' outlier_identifier(data)
#' 
outlier_identifier <- function(dataframe, columns= NULL, method = 'trim'){
  
  # datatype check for dataframe
  if (!is.data.frame(dataframe)) {
    stop("The argument dataframe is not dataframe")
  }
  
  # check if there is non-numeric column
  if(is.null(columns)){
    if(sum(unlist(lapply(dataframe, is.numeric))) != length(dataframe)){
        stop("there is non-numeric column in dataframe")
      }
  } else {
    
    if(!is.vector(columns)){
      stop("Argument columns must be a vector")
    }
     possible_numeric_col <- dataframe %>% select_if(is.numeric) %>% colnames()
      for (col in columns){
        if (!(col %in% possible_numeric_col)){
          stop("The given columns contains non-numeric columns in this dataframe.")
        }
      }
    }
  
  # check if method input is valid
  if(!method %in% c("trim", "median", "mean")){
    stop("The given method must be one of ('trim', 'median', 'mean')")
  }
  
  df_cp <- data.frame(dataframe)
  if(is.null(columns)){
    columns <- names(df_cp)
  }
  
  outlier_index <- c()
  
  for(col in columns){
    current_col <- df_cp[col]
    col_mean <- apply(current_col, 2, mean)
    col_std <- apply(current_col, 2, sd)
    threshold <- 2.5
    
    
    for(i in 1:nrow(df_cp)){
      current_item <- current_col[i,]
      z = (current_item - col_mean) / col_std
      if( z >= threshold ){
        
        if(!i %in% outlier_index) {
          outlier_index <- c(outlier_index, i)
        }
        if(method == "mean"){
          df_cp[i, col] = round(col_mean, 2)
        }
        if(method == "median"){
          df_cp[i, col] = apply(current_col, 2, median)
        }
      }
    }
  }

  if(method == "trim" & !is.null(outlier_index)){
      df_cp <- df_cp[-outlier_index, ]
  }
    
    row.names(df_cp) <- NULL
    
    return(df_cp)
}


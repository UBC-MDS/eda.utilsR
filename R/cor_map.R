#' A function to implement a correlation heatmap including coefficients based on given numeric columns of a data frame.
#'
#' @param dataframe The data frame to be used for EDA.
#' @param num_col A vector of string of column names with numeric data from the data frame.
#' @param col_scheme The color scheme of the heatmap desired, can only be one of the following: 'purpleorange', 'blueorange', 'redblue'. Defaults to 'purpleorange'.
#'
#' @return ggplot object; A correlation heatmap plot with correlation coefficient labels based on the numeric columns specified by user.
#' 
#' @export
#'
#' @examples
#' data <- data.frame(
#' SepalLengthCm = c(5.1, 4.9, 4.7), 
#' SepalWidthCm = c(1.4, 1.4, 1.3), 
#' PetalWidthCm = c(0.2, 0.1, 0.2),
#' Species = c('Iris-setosa','Iris-virginica', 'Iris-germanica')
#' )
#' numerical_columns <- c('SepalLengthCm','SepalWidthCm','PetalWidthCm')
#'  
#' cor_map(data, numerical_columns, col_scheme = 'purpleorange')
#' 
cor_map <- function(dataframe, num_col, col_scheme = 'purpleorange'){
    
  # Tests whether input dataframe is data.frame type
  if (!is.data.frame(dataframe)) {
    stop("The input dataframe must be of 'data.frame' type")
  }
  
  # Tests whether input num_col is a vector
  if(!is.vector(num_col) | !is.character(num_col)){
    stop("num_col must be a vector of characters")
  }
  
  # Tests whether input col_scheme is of class character
  if(!is.character(col_scheme)){
    stop("col_scheme must be of character class")
  }
  
  # Tests whether col_scheme is one of three possible options
  if(!(col_scheme %in% c("purpleorange", "blueorange", "redblue"))){
    stop("This color scheme is not available, please use either 'purpleorange', 'blueorange' or 'redblue'")
  }
  
  # Tests whether all input columns exist in the input data    
  for (x in num_col){
    if (!(x %in% colnames(dataframe))){
      stop("The given column names must exist in the given dataframe.")
    }
  }
  
  # Tests whether all input columns in num_col are numeric columns
  possible_numeric_col <- dataframe %>% dplyr::select_if(is.numeric) %>% colnames()
  for (x in num_col){
    if (!(x %in% possible_numeric_col)){
      stop("The given numerical columns must all be numeric.")
    }
  }
  
  if (col_scheme == 'purpleorange'){
    low_c ='#43186c'
    high_c = '#db8322'
  } else if (col_scheme == 'blueorange'){
    low_c ='#1a5791'
    high_c = '#db8322'
  } else if (col_scheme == 'redblue'){
    low_c ='#ba3238'
    high_c = '#296faa'
  }
  
  data <- dataframe %>% dplyr::select(all_of(num_col))
  
  corr_data <- round(stats::cor(data),2)
  
  melted_corr_data <- reshape2::melt(corr_data)
  
  cor_plot <- ggplot2::ggplot(melted_corr_data, ggplot2::aes(x = .data$Var1, y = .data$Var2, fill = .data$value)) +
    ggplot2::geom_tile() + 
    ggplot2::scale_fill_gradient2(low = low_c, mid = 'white', high = high_c, midpoint = 0, limit = c(-1,1)) +
    ggplot2::labs(fill = 'Correlation', title = 'Correlation Plot') +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 10),
          axis.text.y = ggplot2::element_text(size = 10))
  
  cor_heatmap <- cor_plot +
    ggplot2::geom_text(ggplot2::aes(x = .data$Var1, y = .data$Var2, label = .data$value), size = 7) +
    ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_blank()) + ggplot2::coord_fixed()
  
  return(cor_heatmap)
}
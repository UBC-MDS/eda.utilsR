
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eda.utilsR

<!-- badges: start -->
<!-- badges: end -->

## Overview

As data rarely comes ready to be used and analyzed for machine learning
right away, this package aims to help speed up the process of cleaning
and doing initial exploratory data anslysis (EDA). The package focuses
on the tasks of dealing with outlier and missing values, scaling and
correlation visualization.

## Our Place in the R Ecosystem

While R packages with similar functionalities exist, this package aims
to simplify the amount of code necessary for these functions and
outputs. Packages with similar functionality are as follows:

-   [scaler](https://www.rdocumentation.org/packages/coop/versions/0.6-2/topics/scaler)
-   [ggcorr](https://www.rdocumentation.org/packages/GGally/versions/1.5.0/topics/ggcorr)
-   [mice](https://cran.r-project.org/web/packages/mice/mice.pdf)
-   [OutlierDetection](https://cran.r-project.org/web/packages/OutlierDetection/OutlierDetection.pdf)

## Functions

The four functions contained in this package are as follows:

-   `cor_map`: A function to plot a correlation matrix of numeric
    columns in the dataframe
-   `outlier_identifier`: A function to identify and deal with outliers
-   `scale` A function to scale numerical values in the dataset
-   `imputer`: A function to impute missing values

## Installation

You can install the released version of eda.utilsR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("eda.utilsR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/eda.utilsR")
```

## Dependencies

    dplyr
    ggplot2
    reshape2
    stats
    rlang
    testthat
    tibble

## Usage

The eda.utilsR package help you to build exploratory data analysis.

eda.utilsR includes multiple custom functions to perform initial
exploratory analysis on any input data describing the structure and the
relationships present in the data. The generated output can be obtained
in both object and graphical form.

The eda.utilsR is capable of :

-   Diagnose data quality : Resolve skewed data by identifying missing
    data and outlier and provide corresponding remedy.
-   Discover data: Plot correlation matrix to help explore data to
    understand the data and find scenarios for performing the analysis.
-   Machine learning perpetration : Perform column transformations,
    derive scaler automatically to fulfill further machine learning need

## Example

``` r
library(eda.utilsR)
```

#### Data

For this demonstration we will use the following datasets.

``` r
data <- data.frame('SepalLengthCm' = (c(5.1, 4.9, 4.7)), 
                   'SepalWidthCm'= (c(1.4, 1.4, 1.3)),
                  'PetalWidthCm'= (c(0.2, 0.1, 0.2)),
                  'Species' = (c('Iris-setosa','Iris-virginica', 'Iris-germanica')))

data_with_NA <- data.frame('SepalLengthCm' = (c(5.1, 4.9, 4.7)), 
                   'SepalWidthCm'= (c(1.4, 1.4, 1.3)),
                  'PetalWidthCm'= (c(0.2, 0.1, NA)))

data_with_outlier <- data.frame('SepalLengthCm' = (c(5.1, 4.9, 4.7, 5.2, 5.1, 5.2, 5.1, 4.8)), 
                   'SepalWidthCm'= (c(1.4, 1.4, 1.3, 1.2, 1.2, 1.3, 1.6, 1.3)),
                  'PetalWidthCm'= (c(0.2, 0.1, 30, 0.2, 0.3, 0.1, 0.4, 0.5)))
```

### 1. `imputer`

-   **Impute**: Resolve skewed data by identifying missing data and
    outlier and provide corresponding remedy.

``` r
# calling imputer function
imputer(data_with_NA)
#>   SepalLengthCm SepalWidthCm PetalWidthCm
#> 1           5.1          1.4         0.20
#> 2           4.9          1.4         0.10
#> 3           4.7          1.3         0.15
```

### 2. `outlier_identifier`

-   **Identify Outliers**: Identify and deal with outliers in the
    dataset.

``` r
# calling outlier_identifier function
outlier_identifier(data_with_outlier, method = "median")
#> NULL
```

### 3. `cor_map`

-   **Correlation Heatmap Plotting**: Easily plot a correlation matrix
    along with its values to help explore data.

With EDA we generally want a quick snapshot of the data in order to
understand it better. Visualizing the correlation between the numerical
variables in the dataset are a good way to do that. This function allows
you to quickly plot a correlation heat map of a chosen color scheme,
along with correlation values overlaid. Users simply need to input the
dataframe, the numeric columns wished to be plot () and an optional
color scheme.

``` r
# defining the numeric columns
num_col <- c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm')

# calling cor_map function
cor_map(data, num_col, "purpleorange")
```

<img src="man/figures/README-cor_map demo-1.png" width="100%" />

### 4. `scale`

-   **Scaling**: Scale the data in preperation for future use in machine
    learning projects.

``` r
# defining the numeric columns
num_col <- c('SepalLengthCm', 'SepalWidthCm', 'PetalWidthCm')

# calling scale function
scale(data, num_col, "minmax")
#>   SepalLengthCm SepalWidthCm PetalWidthCm
#> 1           1.0            1            1
#> 2           0.5            1            0
#> 3           0.0            0            1
```

## Contributors

This package is authored by Chuang Wang, Fatime Selimi, Jiacheng Wang,
and Micah Kwok as part of the course project in DSCI-524 (UBC-MDS
program). You can see the list of all contributors in the [contributors
tab](https://github.com/UBC-MDS/eda.utilsR/graphs/contributors).

We welcome and recognize all contributions. If you wish to participate,
please review our [contributing
guidelines](https://github.com/UBC-MDS/eda.utilsR/blob/main/CONTRIBUTING.rst).


<!-- README.md is generated from README.Rmd. Please edit that file -->

# eda.utilsR

<!-- badges: start -->

<!-- badges: end -->

As data rarely comes ready to be used and analyzed for machine learning
right away, this package aims to help speed up the process of cleaning
and doing initial exploratory data analysis (EDA). The package focuses
on the tasks of dealing with outlier and missing values, scaling and
correlation visualization.

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

## Functions

The four functions contained in this package are as follows:

  - `cor_map`: A function to plot a correlation matrix of numeric
    columns in the dataframe
  - `outlier_identifier`: A function to identify and deal with outliers
  - `scale` A function to scale numerical values in the dataset
  - `imputer`: A function to impute missing values

## Our Place in the R Ecosystem

While R packages with similar functionalities exist, this package aims
to simplify the amount of code necessary for these functions and
outputs. Packages with similar functionality are as follows:

  - [scaler](https://www.rdocumentation.org/packages/coop/versions/0.6-2/topics/scaler)
  - [ggcorr](https://www.rdocumentation.org/packages/GGally/versions/1.5.0/topics/ggcorr)
  - [mice](https://cran.r-project.org/web/packages/mice/mice.pdf)
  - [OutlierDetection](https://cran.r-project.org/web/packages/OutlierDetection/OutlierDetection.pdf)

## Dependencies

  - TBD

## Usage

The eda.utilsR package help you to build exploratory data analysis.

eda.utilsR includes multiple custom functions to perform initial
exploratory analysis on any input data describing the structure and the
relationships present in the data. The generated output can be obtained
in both object and graphical form.

The eda.utilsR is capable of :

  - Diagnose data quality : Resolve skewed data by identifying missing
    data and outlier and provide corresponding remedy.
  - Discover data: Plot correlation matrix to help explore data to
    understand the data and find scenarios for performing the analysis.
  - Machine learning perpetration : Perform column transformations,
    derive scaler automatically to fulfill further machine learning need

## Contributors

This package is authored by Chuang Wang, Fatime Selimi, Jiacheng Wang,
and Micah Kwok as part of the course project in DSCI-524 (UBC-MDS
program). You can see the list of all contributors in the [contributors
tab](https://github.com/UBC-MDS/eda.utilsR/graphs/contributors).

We welcome and recognize all contributions. If you wish to participate,
please review our [contributing
guidelines](https://github.com/UBC-MDS/eda.utilsR/blob/main/CONTRIBUTING.rst).

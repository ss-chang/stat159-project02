# /code

This folder contains all code (all .R files) used in this project. Under __scripts/__ are files that fit and test regression models. Under __functions/__ is a function that calculates the range of an object. The folder __tests/__ tests the function.

scripts/  
 + regression-pcr.R  
 
 Fits PCR regression to `Advertising` dataset.
 Outputs variables to data/fit-pcr.RData.
 
 + regression-lasso.R  
 
 Fits LASSO regression to `Advertising` dataset.
 Outputs variables to data/fit-lasso.RData.
 
 + regression-pls.R  
 
 Fits PLS regression to `Advertising` dataset.
 Outputs variables to data/fit-pls.RData.

 + regression-ridge.R 
 
 Fits Ridge regression to `Advertising` dataset.
 Outputs variables to data/fit-ridge.RData.

 
 + regression-ols.R  
 
 Fits Least Squares regression to `Advertising` dataset.
 Outputs variables to data/fit-ols.RData.

 
functions/  
 + range-as-value.R  
 
 Writes a function to calculate the range of a vector of numeric data (not the same as the built-in R function range())
 
tests/  
 + test-range-as-value.R  
 
 Tests whether the value produced by range_as_value() is the same as the 
 the value obtained by manually calculating max() - min() for a given 
 vector of numeric data
 
 + test-that.R  
 
 Executes function test detailed in tests/test-range-as-value.R

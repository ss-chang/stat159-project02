# ==============================================================================
# title: range-as-value.R
# author: Shannon Chang
# 
# summary: 
# + write a function to calculate the range of a vector of numeric data (not 
# + the same as the built-in R function range())
# ==============================================================================



# ==============================================================================
# Function range_as_value()
# ==============================================================================
# This function will calculate the range (as a single value) of a vector of 
# numeric data. This is not to be confused with the built-in R function range(), 
# which outputs the minimum and maximum values in a vector of numeric data. 

range_as_value <- function(x){
  max(x) - min(x)
}
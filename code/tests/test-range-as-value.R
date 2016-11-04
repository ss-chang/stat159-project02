# ==============================================================================
# title: test-range-as-value.R
# author: Shannon Chang
# 
# summary: 
# + test whether the value produced by range_as_value() is the same as the 
#   the value obtained by manually calculating max() - min() for a given 
#   vector of numeric data
# ==============================================================================



# ==============================================================================
# Load source code for functions and relevant data to be tested
# ==============================================================================
library(testthat)
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)
source("../functions/range-as-value.R")
load("../../data/eda-text-output.RData")



# ==============================================================================
# Testing residual_sum_squares()
# ==============================================================================
for (i in 1:length(quants)) {
  context("Test for range of a numeric vector as a single value")
  
  test_that("range value", {
    expect_equal(range_as_value(quants[, i]), 
                 max(quants[, i]) - min(quants[, i]))
    expect_length(range_as_value(quants[, i]), 1)
  })
}


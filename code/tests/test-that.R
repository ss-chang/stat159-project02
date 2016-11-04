# ==============================================================================
# title: test-that.R
# author: Shannon Chang
# 
# summary: 
# + execute function test detailed in tests/test-range-as-value.R
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
# Execute test for test-range-as-value.R
# ==============================================================================
test_file("tests/test-range-as-value.R")
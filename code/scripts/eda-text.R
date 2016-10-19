# ==============================================================================
# Read in Credit.csv data set
# ==============================================================================
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)

# ==============================================================================
# Generating summary statistics and output file
# ==============================================================================
# sink output
sink(file = "../../data/summary-stats.txt")

# Summary statistics
cat("Summary Statistics for Credit.csv\n")
credit_summary <- summary(credit)
print(credit_summary)
cat("\n\n\n")

# Standard deviations
cat("Standard Deviations:\n")
nums <- sapply(credit, is.numeric)
nums <- credit[,nums]
credit_sds <- apply(nums, 2, sd) 
print(credit_sds)
cat("\n\n\n")

# Interquartile ranges
cat("Interquartile Ranges:\n")
credit_iqrs <- apply(nums, 2, IQR)
print(credit_iqrs)
cat("\n\n\n")

# Matrix of correlations
cat("Matrix of Correlations")
credit_cor <- cor(nums, use = "all.obs")
print(credit_cor)

# STOP
sink()
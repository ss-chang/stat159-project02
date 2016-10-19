# ==============================================================================
# Read in Credit.csv data set
# ==============================================================================
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)

# ==============================================================================
# Exploratory analysis of quantitative variables  and output file
# ==============================================================================
# sink output
sink(file = "../../data/summary-stats.txt")

# Summary statistics
cat("Summary Statistics for Quantitative Variables in Credit.csv\n")
quals <- sapply(credit, is.numeric)
quals <- credit[,quals]
quals_sum<- summary(quals)
print(quals_sum)
cat("\n\n\n")

# Standard deviations
cat("Standard Deviations:\n")
quals_sds <- apply(quals, 2, sd) 
print(quals_sds)
cat("\n\n\n")

# Interquartile ranges
cat("Interquartile Ranges:\n")
quals_iqrs <- apply(quals, 2, IQR)
print(quals_iqrs)
cat("\n\n\n")

# Matrix of correlations
cat("Matrix of Correlations")
quals_cor <- cor(quals, use = "all.obs")
print(quals_cor)

# STOP
sink()
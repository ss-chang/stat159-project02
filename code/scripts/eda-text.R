#===============================================================================
# title: eda-text.R
# author: Shannon Chang Nura Kawa
#
# final paper (without figures) 4-5 pages of text
# description:
# + eda of qualitative predictors of "credit" dataset
# + eda of quantitative predictors of "credit" dataset
# + generates summary statistics for all quantitative predictors
# + creates frequency and proportional frequency charts of qualitative predictors
# + creates output file to store all results above
# + runs aov() between "balance" and all qualitative predictors
# + creates output files for all data treated by anova
#===============================================================================





# ==============================================================================
# Read in Credit.csv data set
# ==============================================================================
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)





# ==============================================================================
# Separate Qualitative and Quantitative Data
# ==============================================================================
# create separate data frame of just qualitative data: "quals"
quals <- credit[,sapply(credit, is.factor)]

# create separate data frame of just quantitative data: "quants"
quants <- credit[,sapply(credit, is.numeric)]





# ==============================================================================
# Exploratory analysis of quantitative variables  and output file
# ==============================================================================
# sink output
sink(file = "../../data/eda-output.txt")

# title
cat("Exploratory Data Analysis for Credit.csv\n\n\n")

# Summary statistics
cat("Summary Statistics for Quantitative Variables\n")
quants <- sapply(credit, is.numeric)
quants <- credit[,quants]
quants_sum<- summary(quants)
print(quants_sum)
cat("\n\n\n\n\n")

# Standard deviations
cat("Standard Deviations:\n")
quants_sds <- round(apply(quants, 2, sd), 4) 
print(quants_sds)
cat("\n\n\n\n\n")

# Interquartile ranges
cat("Interquartile Ranges:\n")
quants_iqrs <- apply(quants, 2, IQR)
print(quants_iqrs)
cat("\n\n\n\n\n")


# Table of frequencies (no proportions)
# No proportions
cat("Table of Frequencies (no proportions)\n\n")
cat("Individual:\n")
individual_frequencies <- apply(quals, 2, table)
print(individual_frequencies)

# With proportions
cat("\n\n")
cat("Total:\n")
total_frequencies <- ftable(table(quals))
print(total_frequencies)
cat("\n\n\n\n\n")

# Table of frequencies (with proportions)
cat("Table of Frequencies (with proportions)\n\n")
cat("Individual:\n")
make_prop_table <- function(x){prop.table(table(x))}
prop_table_individual_frequencies <- apply(quals,
                                           2,
                                           make_prop_table)
print(prop_table_individual_frequencies)

cat("\n\n")
cat("Total:\n")
prop_table_total_frequencies <- prop.table(total_frequencies)
print(prop_table_total_frequencies)
cat("\n\n\n")


# Matrix of correlations
cat("Matrix of Correlations\n")
quants_cor <- round(cor(quants, use = "all.obs"), 4)
print(quants_cor) 

# STOP
sink()


# ==============================================================================
# anova(s) between Balance and qualitative variables
# ==============================================================================
# Add "Balance" to the data frame
quals <- cbind(credit$Balance, quals)
colnames(quals)[1] <- "balance"

# Run anova on all options and sink the data into a textfile
sink("../../data/anova-all.txt")
cat("ANOVA: balance ~ .\n\n")
aov(balance ~ ., data = quals)
sink()


for(j in 2:ncol(quals))
{
  doc_title <- paste0("../../data/anova-", colnames(quals)[j],
                      ".txt")
  # save as text file
  sink(doc_title)
  cat(paste0("ANOVA: balance ~ ", colnames(quals)[j], "\n"))
  
  aov(balance ~ quals[,j], data = quals)
  
  sink()
  #rm(doc_title)
}





# ==============================================================================
# Export objects needed for report compilation
# ==============================================================================
save(quants_cor, 
     file = "../../data/eda-text-output.RData")

save(prop_table_total_frequencies, file="../../data/prop-table-quals.RData")

# ==============================================================================
# Read in Credit.csv data set
# ==============================================================================
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)

# ==============================================================================
# Generating histograms
# ==============================================================================
quals <- sapply(credit, is.numeric)
quals <- credit[,quals]
x_captions <- c(" (in thousands of dollars)", 
                " (credit limit)",
                " (credit rating)", 
                " (number of credit cards)", 
                "", 
                " (years of education)", 
                " (average credit card debt for a number of individuals)")
for (i in 1:ncol(quals)){
  png(paste0("../../images/histogram-",casefold(names(quals[i])), ".png"))
  hist(quals[,i], 
       xlab = paste0(names(quals[i]), x_captions[i]), 
       main = paste0(names(quals[i])))
  dev.off()
}



# ==============================================================================
# Generating boxplots
# ==============================================================================
for (i in 1:ncol(quals)){
  png(paste0("../../images/boxplot-",casefold(names(quals[i])), ".png"))
  boxplot(quals[,i], 
       ylab = paste0(x_captions[i]), 
       main = paste0(names(quals[i])))
  dev.off()
}



# ==============================================================================
# Generating scatterplot matrix
# ==============================================================================
png("../../images/scatterplot-matrix.png")
plot(quals)
dev.off()
#====================================================================================
# title: eda-images.R
# author: Shannon Chang and Nura Kawa
#
# description:
# + generates histograms of quantitative predictors
# + generates boxplots of quantitative predictors
# + generates scatterplot matrix of quantitative predictors
# + generates conditional boxplots of qualitative predictors
# + creates barcharts of qualitative predictors
# + all images are saved as .PDF and .png formats
#====================================================================================


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
quals <- cbind(credit$Balance, quals)
names(quals)[1] = "balance"

# create separate data frame of just quantitative data: "quants"
quants <- credit[,sapply(credit, is.numeric)]

# ==============================================================================
# Function to select saving method
# ==============================================================================

save_image <- function(method, image, extension)
{
  switch(method,
         "pdf" = pdf(paste0(image, extension)),
         "png" = png(paste0(image, extension)))
}

# ==============================================================================
# Generating histograms for Quantitative Data
# ==============================================================================

x_captions <- c(" (in thousands of dollars)", 
                " (credit limit)",
                " (credit rating)", 
                " (number of credit cards)", 
                "", 
                " (years of education)", 
                " (average credit card debt for a number of individuals)")


# function to plot quantitative histograms
plot_quant_hist <- function(method, extension)
{
  for (i in 1:ncol(quants)){
    
    save_image(method,
               paste0("../../images/quantitative/histograms/histogram-",casefold(names(quants[i]))),
               extension)
    
    hist(quants[,i], 
         xlab = paste0(names(quants[i]), x_captions[i]), 
         main = paste0(names(quants[i])))
    dev.off()
  }
}

# plotting png and pdf qualitative histograms
plot_quant_hist("png", ".png")
plot_quant_hist("pdf", ".pdf")

# ==============================================================================
# Generating boxplots
# ==============================================================================

# ------------------------------------------------------------------------------
# Boxplots for quantitative data:
# ------------------------------------------------------------------------------

plot_quant_box <- function(method, extension)
{
  for (i in 1:ncol(quants))
    {
    save_image(method,
               paste0("../../images/quantitative/boxplots/boxplot-",
                      casefold(names(quants[i]))),
               extension)
    
    boxplot(quants[,i], 
            ylab = paste0(x_captions[i]), 
            main = paste0(names(quants[i])))
    dev.off()
  }
}

plot_quant_box("png", ".png")
plot_quant_box("pdf", ".pdf")

# ------------------------------------------------------------------------------
# Conditional Boxplots for Qualitative Data:
# --------------------------------------------------------------------------------

# plot_qual_boxplots function:
plot_qual_boxplots <- function(method, extension, folder)
{
  for(i in 2:ncol(quals)) #column 1 is balance
  {
    boxplot_name <- colnames(quals)[i]
    #boxplot_name <- tolower(colnames(quals)[i])
    
    # save image
    save_image(method, 
               paste0("../../images/qualitative/", 
                      folder, 
                      "conditional-boxplot-", 
                      tolower(boxplot_name)), 
               extension)
    
    boxplot(balance ~ quals[,i], data = quals,
            main = paste0("boxplot of balance with respect to ",
                          boxplot_name),
            col = "white")
    
    dev.off()
    rm(boxplot_name)
  }
}

plot_qual_boxplots("png", ".png", "boxplots/")
plot_qual_boxplots("pdf", ".pdf", "boxplots/")

# ==============================================================================
# Generating barcharts for Qualitative data
# ==============================================================================

# table of frequencies with proportion

individual_frequencies <- apply(quals, 2, table)
total_frequencies <- ftable(table(quals))
make_prop_table <- function(x){prop.table(table(x))}
prop_table_individual_frequencies <- apply(quals,
                                           2,
                                           make_prop_table)
prop_table_total_frequencies <- prop.table(total_frequencies)


plot_qual_barcharts <- function(method, extension, folder)
{
  for(i in 2:ncol(quals)) #ignoring "balance"
  {
    chart_name <- colnames(quals)[i]
    
    # save pdf image
    save_image(method, 
               paste0("../../images/qualitative/", 
                      folder, 
                      "barchart-", 
                      tolower(chart_name)), 
               extension)
    
    barplot(prop_table_individual_frequencies[[i]],
            col = "white",
            main = paste0("barchart: ", chart_name))
    
    dev.off()
    rm(chart_name)
  }
}

plot_qual_barcharts("png", ".png", "barcharts/")
plot_qual_barcharts("pdf", ".pdf", "barcharts/")


# ==============================================================================
# Generating scatterplot matrix
# ==============================================================================
png("../../images/scatterplot-matrix.png")
plot(quants)
dev.off()

pdf("../../images/scatterplot-matrix.png")
plot(quants)
dev.off()


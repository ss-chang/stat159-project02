#====================================================================================
# title: session-info.R
# author: Shannon Chang
#
# description:
# + lists pacages used in entire project directory
# + appends additional package information to session-info.txt file (at top level 
#   of project directory)
#====================================================================================



# ==============================================================================
# Packages used
# ==============================================================================
library(readr)
library(glmnet)
library(pls)
library(devtools)
library(knitr)
library(rmarkdown)
library(xtable)
library(png)
library(grid)
library(gridExtra)
library(ggplot2)



# ==============================================================================
# Appending additional information to session-info.txt
# ==============================================================================
sink("../../session-info.txt", append = TRUE)
cat("Session Information\n\n")
print(sessionInfo())
devtools::session_info()
sink()
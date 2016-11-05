# ==============================================================================
# title: regression-pcr.R
# author: Shannon Chang
# 
# summary: 
# + fit a Principal Components Regression model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
#
# + output file: ../../data/regression/fit-pcr.RData
# ==============================================================================

# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(pls)
load("../../data/train-test.RData")

# ==============================================================================
# Fit the PCR model on the training data
# ==============================================================================
pcr_fit <- pcr(y_train~x_train, 
               scale = FALSE, 
               validation = "CV" # performs 10-fold cross validation
               )

# ==============================================================================
# Select the best model
# ==============================================================================
pcr_best_model <- which.min(pcr_fit$validation$PRESS) #best number of components



# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================

png("../../images/regression-plots/pcr-plot.png")
validationplot(pcr_fit, val.type = "MSEP")
dev.off()

pdf("../../images/regression-plots/pcr-plot.pdf")
validationplot(pcr_fit, val.type = "MSEP")
dev.off()


# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
pcr_predictions <- predict(pcr_fit, 
                           ncomp = pcr_best_model,
                           newdata = x_test)

pcr_mse <- mean((y_test - pcr_predictions)^2)




# ==============================================================================
# Refit the PCR model on the full data set
# ==============================================================================
# official fit on full dataset

pcr_full_data_fit <- pcr(y~x,scale = FALSE,
                         ncomp = pcr_best_model,
                     validation = "CV")

pcr_coefficients <- coef(pcr_full_data_fit)


# ==============================================================================
# Save relevant objects in fit-pcr.RData
# ==============================================================================
save(pcr_fit, 
     pcr_best_model, 
     pcr_predictions, 
     pcr_mse, 
     pcr_full_data_fit,
     pcr_coefficients,
     file = "../../data/regression/fit-pcr.RData")

# ==============================================================================
# sink as .txt 
# ==============================================================================
sink("../../data/regression/fit-pcr.txt")

cat("pcr Regression Objects\n\n")

cat("pcr fit\n\n")

pcr_fit

cat("pcr best model\n\n")

pcr_best_model

cat("pcr coefficients\n\n")

pcr_coefficients

sink()


 
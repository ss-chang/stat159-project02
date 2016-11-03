# ==============================================================================
# title: regression-pcr.R
# author: Shannon Chang
# 
# summary: 
# + fit a Principal Components Regression model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
# ==============================================================================



# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(pls)
load("../../data/train-test.RData")



# ==============================================================================
# Perform 10-fold cross-validation on train set
# ==============================================================================
pcr_fit <- pcr(y_train~x_train, 
               scale = FALSE, 
               validation = "CV")



# ==============================================================================
# Select the best model
# ==============================================================================
pcr_best_model <- pcr_fit$validation$PRESS



# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================
validationplot(pcr_fit, val.type = "MSEP")

coef(pcr_fit)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
pcr_predictions <- predict(pcr_fit, x_test, s = pcr_best_model)

pcr_mse <- mean((y_test - pcr_predictions)^2)



# ==============================================================================
# Refit the ridge regression on the full data set
# ==============================================================================
# official fit on full dataset
full_data_pcr_fit <- pcr(y~x,
                         validation = "CV")

coef(full_data_pcr_fit)



# ==============================================================================
# Save relevant objects in fit-pcr.RData
# ==============================================================================
save(pcr_fit, 
     pcr_best_lambda, 
     pcr_predictions, 
     pcr_mse, 
     full_data_pcr_fit, 
     file = "../../data/regression/fit-pcr.RData")
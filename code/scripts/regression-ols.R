# ==============================================================================
# title: regression-ols.R
# author: Shannon Chang
# 
# summary: 
# + fit an Ordinary Least Squares model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
# ==============================================================================



# ==============================================================================
# Load training and testing data
# ==============================================================================
load("../../data/train-test.RData")



# ==============================================================================
# Fit ordinary least squares regression
# ==============================================================================
ols_fit <- lm(y_train~x_train)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
ols_fit_sum <- summary(ols_fit)

ols_mse <- mean(ols_fit_sum$residuals^2)



# ==============================================================================
# Refit the OLS regression on the full data set
# ==============================================================================
# official fit on full dataset
full_data_ols_fit <- lm(y~x)

coef(full_data_ols_fit)

# ==============================================================================
# Save relevant objects in fit-ols.RData
# ==============================================================================
save(ols_fit,
     ols_fit_sum, 
     ols_mse, 
     full_data_ols_fit, 
     file = "../../data/regression/fit-ols.RData")
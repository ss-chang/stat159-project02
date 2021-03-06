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

ols_fit_sum <- summary(ols_fit)


# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
ols_mse <- mean(summary(lm(y_test~x_test)$residuals^2))



# ==============================================================================
# Refit the OLS regression on the full data set
# ==============================================================================
# official fit on full dataset
ols_full_data_fit <- lm(y~x)

ols_coefficients <- coef(ols_full_data_fit)

# ==============================================================================
# Save relevant objects in fit-ols.RData
# ==============================================================================
save(ols_fit,
     ols_fit_sum, 
     ols_mse, 
     ols_full_data_fit, 
     ols_coefficients,
     file = "../../data/regression/fit-ols.RData")
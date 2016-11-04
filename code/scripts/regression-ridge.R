# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(glmnet)
load("../../data/train-test.RData")



# ==============================================================================
# # Fit the ridge model on training data
# ==============================================================================
ridge_fit <- cv.glmnet(x_train,
                       y_train,
                       alpha = 0, # ridge parameter
                       lambda = grid <- 10^seq(10, -2, length = 100),
                       nfolds = 10, # performs 10-fold cross validation
                       standardize = FALSE, # we already standardized our data
                       intercept = FALSE)



# ==============================================================================
# Select the best model
# ==============================================================================
ridge_best_model <- ridge_fit$lambda.min



# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================
# plot tuning parameter
plot(ridge_fit)

# coefficients of our fit
coef(ridge_fit)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
# compute mean square error
ridge_predictions <- predict(ridge_fit, x_test, s = ridge_best_model)

ridge_mse <- mean((y_test - ridge_predictions)^2)



# ==============================================================================
# Refit the ridge model on the full data set
# ==============================================================================
# official fit on full dataset
full_data_ridge_fit <- glmnet(x,
                              y,
                              alpha = 0, # ridge parameter
                              lambda = ridge_best_model,
                              standardize = FALSE,
                              intercept = FALSE)

coef(full_data_ridge_fit)



# ==============================================================================
# Save relevant objects in fit-ridge.RData
# ==============================================================================
save(ridge_fit,
     ridge_best_model, 
     ridge_predictions, 
     ridge_mse, 
     full_data_ridge_fit, 
     file = "../../data/regression/fit-ridge.RData")
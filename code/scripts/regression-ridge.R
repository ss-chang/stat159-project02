# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(glmnet)
load("../../data/training-testing-objects.RData")




# ==============================================================================
# Perform 10-fold cross-validation on train set
# ==============================================================================
fit <- cv.glmnet(x_train,
                 y_train,
                 alpha = 0, # RIDGE parameter
                 lambda = grid <- 10^seq(10, -2, length = 100),
                 nfolds = 10, # performs 10-fold cross validation
                 standardize = FALSE, # we already standardized our data
                 intercept = FALSE)



# ==============================================================================
# Select the best model
# ==============================================================================
best_lambda <- fit$lambda.min



# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================
# plot tuning parameter
plot(fit)

# coefficients of our fit
coef(fit)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
# compute mean square error
predictions <- predict(fit, x_test, s = best_lambda)

mse <- mean((y_test - predictions)^2)



# ==============================================================================
# Refit the ridge regression on the full data set
# ==============================================================================
# official fit on full dataset
full_data_fit <- glmnet(x,
                        y,
                        alpha = 0, # RIDGE parameter
                        lambda = best_lambda,
                        standardize = FALSE,
                        intercept = FALSE)

# coef(full_data_fit)

# save official fit as .RDdata
# save(full_data_fit, file = "../../data/ridge-fit.RData")
# ==============================================================================
# title: regression-ridge.R
# author: Shannon Chang
# 
# summary: 
# + fit a Ridge model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
#
# output file: ../../data/fit-ridge.RData
# ==============================================================================


# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(glmnet)
load("../../data/train-test.RData")


# ==============================================================================
# Perform 10-fold cross-validation on train set
# ==============================================================================
ridge_fit <- cv.glmnet(x_train,
                 y_train,
                 alpha = 0, # RIDGE parameter
                 lambda = grid <- 10^seq(10, -2, length = 100),
                 nfolds = 10, # performs 10-fold cross validation
                 standardize = FALSE, # we already standardized our data
                 intercept = FALSE)



# ==============================================================================
# Select the best model
# ==============================================================================
ridge_best_lambda <- ridge_fit$lambda.min


# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================
# plot tuning parameter


png("../../images/regression-plots/ridge-plot.png")
plot(ridge_fit)
dev.off()

pdf("../../images/regression-plots/ridge-plot.pdf")
plot(ridge_fit)
dev.off()


# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
# compute mean square error
ridge_predictions <- predict(ridge_fit, x_test, s = ridge_best_lambda)

ridge_mse <- mean((y_test - ridge_predictions)^2)



# ==============================================================================
# Refit the ridge regression on the full data set
# ==============================================================================
# official fit on full dataset
ridge_full_data_fit <- glmnet(x,
                        y,
                        alpha = 0, # RIDGE parameter
                        lambda = ridge_best_lambda,
                        standardize = FALSE,
                        intercept = FALSE)


ridge_coefficients <- coef(ridge_full_data_fit)


# ==============================================================================
# save official fit as .RDdata
# ==============================================================================
save(ridge_fit,
     ridge_best_lambda, 
     ridge_predictions, 
     ridge_mse,
     ridge_coefficients,
     ridge_full_data_fit, 
     file = "../../data/regression/fit-ridge.RData")


# ==============================================================================
# sink as .txt 
# ==============================================================================
sink("../../data/regression/fit-ridge.txt")

cat("ridge Regression Objects\n\n")

cat("ridge fit\n\n")

ridge_fit

cat("ridge best model\n\n")

ridge_best_model

cat("ridge coefficients\n\n")

ridge_coefficients

sink()

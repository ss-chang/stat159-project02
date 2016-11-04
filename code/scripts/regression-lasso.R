# ==============================================================================
# title: lasso-regression.R
# author: Nura Kawa
# 
# summary: 
# + fit a LASSO model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
# ==============================================================================

# load data
library(glmnet)

# load training-testing data
load("../../data/train-test.RData")

# fit the LASSO model
fit <- cv.glmnet(x_train,
                 y_train,
                 alpha = 1, # LASSO parameter
                 lambda = grid <- 10^seq(10, -2, length = 100),
                 nfolds = 10, # performs 10-fold cross validation
                 standardize = F, # we already standardize our data
                 intercept = F)

# select best model
best_lambda <- fit$lambda.min

# plot tuning parameter
plot(fit)

# coefficients of our fit
coef(fit)

# compute mean square error
predictions <- predict(fit, x_test, s = best_lambda)

mse <- mean((y_test - predictions)^2)

# official fit on full dataset
full_data_fit <- glmnet(x,
                        y,
                        alpha=1, #LASSO
                        lambda = best_lambda,
                        standardize = F,
                        intercept = F)

coef(full_data_fit)

# save official fit as .RDdata
save(full_data_fit, file = "../../data/lasso-fit.RData")


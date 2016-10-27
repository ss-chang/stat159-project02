# ==============================================================================
# title: pls-regression.R
# author: Nura Kawa
# 
# summary: 
# + fit a PLS model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
# ==============================================================================

# load data
library(pls)

# load training-testing data
load("../../data/train-test.RData")

# fit the PLS model

fit <- plsr(y_train ~ x_train,
            scale = FALSE,
            validation = "CV")



# select best model
best_model <- which.min(fit$validation$PRESS) #best number of components

# plot tuning parameter
validationplot(fit, val.type = "MSEP")

# coefficients of our fit
coef(fit)

# compute mean square error
predictions <- predict(fit, x_test, s = best_model)

mse <- mean((y_test - predictions)^2)

# official fit on full dataset
full_data_fit <- plsr(y ~ x,
                      scale = FALSE,
                      validation = "CV",
                      ncomp = best_model)

#coef(full_data_fit)

# save official fit as .RDdata

#save(full_data_fit, file = "../../data/regression/lasso-fit.RData")



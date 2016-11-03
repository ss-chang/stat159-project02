# ==============================================================================
# title: pls-regression.R
# author: Nura Kawa
# 
# summary: 
# + pls_fit a PLS model to standardized credit dataset
# + make predictions using training/testing sets
# + pls_fit model on full data
# ==============================================================================

# load data
library(pls)

# load training-testing data
load("../../data/train-test.RData")

# pls_fit the PLS model

pls_fit <- plsr(y_train ~ x_train,
                scale = FALSE,
                validation = "CV")



# select best model
pls_best_model <- which.min(pls_fit$validation$PRESS) #best number of components

# plot tuning parameter
validationplot(pls_fit, val.type = "MSEP")

# coefficients of our pls_fit
coef(pls_fit)

# compute mean square error
predictions <- predict(pls_fit, x_test, s = pls_best_model)

pls_mse <- mean((y_test - predictions)^2)

# official pls_fit on full dataset
full_data_pls_fit <- plsr(y ~ x,
                          scale = FALSE,
                          validation = "CV",
                          ncomp = pls_best_model)

#coef(full_data_pls_fit)

# save official pls_fit as .RDdata

#save(full_data_pls_fit, file = "../../data/regression/plsr-pls_fit.RData")



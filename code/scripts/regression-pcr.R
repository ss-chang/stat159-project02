# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(pls)
load("../../data/train-test.RData")



# ==============================================================================
# Perform 10-fold cross-validation on train set
# ==============================================================================
fit <- pcr(y_train~x_train, 
           validation = "CV")



# ==============================================================================
# Select the best model
# ==============================================================================
best_lambda <- fit$validation$PRESS



# ==============================================================================
# Produce visualization of which parameter gives the "best" model
# ==============================================================================
validationplot(fit, val.type = "MSEP")

coef(fit)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
predictions <- predict(fit, x_test, s = best_lambda)

mse <- mean((y_test - predictions)^2)



# ==============================================================================
# Refit the ridge regression on the full data set
# ==============================================================================
# official fit on full dataset
pcr_full_data_fit <- pcr(y~x,
                     validation = "CV")

# coef(full_data_fit)

# save official fit as .RDdata
 save(pcr_full_data_fit, file = "../../data/pcr-fit.RData")
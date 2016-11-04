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
# Fit the PCR model on the training data
# ==============================================================================
pcr_fit <- pcr(y_train~x_train, 
               scale = FALSE, 
               validation = "CV" # performs 10-fold cross validation
               )



# ==============================================================================
# Select the best model
# ==============================================================================
pcr_best_model <- which.min(pcr_fit$validation$PRESS) #best number of components



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
# Refit the PCR model on the full data set
# ==============================================================================
# official fit on full dataset
<<<<<<< HEAD
pcr_full_data_fit <- pcr(y~x,
                     validation = "CV")
=======
full_data_pcr_fit <- pcr(y~x,
                         validation = "CV")
>>>>>>> 8afd598d90ab8c5d0034a9937e85660e2e41e590

coef(full_data_pcr_fit)

<<<<<<< HEAD
# save official fit as .RDdata
 save(pcr_full_data_fit, file = "../../data/pcr-fit.RData")
=======


# ==============================================================================
# Save relevant objects in fit-pcr.RData
# ==============================================================================
save(pcr_fit, 
     pcr_best_model, 
     pcr_predictions, 
     pcr_mse, 
     full_data_pcr_fit, 
     file = "../../data/regression/fit-pcr.RData")
>>>>>>> 8afd598d90ab8c5d0034a9937e85660e2e41e590

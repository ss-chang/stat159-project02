# ==============================================================================
# title: regression-pls.R
# author: Nura Kawa
# 
# summary: 
# + pls_fit a PLS model to standardized credit dataset
# + make predictions using training/testing sets
# + pls_fit model on full data
#
# output file: ../../data/regression/fit-pls.RData
# ==============================================================================


# ==============================================================================
# load data
# ==============================================================================

library(pls)

# ==============================================================================
# load training-testing data
# ==============================================================================

load("../../data/train-test.RData")


# ==============================================================================
# fit the PLS model
# ==============================================================================
pls_fit <- plsr(y_train ~ x_train,
                scale = FALSE,
                validation = "CV")



# ==============================================================================
# select best model
# ==============================================================================
pls_best_model <- which.min(pls_fit$validation$PRESS) #best number of components

# ==============================================================================
# plot tuning parameter
# ==============================================================================

png("../../images/regression-plots/pls-plot.png")
validationplot(pls_fit, val.type = "MSEP")
dev.off()

pdf("../../images/regression-plots/pls-plot.pdf")
validationplot(pls_fit, val.type = "MSEP")
dev.off()




# ==============================================================================
# compute mean square error and predictions
# ==============================================================================
pls_predictions <- predict(pls_fit, x_test, 
                           ncomp = pls_best_model)

pls_mse <- mean((y_test - pls_predictions)^2)

# ==============================================================================
# official pls_fit on full dataset
# ==============================================================================
pls_full_data_fit <- plsr(y ~ x,
                          scale = FALSE,
                          validation = "CV",
                          ncomp = pls_best_model)


pls_coefficients <- coef(pls_full_data_fit)


# ==============================================================================
# save official pls_fit as .RDdata
# ==============================================================================
save(pls_fit,
     pls_best_model, 
     pls_predictions, 
     pls_mse,
     pls_full_data_fit,
     pls_coefficients,
     file = "../../data/regression/fit-pls.RData")


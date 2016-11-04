# ==============================================================================
# title: regression-lasso.R
# author: Nura Kawa
# 
# summary: 
# + fit a LASSO model to standardized credit dataset
# + make predictions using training/testing sets
# + fit model on full data
# 
# output file: ../../data/regression/fit-lasso.RData
# ==============================================================================

# ==============================================================================
# load data
# ==============================================================================
library(glmnet)

# ==============================================================================
# load training-testing data
# ==============================================================================
load("../../data/train-test.RData")

# ==============================================================================
# fit the LASSO model
# ==============================================================================
lasso_fit <- cv.glmnet(x_train,
                       y_train,
                       alpha = 1, # LASSO parameter
                       lambda = grid <- 10^seq(10, -2, length = 100),
                       nfolds = 10, # performs 10-fold cross validation
                       standardize = F, # we already standardize our data
                       intercept = F)

# ==============================================================================
# select best model
# ==============================================================================
lasso_best_model <- lasso_fit$lambda.min

# ==============================================================================
# plot tuning parameter
# ==============================================================================

png("../../images/regression-plots/lasso-plot.png")
plot(lasso_fit)
dev.off()

pdf("../../images/regression-plots/lasso-plot.pdf")
plot(lasso_fit)
dev.off()


# ==============================================================================
# compute mean square error
# ==============================================================================
lasso_predictions <- predict(lasso_fit, x_test, s = lasso_best_model)
lasso_mse <- mean((y_test - lasso_predictions)^2)

# ==============================================================================
# official fit on full dataset
# ==============================================================================
lasso_full_data_fit <- glmnet(x,
                              y,
                              alpha=1, #LASSO
                              lambda = lasso_best_model,
                              standardize = F,
                              intercept = F)

lasso_coefficients <- coef(lasso_full_data_fit)


# ==============================================================================
# save official fit as .RDdata
# ==============================================================================
save(lasso_fit,
     lasso_best_model, 
     lasso_predictions, 
     lasso_mse, 
     lasso_coefficients,
     lasso_full_data_fit, 
     file = "../../data/regression/fit-lasso.RData")
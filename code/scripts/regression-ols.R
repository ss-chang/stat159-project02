# ==============================================================================
# Load relevant package and training and testing data
# ==============================================================================
library(ggplot2)
load("../../data/train-test.RData")



# ==============================================================================
# Fit ordinary least squares regression
# ==============================================================================
fit <- lm(y_train~x_train)



# ==============================================================================
# Compute mean square error for the test set
# ==============================================================================
fit_sum <- summary(fit)

mse <- mean(fit_sum$residuals^2)



# ==============================================================================
# Refit the OLS regression on the full data set
# ==============================================================================
# official fit on full dataset
full_data_fit <- lm(y~x)

# coef(full_data_fit)

# save official fit as .RDdata
# save(full_data_fit, file = "../../data/pcr-fit.RData")
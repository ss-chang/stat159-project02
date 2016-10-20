# ==============================================================================
# Read in Credit.csv data set
# ==============================================================================
library(readr)
credit <- read.csv(file = "../../data/Credit.csv", row.names = 1)



# ==============================================================================
# Dummy out categorical variables
# ==============================================================================
temp_credit <- model.matrix(Balance ~ ., data = credit)

# Remove first column of 1s and append Balance instead
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)



# ==============================================================================
# Mean-center and standardize all variables
# ==============================================================================
# Scale and center
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

# Generate output file
write.csv(scaled_credit, file = "../../data/Credit-scaled.csv")
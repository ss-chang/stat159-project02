# ==============================================================================
# title: train-test.R
# author: Nura Kawa
# 
# summary: 
# + create training and testing sets from scaled data, with seed set at 10
# + save the split data into an RData file to be used in model fitting scripts
# ==============================================================================

# download scaled data
scaled_credit <- read.csv("../../data/Credit-scaled.csv", row.names = 1)

# compute total number of rows; should be 400
number_rows <- nrow(scaled_credit)

# set seed 
set.seed(10)

# take 75% of the rows as training by randomly sampling from number_rows
training_rows <- sample(1:number_rows, 0.75*number_rows,
                        replace = F)

# y is our response, "Balance". Save as matrix to be compatible with glmnet
y <- as.matrix(scaled_credit$Balance)

# x is our predictors
x <- as.matrix(scaled_credit[,-ncol(scaled_credit)]) #removing "balance"

# split into training and testing for x and y
y_train <- y[training_rows,]
x_train <- x[training_rows,]
y_test <- y[-training_rows,]
x_test <- x[-training_rows,]

# save all as .RData
save(x, y, x_train, y_train, x_test, y_test,
     file = "../../data/train-test.RData")
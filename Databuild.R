# Code that builds a tidy dataset from wearable data
# Written by: Gerardo Fumagal
# Date: August 31, 2020

# Install packages: readr

install.packages("readr")
library(readr)
library(dplyr)

# Read subject_train file, participant number by observation in the training set. Rename the column as participant number

path_subject_train <- "../UCI HAR Dataset/train/subject_train.txt"
data <- read_table(path_subject_train, col_names = FALSE)

names(data) <- "PN"

# Add group column to identify whether the observation comes from train or test set

data <- mutate(data, Group = 1)

# Read y_train file, activity labels for each observation, add the column to data set

training_labels_path <- "../UCI HAR Dataset/train/y_train.txt"
training_labels <- read_table(training_labels_path, col_names = FALSE)
names(training_labels) <- "Activity"
data <- cbind(data,training_labels)

# Read X_train file, features vector with 561 variables, add to data set with col names X1...X561

path_training_vars <- "../UCI HAR Dataset/train/X_train.txt"
features_vector <- read_table(path_training_vars, col_names = FALSE)
data <- cbind(data,features_vector)

# Remove objects no longer need

rm(training_labels, features_vector)

# Read subject_test file, participant number by observation in the training set. Rename the column as participant number

path_subject_test <- "../UCI HAR Dataset/test/subject_test.txt"
data_t <- read_table(path_subject_test, col_names = FALSE)

names(data_t) <- "PN"

# Add group column to identify whether the observation comes from train or test set

data_t <- mutate(data_t, Group = 2)

# Read y_test file, activity labels for each observation, add the column to data set

test_labels_path <- "../UCI HAR Dataset/test/y_test.txt"
test_labels <- read_table(test_labels_path, col_names = FALSE)
names(test_labels) <- "Activity"
data_t <- cbind(data_t,test_labels)

# Read X_test file, features vector with 561 variables, add to data set with col names X1...X561

path_test_vars <- "../UCI HAR Dataset/test/X_test.txt"
features_vector <- read_table(path_test_vars, col_names = FALSE)
data_t <- cbind(data_t,features_vector)

# Join data_t with to data

data <- rbind(data,data_t)

# Write dataset file as txt

write.table(data, file = "data.txt")








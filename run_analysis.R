# Code that builds a tidy dataset from wearable data
# Written by: Gerardo Fumagal
# Date: August 31, 2020

# Step 1, merges data from train and test groups
# ----------------------------------------------------
# Read subject_train file, participant number by observation in the training set. Rename the column as participant number

path_subject_train <- "./UCI HAR Dataset/train/subject_train.txt"
data <- read_table(path_subject_train, col_names = FALSE)

names(data) <- "PN"

# Add group column to identify whether the observation comes from train or test set

data <- mutate(data, Group = 1)

# Read y_train file, activity labels for each observation, add the column to data set

training_labels_path <- "./UCI HAR Dataset/train/y_train.txt"
training_labels <- read_table(training_labels_path, col_names = FALSE)
names(training_labels) <- "Activity"
data <- cbind(data,training_labels)

# Read X_train file, features vector with 561 variables, add to data set with col names X1...X561

path_training_vars <- "./UCI HAR Dataset/train/X_train.txt"
features_vector <- read_table(path_training_vars, col_names = FALSE)
data <- cbind(data,features_vector)

# Remove objects no longer need

rm(training_labels, features_vector)

# Read subject_test file, participant number by observation in the training set. Rename the column as participant number

path_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
data_t <- read_table(path_subject_test, col_names = FALSE)

names(data_t) <- "PN"

# Add group column to identify whether the observation comes from train or test set

data_t <- mutate(data_t, Group = 2)

# Read y_test file, activity labels for each observation, add the column to data set

test_labels_path <- "./UCI HAR Dataset/test/y_test.txt"
test_labels <- read_table(test_labels_path, col_names = FALSE)
names(test_labels) <- "Activity"
data_t <- cbind(data_t,test_labels)

# Read X_test file, features vector with 561 variables, add to data set with col names X1...X561

path_test_vars <- "./UCI HAR Dataset/test/X_test.txt"
features_vector <- read_table(path_test_vars, col_names = FALSE)
data_t <- cbind(data_t,features_vector)

# Join data_t with data

data <- rbind(data,data_t)

# Step 2, filter measurements of the mean and std of the variables

# Creates a list of the variables to filter, 2 vectors (mean, std)

features_vector_labels <- read.table("./UCI HAR Dataset/features.txt", col.names = c("No","Label"), sep = " ")

# Select only the mean of variables, avoiding meanFreq variable
mean_vars <- grep("mean\\()", features_vector_labels[,2])
std_vars <- grep(".std.", features_vector_labels[,2])

second_vector <- sort(append(mean_vars,std_vars), decreasing = FALSE)
 
first_vector <- c("PN", "Group", "Activity")

selection <- append(first_vector,paste("X", as.character(second_vector), sep =""))

# Filter the selected variables

data_filtered <- select(data, selection)

# Assign variable names

names(data_filtered)[4:ncol(data_filtered)] <- features_vector_labels[second_vector,2]

# Step 4, Use descriptive variable names

names(data_filtered) <- gsub("tBody", "Time Body ", names(data_filtered))
names(data_filtered) <- gsub("tGravity", "Time Gravity ", names(data_filtered))
names(data_filtered) <- gsub("Acc", "Accelerometer ", names(data_filtered))
names(data_filtered) <- gsub("Gyro", "Gyroscope ", names(data_filtered))
names(data_filtered) <- gsub("fBody", "Frequency Body ", names(data_filtered))
names(data_filtered) <- gsub("Mag", "Magnitude ", names(data_filtered))
names(data_filtered) <- gsub("Jerk", "Jerk ", names(data_filtered))
names(data_filtered) <- gsub("mean()", "MEAN", names(data_filtered))
names(data_filtered) <- gsub("std()", "STD", names(data_filtered))
names(data_filtered) <- gsub("-", "", names(data_filtered))
names(data_filtered) <- gsub("\\()", " ", names(data_filtered))

# Step 4,
# Build a data set with mean values by participant and by activity
# Filter, apply function and add to new data set
# Initialized data_avg

data_avg <- data_frame(1:ncol(data_filtered), 0)
activity_labels <- read_table("./UCI HAR Dataset/activity_labels.txt", col_names = FALSE)

for (i in 1:30) {
  for (j in 1:6) {
    y <- filter(data_filtered, PN == i, Activity == j)
    if (i == 1 & j == 1) {
      data_avg <- rbind(apply(y, MARGIN = 2, mean))} else {
        data_avg <- rbind(data_avg,apply(y, MARGIN = 2, mean))
      }
    
  }
  data_avg[,1:3] <- as.integer(data_avg[,1:3])
}

data_avg <- as.data.frame(data_avg)
names(data_avg) <- gsub("PN", "Participant Number", names(data_avg))

# Step 3, Use descriptive activity names

data_avg$Activity <- as.character(data_avg$Activity)

data_avg$Activity <- gsub("1","WALKING", data_avg$Activity)
data_avg$Activity <- gsub("2","WALKING_UPSTAIRS", data_avg$Activity)
data_avg$Activity <- gsub("3","WALKING_DOWNSTAIRS", data_avg$Activity)
data_avg$Activity <- gsub("4","SITTING", data_avg$Activity)
data_avg$Activity <- gsub("5","STANDING", data_avg$Activity)
data_avg$Activity <- gsub("6","LAYING", data_avg$Activity)

data_filtered$Activity <- as.character(data_filtered$Activity)

data_filtered$Activity <- gsub("1","WALKING", data_filtered$Activity)
data_filtered$Activity <- gsub("2","WALKING_UPSTAIRS", data_filtered$Activity)
data_filtered$Activity <- gsub("3","WALKING_DOWNSTAIRS", data_filtered$Activity)
data_filtered$Activity <- gsub("4","SITTING", data_filtered$Activity)
data_filtered$Activity <- gsub("5","STANDING", data_filtered$Activity)
data_filtered$Activity <- gsub("6","LAYING", data_filtered$Activity)

# Write data to a file
# File name waerable_data.txt



write.table(data_filtered, file = "UCI_HAR_tidydataset.txt", sep = "\t")

write.table(data_avg, file = "UCI_HAR_Avg.txt", sep = "\t")









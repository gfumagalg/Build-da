# Build_tidydata
# This project consists on developing a code that builds a tidy data sets out of wearable data collected from Human Activity Recognition Using Smartphones Dataset version 1.0. Smartlab - Non Linear Complex Systems Laboratory. Two data set will be delivered, one for the mean and standard measurements, and a second set with the average measurements by participant and activity out of the previous data set. There is another code made to build a code book that can be apply for both data sets.

# The tidy data UCI_HAR_tidydataset, is a collection of mean and standard deviation of variables capture in the Human Activity data set UCI HAR Dataset, the set contains all measurments taken during the experiment performed by UCI. Full description of the experiment can be found in the file README.txt, along with data processing methods, features captured during the experiment is described in features_info.txt file, and finally the list can be found at features.txt 
# Both codes required to have the UCI HAR Dataset expanded and installed in the same directory:
# Run_analysis.R:
# Joins data from test and training groups, filter mean and standard deviation measurements, set descriptive names for each variable, writes a data set named    UCI_HAR_tidydataset.txt. Then average measurements by participant and activity and creates another tidy dataset, writes it in the file UCI_HAR_Avg.txt

  
# Codebook_builder.R:
# Writes a code book for data set with the list and description of the variables, writes a file UCI_HAR_dataset_codebook.txt
# UCI HAR Dataset can be found in the following links:
# https://archive.ics.uci.edu/ml/machine-learning-databases/00240/
# https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones#
#
# Requirements:
Both scripts require the following libraries installed: readr, dplyr and utils.
# Ouputs:
UCI_HAR_tidydataset.txt
UCI_HAR_Avg.txt
UCI_HAR_dataset_codebook.txt


# Build_tidydata
# This project intends to build a tidy data set out of wearable data collected from Human Activity Recognition Using Smartphones Dataset version 1.0.
# Smartlab - Non Linear Complex Systems Laboratory.
# It also builds a code book for the data set with specific variables' information
#
# There are 2 scripts written in r, one to build the data set (Databuild.R), and the second to build the code book (Codebookbuild.R)
# Both scripts will get the information from UCI HAR Dataset folder and should be in the working directory, due to file size, this folder is not
# included within this repository, for more information below are the links to the folder and data description:
# https://archive.ics.uci.edu/ml/machine-learning-databases/00240/
# https://archive.ics.uci.edu/ml/datasets/human+activity+recognition+using+smartphones#
#
# Databuild.R requires to have installed the following packages:
#   readr
#   dplyr
# Codebookbuild.R require to have installed the following package:
#   utils
# Make sure to have installed them before running the scripts
#
# Outputs:
#
# Databuild.R will deliver a txt file (data.txt) with tidy data containing all variables describe in features.txt, participant number, group and the activity performed
# during each observation.
# Codebookbuild.R will deliver a txt file (codebook_UCIHAR.txt) with the description for data.txt
#
#


# Code to build the code book for wearable measures data set
# Written by: Gerardo Fumagal
# Date: August 31, 2020

# Define number of variables in the dataset
nvar <- 564
title <- "DATA DICTIONARY   -   UCI HAR Dataset"

file_name <- "codebook_UCIHAR.txt"

# Read features.txt file, features var names

features_vector_labels <- read.table("../UCI HAR Dataset/features.txt", col.names = c("No","Label"), sep = " ")

sink(file_name)

cat(title)
cat("\n")
cat("\n")

for (i in 1:nvar) {
  vector_data <- data[,i]
  vector_size <- lapply(vector_data, nchar)
  cat(str_pad(names(data)[i], 16, side = "right"), max(unlist(vector_size)))
  cat("\n")
  if (i == 1) {cat("\t", str_pad("Participant number", 30, side = "right"))}
  if (i == 2) {cat("\t", str_pad("Group", 20, side = "right"))
               cat("\n")
               cat("\t","\t","1. Train group")
               cat("\n")
               cat("\t","\t","2. Test group")}
  if (i == 3) {cat("\t", str_pad("Activity labels of participants", 30, side = "right"))
               cat("\n")
               for (j in 1:nrow(activity_labels)) {
                 cat(str_pad(activity_labels[j,1],18, side = "left"), str_pad(activity_labels[j,2],16, side = "right"), sep = ".")
                 cat("\n")
                 }
               cat("\n")}
  if (i > 3) {
    cat("\t", str_pad(features_vector_labels[i,2], 36, side = "right"))
    cat("\n")
    cat("\t", "1.000000000000 .. -1.000000000000")
    cat("\n")
  }
  cat("\n")
  cat("\n")
}

sink()

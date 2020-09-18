# Script para pruebas

sink("UCI_HAR_dataset_codebook.txt")

cat("\n")
cat("\n","\n")
cat("DATA DICTIONARY   -   UCI HAR Dataset")
cat("\n")
cat(" Mean and standard deviation values")
cat("\n","\n","\n")
cat("Column  Variable")
cat("\n")
cat("        Variable values range")
cat("\n")
cat("        Number of digits")
cat("\n","\n","\n")
j <- 1
for (i in names(data_avg)) {
  vector_data <- data_avg[,j]
  vector_size <- lapply(vector_data, nchar)
#  cat(str_pad(j, 8, side = "right"), str_pad(max(unlist(vector_size)), 2, side = "left"))
  cat(str_pad(j, 7, side = "right"), str_pad(i, 50, side = "right"))
  cat("\n")
  if (j == 3) {
    for (k in unique(data_avg[,3])) {
      cat("\t")
      cat(k)
      cat("\n")
      
    }
  } else {
    cat("\t")
    cat(str_pad(round(min(data_avg[,j]), digits = 4),6,side = "left"),"..",str_pad(round(max(data_avg[,j]), digits = 4),6, side= "right"))
    cat("\n")
    }
  cat("\t")
  cat(str_pad(max(unlist(vector_size)), 2, side = "left"))
  cat("\n")
  cat("\n")
  j <- j+1
}



sink()

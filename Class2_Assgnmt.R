# Creating Sub folders
dir.create("Raw_Data")
dir.create("R_Scripts")
dir.create("Results")

# Function for Gene Classification
classify_Gene <- function(padj, logFC, padj_thresh = 0.05, logFC_thresh = 1) {
  if((padj < padj_thresh) & (logFC > logFC_thresh)){
    return("Upregulated")
  }else if(logFC < -logFC_thresh){
    return("Downregulated")
  }else {
    return("Not significant")
  }
  
}


# Defining my input and output folders
input_dir <- "Raw_Data"
output_dir <- "Results"

if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

# Files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# Storing results in an empty lists
result_list <- list()
View(result_list)

for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")
  input_file_path <- file.path(input_dir, file_names)
  
  # Import dataset
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported.checking for missing values...\n")
  
  # Handling missing values
  if("padj" %in% names(data)) {
    missing_count <- sum(is.na(data$padj))
    cat("Missing values in 'padj':", missing_count, "\n")
   # since there is no missing value in our column
  }
  
  if("logFC" %in% names(data)) {
    missing_count <- sum(is.na(data$logFC))
    cat("Missing values in 'logFC':", missing_count, "\n")
    # no missing value in our logFC column, therefore, no need to compute for the mean of the column
  
  }
  
  # Classifying Gene 
  data$status <- mapply(classify_Gene, data$padj, data$logFC)
  cat("Gene has been classified successfully.\n")
  
  # Saving my results in R
  result_list[[file_names]] <- data

  # Saving results in my Results folder
  output_file_path <- file.path(output_dir, paste0("GeneClassification_results", file_names))
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
  
}

View(data)

# Saving entire work-space
save.image(file = "SadohAfeezPapa_Class_2_Assignment.RData")

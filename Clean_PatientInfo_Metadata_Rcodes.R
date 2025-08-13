# Loading my entire work-space
load("Class1c_ForLoop_DataAutom_workspace.RData")

###### Importing our data-sets ######  
data1 <- read.csv("data/patient_info.csv")
data2 <- read.csv("data/Metadata.csv")


# Creating a copy of the imported data-sets above
clean_data1 <- data1
clean_data2 <- data2

str(clean_data1)
str(clean_data2)

# 3. Converting data types in patient_info (clean_data1) using the automating conversion method with loop
# Firstly, we need to store the column to convert in a variable
fac_cols_data1 <- c("gender", "diagnosis", "smoker")
for (col in fac_cols_data1) {
  clean_data1[[col]] <- as.factor(clean_data1[[col]])
}

str(clean_data1)

# Converting data types in metadata (Clean_data2) using automating conversion method with loop
str(clean_data2)
fac_cols_data2 <- c("height", "gender")
for (col in fac_cols_data2) {
  clean_data2[[col]] <- as.factor(clean_data2[[col]])
}

str(clean_data2)


# 4. Converting factors into a numerical codes - smoker column
binary_col <- c("smoker")
for (col in binary_col) {
  clean_data1[[col]] <- ifelse(clean_data1$smoker == "Yes",1,0)
}

View(clean_data1)

# Save formatted data-sets as csv
write.csv(clean_data1, file = "results/Clean_Patient_info.csv")
write.csv(clean_data2, file = "results/Clean_Metadata.csv")

# Save work-space
save.image(file = "Class1c_ForLoop_DataAutom_workspace.RData")

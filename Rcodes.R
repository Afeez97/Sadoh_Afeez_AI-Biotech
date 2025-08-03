# Creating Directory
setwd("C:/Users/hp/Desktop/AI&Biotechnolgy Tasks/Sadoh_Task")
getwd()

# Organizing folders
dir.create("data")
dir.create("script")
dir.create("results")

# Loading our Patient_info data
patient_data <- read.csv("data/patient_info.csv")
View(patient_data)
str(patient_data)

# Age Column
patient_data$age <- as.numeric(patient_data$age)
class(patient_data$age)


# Gender column
patient_data$gender <- as.factor(patient_data$gender)
class(patient_data$gender)


# Diagnosis Column
patient_data$diagnosis <- as.factor(patient_data$diagnosis)
class(patient_data$diagnosis)
patient_data$diagnosis_num <- ifelse(patient_data$diagnosis == "Cancer", 1,0)
patient_data$diagnosis_num <- as.factor(patient_data$diagnosis_num)


# Smoker Column
patient_data$smoker <- as.factor(patient_data$smoker)
class(patient_data$smoker)
str(patient_data)


# Saving my formatted patient data-sets as csv
write.csv(patient_data, file = "results/patient_data.csv")

# Saving entire work-space
save.image(file = "Sadoh_Afeez_full_workspace.RData")

# Save specific work-space/object
save(patient_data, file = "workspace.RData")

# Loading my entire work-space
load("Sadoh_Afeez_full_workspace.RData")

# This R script will:
# Merge the training and test sets into one data set.
# Extract only the measurements on the mean and standard deviation for each measurement.
# Rename the activities in the data set.
# Rename the variables in the data set.
# Create a second data set with the average of each variable for each activity
# and each subject.

# Load packages
library(data.table)
library(tidyverse)

# Download the data
path <- getwd()
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, file.path(path, "data.zip"), method = "curl")
unzip(zipfile = "data.zip")

# Merge the test and train data sets (includes steps to use descriptive activity and variable names)
# Load feature and activity labels (to be used for variable names in test and train data sets)

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", 
                             header = FALSE,
                             col.names = c("ActivityId", "ActivityType"))

featureLabels <- read.table("UCI HAR Dataset/features.txt", 
                            header = FALSE,
                            col.names = c("Id", "FeatureName"))  
# Load test data
testData <- read.table("UCI HAR Dataset/test/X_test.txt", 
                       header = FALSE,
                       col.names = featureLabels[,2])
testDataLabels <- read.table("UCI HAR Dataset/test/Y_test.txt", 
                             header = FALSE,
                             col.names = "ActivityId")
# Merge activity labels with test data labels
testDataLabels <- merge(testDataLabels, activityLabels, all.x = T) 

testSubjectLabels <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                                header = FALSE,
                                col.names = "SubjectID")

# Load train data
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", 
                        header = FALSE,
                        col.names = featureLabels[,2])
trainDataLabels <- read.table("UCI HAR Dataset/train/Y_train.txt", 
                              header = FALSE,
                              col.names = "ActivityId")
# Merge activity labels with train data labels
trainDataLabels <- merge(trainDataLabels, activityLabels, all.x = T)

trainSubjectLabels <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                                 header = FALSE,
                                 col.names = "SubjectID")

# Merge test data sets
testMerged <- cbind(testDataLabels, testSubjectLabels, testData)

# Merge train data sets
trainMerged <- cbind(trainDataLabels, trainSubjectLabels, trainData)

# Create final data set containing all train and test data
testTrainFinal <- rbind(testMerged, trainMerged)

# Extract only the measurements on the mean and standard deviation for each measurement.
testTrainFinal <- testTrainFinal %>% select(SubjectID, ActivityType, contains(c("mean", "std")))

# Create a second, independently tidy data set with the average of each variable
# for each activity and each subject.
testTrainFinalMeans <- aggregate(.~SubjectID + ActivityType, data = testTrainFinal, mean)

# Export the final tidy data set
write.table(testTrainFinalMeans, file=file.path("tidy.txt"), row.names = FALSE, quote = FALSE)

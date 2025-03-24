# Getting and Cleaning Data Course Project Code Book
This code book provides information about the dataset, variables, and calculations for the run_analysis R code. 

# 1. The dataset 
The run_analysis R script uses data sets from the Human Activity Recognition Using
Smartphones dataset, located here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The R script is prepared to download and unzip the data files, however you can also
download and uzip the data folder manually here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 2. Files used in the run_analysis R script
The run_analysis R script uses the following files from the dataset:
  activity_labels.txt: Links the class labels with their activity name.
  features.txt: List of all features.
  X_test.txt: Test data set.
  Y_test.txt: Labels for the test data.
  X_train.txt: Training data set.
  Y_train.txt: Labels for the train data.
  subject_test.txt: Each row identifies the subject ID for the participant who  performed the activity in the test data set.
  subject_train.txt: Each row identifies the subject ID for the participant who performed the activity in the train data set.
  
# 3. Variables used in the run_analysis R script
The run_analysis R script creates the following variables:
  SubjectID: The ID for the participant who performed the activity. Each row corresponds to one participant. Numeric.
  ActivityType: The type of activity completed by the participant. There are 6 possible values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Character.
  
The final dataset also includes the mean and standard deviations for the following features included in the dataset. For more information about feature selection, see the featues_info.txt file in the downloaded data folder:
  tBodyAcc-XYZ
  tGravityAcc-XYZ
  tBodyAccJerk-XYZ
  tBodyGyro-XYZ
  tBodyGyroJerk-XYZ
  tBodyAccMag
  tGravityAccMag
  tBodyAccJerkMag
  tBodyGyroMag
  tBodyGyroJerkMag
  fBodyAcc-XYZ
  fBodyAccJerk-XYZ
  fBodyGyro-XYZ
  fBodyAccMag
  fBodyAccJerkMag
  fBodyGyroMag
  fBodyGyroJerkMag

# 4. Calculations
In addition to creating a tidy data set, the run_analyis R script creates a separate dataset called "testTrainFinalMeans" which contains the average of each variable for each activity and each subject. 
  
  
  
  
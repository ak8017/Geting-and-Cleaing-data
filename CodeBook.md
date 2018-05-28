## Peer-graded Assignment: Getting and Cleaning Data Course Project

Arun Kumar

### Description
Additional information about the variables, data and transformations used in the course project for the Getting and Cleaning Data Course Project.

### Source Data
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Section 1. load the required libraries to perform this task

- data.table
- reshape2



### Section 2. set the variable names for training and test data sets

- url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
- archivename <- "dataSet.zip"
- activityLableFile <- "UCI HAR Dataset/activity_labels.txt"
- featuresFile <- "UCI HAR Dataset/features.txt"
- XtrainFile <- "UCI HAR Dataset/train/X_train.txt"
- YtrainFile <- "UCI HAR Dataset/train/Y_train.txt"
- SubjectTrainFile <- "UCI HAR Dataset/train/subject_train.txt"
- XtestFile <- "UCI HAR Dataset/test/X_test.txt"
- YtestFile <- "UCI HAR Dataset/test/Y_test.txt"
- SubjectTestFile <- "UCI HAR Dataset/test/subject_test.txt"
- outputFile <- "tidyData.txt"


### Section 3. download the dataset and extract it using unzip function


### Section 4. 
- load the activity and feature lables
- Extracts only the measurements on the mean and standard deviation for each measurement.

### Section 5. 
- load the training data
- set the column names
- combined the subject, activity and training data

### Section 6. 
- load the test data
- set the column names
- combined the subject, activity and test data

### Section 7. merge the training and tesing data and store the result into `tidyData.txt`
- merge the training and testing data and store the result into combined variable
- creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- save the result into `tidyData.txt` file


## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test

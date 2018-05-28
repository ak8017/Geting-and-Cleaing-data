# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#section 1
# Load libraries 
library(data.table)
library(reshape2)


#section 2
#set the variable names
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
archivename <- "dataSet.zip"
activityLableFile <- "UCI HAR Dataset/activity_labels.txt"
featuresFile <- "UCI HAR Dataset/features.txt"

#training set filename
XtrainFile <- "UCI HAR Dataset/train/X_train.txt"
YtrainFile <- "UCI HAR Dataset/train/Y_train.txt"
SubjectTrainFile <- "UCI HAR Dataset/train/subject_train.txt"

# testing file names
XtestFile <- "UCI HAR Dataset/test/X_test.txt"
YtestFile <- "UCI HAR Dataset/test/Y_test.txt"
SubjectTestFile <- "UCI HAR Dataset/test/subject_test.txt"

# output file
outputFile <- "tidyData.txt"


#section 3

#download the file
download.file(url, archivename)

#extract the files from the archive
unzip(zipfile = archivename)



#section 4
# Load activity lables
activityLabels <- fread( activityLableFile , col.names = c("classLabels", "activityName"))
#load features
features <- fread(featuresFile , col.names = c("index", "featureNames"))
#filter mean and std features
featuresWanted <- grep("(mean|std)\\(\\)", features[, featureNames])
measurements <- features[featuresWanted, featureNames]
measurements <- gsub('[()]', '', measurements)



#section 5
# Load training data

train <- fread(XtrainFile)[, featuresWanted, with = FALSE]
data.table::setnames(train, colnames(train), measurements)
trainActivities <- fread(YtrainFile, col.names = c("Activity"))
trainSubjects <- fread(SubjectTrainFile , col.names = c("SubjectNum"))
trainingData <- cbind(trainSubjects, trainActivities, train)


#section 6
# Load test data

test <- fread(XtestFile)[, featuresWanted, with = FALSE]
data.table::setnames(test, colnames(test), measurements)
testActivities <- fread(YtestFile , col.names = c("Activity"))
testSubjects <- fread(SubjectTestFile, col.names = c("SubjectNum"))
testData <- cbind(testSubjects, testActivities, test)



#section 7
# merge training and testing data

combined <- rbind(trainingData, testData)


# Convert classLabels to activityName basically. More explicit. 

combined[["Activity"]] <- factor(combined[, Activity] , 
                                 levels = activityLabels[["classLabels"]] , 
                                 labels = activityLabels[["activityName"]])


combined[["SubjectNum"]] <- as.factor(combined[, SubjectNum])

moltendata <- reshape2::melt(data = combined, id = c("SubjectNum", "Activity"))

result <- reshape2::dcast(data = moltendata, SubjectNum + Activity ~ variable, fun.aggregate = mean)

#Write the data to the file
data.table::fwrite(x = result, file = outputFile, quote = FALSE)

Peer-graded Assignment: Getting and Cleaning Data Course Project
================


This repository contains the following files:

- `README.md`, this file, which provides an overview of the R script.
- `run_analysis.R`, the R script that is used to read the testing and traing datasets and create the outpue file `tidyData.txt`
- `tidyData.txt`, which contains the tidy data.
- `CodeBook.md`, the code book, which describes the contents of the data set (data, variables and transformations used to generate the data).


----------------


This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

1. Download the dataset from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in the working directory
2. Extract the data files from the .zip files downlaod in step 1 above
3. Load the activity and feature lables. 
4. keep only those features  that contains the word mean or std
5. Loads the training datasets for the features collected in step 4
6. Loads the testing datasets for the features collected in step 4
7. Loads the activity and subject data for each dataset, and merges those
   columns with the dataset
8. Merges training and testing datasets
9. Creates a tidy dataset that consists of the average value of each  variable for each subject and activity pair.
10. Store the result tidyData.txt file in the working directory







## Introduction
This repository has been created for the [Getting & Cleaning Data course on Coursera](https://www.coursera.org/course/getdata).

The purpose of the files within this repository is to create a tidy dataset with the data obtained from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The tidy dataset is produced from executing the R script [run_analysis.R](run_analysis.R). This script assumes the unzipped data to be within the current working directory.

[CodeBook.md](CodeBook.md) contains a description of the dataset and the fields therein produced from executing[run_analysis.R](run_analysis.R). 



## Steps for creating the tidy dataset
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.




library(data.table)

# This script performs the following operations on the data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip:
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# set to TRUE for verbose output
is.verbose <- TRUE
#------------------------------------------------------------------------------
# main entry point - call this function to tidy the data
# the tidy data is saved in the current directory
# as X_tidy.txt, y_tidy.txt, and subject_tidy.txt
run.analysis.main <- function(){
    tidy_dataset <- label.data(name.activities(extract.measurments(merge.data())))
    write.table(tidy_dataset$X, "X_tidy.txt")
    write.table(tidy_dataset$y, "y_tidy.txt")
    write.table(tidy_dataset$subject, "subject_tidy.txt")

    # step 5 of the exercise
    average.data(tidy_dataset)
}
#------------------------------------------------------------------------------
# 1. Merge the training and the test sets to create one data set.
# returns a list fo $X = merged X data, $y = merged y data, $subject = merged subject data
merge.data<- function(){
        # read the 'train' data
        if(is.verbose)
            print("reading train data")
        train_data <- read.ucihardata("train")
        # read the 'test' data
        if(is.verbose)
            print("reading test data")
        test_data <- read.ucihardata("test")

        list(X=rbind(train_data$X, test_data$X)
             , y=rbind(train_data$y, test_data$y)
             , subject=rbind(train_data$subject, test_data$subject))
}
#------------------------------------------------------------------------------
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# returns a list fo $X = extracted X data, $y = unmodified y data, $subject = unmodified subject data
extract.measurments <- function(merged_data){
    # the columns of merged_data$X that are measurments on mean and standard deviation
    # according to features.txt
    mean_std_columns <- c(1, 2, 3, 4, 5, 6                      # tBodyAcc
                          , 41, 42, 43, 44, 45, 46              # tGravityAcc 
                          , 81, 82, 83, 84, 85, 86              # tBodyAccJerk
                          , 121, 122, 123, 124, 125, 126        # tBodyGyro
                          , 161, 162, 163, 164, 165, 166        # tBodyGyroJerk
                          , 201, 202                            # tBodyAccMag
                          , 214, 214                            # tGravityAccMag
                          , 227, 228                            # tBodyAccJerkMag
                          , 240, 241                            # tBodyGyroMag
                          , 253, 254                            # tBodyGyroJerkMag
                          , 266, 267, 268, 269, 270, 271        # fBodyAcc
                          , 345, 346, 347, 348, 349, 350        # fBodyAccJerk
                          , 424, 425, 426, 427, 428, 429        # fBodyGyro
                          , 503, 504                            # fBodyAccMag
                          , 516, 517                            # fBodyBodyAccJerkMag
                          , 529, 530                            # fBodyBodyGyroMag
                          , 542, 543)                           # fBodyBodyGyroJerkMag
    list(X=merged_data$X[mean_std_columns]
         , y=merged_data$y
         , subject=merged_data$subject)
    
}
#------------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
name.activities <- function(extracted_data){
    # according to activity_labels.txt:
    #  1 WALKING
    #  2 WALKING_UPSTAIRS
    #  3 WALKING_DOWNSTAIRS
    #  4 SITTING
    #  5 STANDING
    #  6 LAYING
    ys <- as.character(extracted_data$y[,1])
    ys[ys == "1"] <- "WALKING"
    ys[ys == "2"] <- "WALKING_UPSTAIRS"
    ys[ys == "3"] <- "WALKING_DOWNSTAIRS"
    ys[ys == "4"] <- "SITTING"
    ys[ys == "5"] <- "STANDING"
    ys[ys == "6"] <- "LAYING"
    ys <- as.factor(ys)

    list(X=extracted_data$X
         , y=data.frame(ys)
         , subject=extracted_data$subject)

#     extracted_data$y$activity_name <- as.character(extracted_data$y[,1])
#     extracted_data$y$activity_name[extracted_data$y[,1] == 1] <- "WALKING"
#     extracted_data$y$activity_name[extracted_data$y[,1] == 2] <- "WALKING_UPSTAIRS"
#     extracted_data$y$activity_name[extracted_data$y[,1] == 3] <- "WALKING_DOWNSTAIRS"
#     extracted_data$y$activity_name[extracted_data$y[,1] == 4] <- "SITTING"
#     extracted_data$y$activity_name[extracted_data$y[,1] == 5] <- "STANDING"
#     extracted_data$y$activity_name[extracted_data$y[,1] == 6] <- "LAYING"
#     extracted_data$y$activity_name <- as.factor(extracted_data$y$activity_name)
#     extracted_data
}
#------------------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names. 
label.data <- function(data_in){
    xnames <- c("tBodyAccMeanX", "tBodyAccMeanY", "tBodyAccMeanZ", "tBodyAccStdX", "tBodyAccStdY", "tBodyAccStdZ"
                , "tGravityAccMeanX", "tGravityAccMeanY", "tGravityAccMeanZ", "tGravityAccStdX", "tGravityAccStdY", "tGravityAccStdZ"
                , "tBodyAccJerkMeanX", "tBodyAccJerkMeanY", "tBodyAccJerkMeanZ", "tBodyAccJerkStdX", "tBodyAccJerkStdY", "tBodyAccJerkStdZ"
                , "tBodyGyroMeanX", "tBodyGyroMeanY", "tBodyGyroMeanZ", "tBodyGyroStdX", "tBodyGyroStdY", "tBodyGyroStdZ" 
                , "tBodyGyroJerkMeanX", "tBodyGyroJerkMeanY", "tBodyGyroJerkMeanZ", "tBodyGyroJerkStdX", "tBodyGyroJerkStdY", "tBodyGyroJerkStdZ"
                , "tBodyAccMagMean", "tBodyAccMagStd"
                , "tGravityAccMagMean" , "tGravityAccMagStd"
                , "tBodyAccJerkMagMean", "tBodyAccJerkMagStd"
                , "tBodyGyroMagMean", "tBodyGyroMagStd"
                , "tBodyGyroJerkMagMean", "tBodyGyroJerkMagStd"
                , "fBodyAccMeanX", "fBodyAccMeanY", "fBodyAccMeanZ", "fBodyAccStdX", "fBodyAccStdY", "fBodyAccStdZ"
                , "fBodyAccJerkMeanX", "fBodyAccJerkMeanY", "fBodyAccJerkMeanZ", "fBodyAccJerkStdX", "fBodyAccJerkStdY", "fBodyAccJerkStdZ"
                , "fBodyGyroMeanX", "fBodyGyroMeanY", "fBodyGyroMeanZ", "fBodyGyroStdX", "fBodyGyroStdY", "fBodyGyroStdZ"
                , "fBodyAccMagMean", "fBodyAccMagStd"
                , "fBodyBodyAccJerkMagMean", "fBodyBodyAccJerkMagStd"
                , "fBodyBodyGyroMagMean", "fBodyBodyGyroMagStd"
                , "fBodyBodyGyroJerkMagMean", "fBodyBodyGyroJerkMagStd")
    ynames <- c("Activity.Name")
    snames <- c("Subject.ID")

    names(data_in$X) <- xnames
    names(data_in$y) <- ynames
    names(data_in$subject) <- snames
    data_in
}
#------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# data_in is a list with members X = separted/merged X data, y = separted/merged ydata, subject = subject data
average.data <- function(data_in){
    dsnew <- cbind(data_in$X, data_in$y, data_in$subject)
    names(dsnew) <- c(names(data_in$X), names(data_in$y), names(data_in$subject))
    res <- aggregate(. ~Subject.ID + Activity.Name, dsnew, mean)
    write.table(res, "average_data.txt")
}
#------------------------------------------------------------------------------
# utility functions
#------------------------------------------------------------------------------
data.directory <- function(){
        "UCI HAR Dataset/"
}
#------------------------------------------------------------------------------
read.ucihardata <- function(from) {
        xfn <- paste(data.directory(), from, "/X_", from, ".txt", sep="")
        yfn <- paste(data.directory(), from, "/y_", from, ".txt", sep="")
        sfn <- paste(data.directory(), from, "/subject_", from, ".txt", sep="")

        if(is.verbose)
            print( paste("reading X data from", xfn) )
        xdat <- read.table(xfn)

        if(is.verbose)
            print( paste("reading y data from", yfn) )
        ydat <- read.table(yfn)

        if(is.verbose)
            print( paste("reading subject data from", sfn) )
        sdat <- read.table(sfn)

        list(X=xdat, y=ydat, subject=sdat)
}


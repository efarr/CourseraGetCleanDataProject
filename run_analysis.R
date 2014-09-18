## Coursera Getting and Cleaning Data Class Project

library(dplyr)
library(tidyr)

## Download and unzip the file

## Read feature names
features <- read.table("./OriginalData/features.txt")
colnames(features) <- c("number", "name")

## Read activity labels
activities <- read.table("./OriginalData/activity_labels.txt")
colnames(activities) <- c("number", "name")

## Only columns with -mean or -std in the name.
desiredColumns <- subset(features, grepl("mean()", name, fixed=TRUE) | grepl("std()", name))

## Merge the training and the test sets to create one data set.
mergeFiles <- function(subjectFilename, xFilename, yFilename) {
    subjectFile <- read.table(subjectFileName)
    xFile <- read.table(xFileName)
    yFile <- read.table(yFileName)
    
    if (nrow(subjectFile) != nrow(xFile) | nrow(xFile) != nrow(yFile)) {
        stop("input files have different row counts")
    }
    
    
    
    allCols <- tbl_df(cbind(subjectFile, yFile, xFile))
}

testFile <- mergeFiles( "./OriginalData/test/subject_test.txt",
                        "./OriginalData/test/X_test.txt",
                        "./OriginalData/test/Y_test.txt")

trainFile <- mergeFiles( "./OriginalData/train/subject_test.txt",
                         "./OriginalData/train/X_test.txt",
                         "./OriginalData/train/Y_test.txt")

## Extract only the measurements on the mean and standard deviation for each measurement. 
## Get just the mean & std columns with select()


## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


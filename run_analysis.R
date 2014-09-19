## Coursera Getting and Cleaning Data Class Project

library(dplyr)
library(tidyr)

## Read feature names
features <- read.table("./OriginalData/features.txt")
colnames(features) <- c("number", "name")
features$name <- as.character(features$name)

## Read activity labels
activities <- read.table("./OriginalData/activity_labels.txt")
colnames(activities) <- c("number", "Activity")

## Only columns with -mean or -std in the name.
desiredColumns <- subset(features, grepl("mean()", name, fixed=TRUE) | grepl("std()", name))

## Clean up the column names
desiredColumns$name <- gsub("\\(|\\)", "", desiredColumns$name)
desiredColumns$name <- gsub("-", "_", desiredColumns$name)
desiredColumns$name <- gsub("^t", "", desiredColumns$name)
desiredColumns$name <- gsub("^f", "Freq_", desiredColumns$name)

## Combine test and train sets
trainRaw <- read.table("./OriginalData/train/X_train.txt")
testRaw <- read.table("./OriginalData/test/X_test.txt")

if (ncol(trainRaw) != ncol(testRaw)) {
    stop("input files have different column counts")
}

values <- tbl_df(rbind(trainRaw, testRaw))

## Select just std and mean columns
values <- values[,desiredColumns$number]
colnames(values) <- desiredColumns$name

## Combine test and train activity labels
trainRaw <- read.table("./OriginalData/train/Y_train.txt")
testRaw <- read.table("./OriginalData/test/Y_test.txt")

activity <- tbl_df(rbind(trainRaw, testRaw))

## Add descriptive labels
colnames(activity) <- "number"
activity <- left_join(activity, activities, by="number")
activity <- select(activity,2)

## Combine test and train subjects
trainRaw <- read.table("./OriginalData/train/subject_train.txt")
testRaw <- read.table("./OriginalData/test/subject_test.txt")
subject <- tbl_df(rbind(trainRaw, testRaw))
colnames(subject) <- "Subject"

tidy <- tbl_df(cbind(subject, activity, values))

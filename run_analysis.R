## Coursera Getting and Cleaning Data Class Project
library(dplyr)

dirName <- "./OriginalData"

trainFile <- paste(dirName, "train/X_train.txt", sep="/")
testFile <- paste(dirName, "test/X_test.txt", sep="/")
trainActFile <- paste(dirName, "train/Y_train.txt", sep="/")
testActFile <- paste(dirName, "test/Y_test.txt", sep="/")
trainSbjFile <- paste(dirName, "train/subject_train.txt", sep="/")
testSbjFile <- paste(dirName, "test/subject_test.txt", sep="/")
activityNameFile <- paste(dirName, "activity_labels.txt", sep="/")
featureFile <- paste(dirName, "features.txt", sep="/")

## Read feature names
features <- read.table(featureFile)
colnames(features) <- c("number", "name")

## Read activity labels
activities <- read.table(activityNameFile)
colnames(activities) <- c("number", "Activity")

## Only columns with -mean or -std in the name.
desiredColumns <- subset(features, 
                         grepl("mean()", name, fixed=TRUE) | grepl("std()", name))

## Clean up the column names
desiredColumns$name <- gsub("\\(|\\)", "", desiredColumns$name)
desiredColumns$name <- gsub("-", "_", desiredColumns$name)
desiredColumns$name <- gsub("^t", "", desiredColumns$name)
desiredColumns$name <- gsub("^f", "Freq_", desiredColumns$name)

## Combine test and train sets
values <- rbind(read.table(trainFile), read.table(testFile))

## Select just std and mean columns
values <- values[,desiredColumns$number]
colnames(values) <- desiredColumns$name

## Combine test and train activity types (numbered)
activityByNumber <- rbind(read.table(trainActFile), read.table(testActFile))

## Convert to descriptive labels
colnames(activityByNumber) <- "number" #Common column name to join on
activity <- left_join(activityByNumber, activities, by="number", by.y=1) %.% 
    select(2)

## Combine test and train subjects
subject <- rbind(read.table(trainSbjFile), read.table(testSbjFile))
colnames(subject) <- "Subject"

## Aggregate data into mean of feature value by subject and activity
final <- cbind(subject, activity, values) %.%
    group_by(Subject,Activity) %.%
    summarise_each(funs(mean))

#Write final, tidy file
write.csv(final, "means_by_subj_and_activivity.txt", row.names=FALSE)
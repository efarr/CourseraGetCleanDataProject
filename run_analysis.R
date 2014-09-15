## Coursera Getting and Cleaning Data Class Project

## Merge the training and the test sets to create one data set.
testSubject <- read.table("./OriginalData/test/subject_test.txt")
testX <- read.table("./OriginalData/test/X_test.txt")
testY <- read.table("./OriginalData/test/Y_test.txt")
print(nrow(testSubject))
print(nrow(testX))
print(nrow(testY))

## Extract only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


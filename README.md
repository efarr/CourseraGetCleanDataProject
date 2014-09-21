Getting and Cleaning Data Class Project
===============================

This is the class project for Coursera's [Getting and Cleaning Data](https://www.coursera.org/course/getdata) as part of the [Data Science Specialization](https://www.coursera.org/specialization/jhudatascience/1). It is designed to exercise and demonstrate the skills of tidying up messy data.

##Instructions:

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following.
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Project output:

| File        | Description  
|------------|------------------
| CodeBook.md | Description of data and process of clean-up and aggregation.
| run_analysis.R | Script for transforming raw data into single, tidy data set.
| means_by_subj_and_activivity.txt | Tidy data set with the average of each variable for each activity and each subject.

#Transformation Process

See *run_analysis.R* for actual operations, but here is the flow of the transformation:

Include dplyr package.

Take care of all of the file and directory names in the beginning.

Read the feature names from *features.txt* and filter down to just the ones related to mean and std.

Tidy up feature names by:

* removing parentheses
* converting dashes to underscores
* removing the 't' prefix
* converting the 'f' prefix to 'Freq_'

Combine test and training data into a single data frame.

Select features related to mean and std from the complete data frame using the filtered version of *features.txt* from above.

Apply the meaningful feature names created earlier to our data frame.  

Read activity descriptions from *activity_labels.txt*.

Combine numeric activity labels from the training and test data.

Join the numeric labels and the descriptive labels, then select only the descriptive labels.

Combined the Subject data (from train and test) with the descriptive activity data and the feature data. 

Aggregate feature data into averages for each subject for each activity.

Write the resulting data to a file called *means_by_subj_and_activivity.txt*. 

(See *run_analysis.R* for details of operations. Script requires the dplyr 0.2 package to be installed.


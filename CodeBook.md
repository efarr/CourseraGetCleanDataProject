Getting and Cleaning Data Class Project
===============================

#Original Data

The raw data was obtained here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Once unzipped, the files were placed in a directory named OriginalData. These were the files:

- README.txt

- *features_info.txt*: Shows information about the variables used on the feature vector.

- *features.txt*: List of all features.

- *activity_labels.txt*: Links the class labels with their activity name.

- *train/X_train.txt*: Training set.

- *train/y_train.txt*: Training labels.

- *train/subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- *test/X_test.txt*: Test set.

- *test/y_test.txt*: Test labels.

- *test/subject_test.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

#Transformation

Test and training data sets were combined into a single set.

Only the features related to mean and standard deviation were selected.

Meaningful column headers names were derived by the labels in *features.txt*.  

Meaningful activity labels were applied to the activity data from *activity_labels.txt* and attached to the data set.

Features were aggregated into feature averages for each subject for each activity.

The resulting data was written a file called *means_by_subj_and_activivity.txt*. 

See *run_analysis.R* for details of operations. Script requires the dplyr 0.2 package to be installed.

#Resulting Data

###Two aggregation variables:

*Subject*: Person performing the activity

*Activity*: What the subject was doing when the readings were taken.

###Sixty-six feature variables:

The 66 feature colums contain the averages of the original signals (by subject and activity). The original signals are described by the original experimenters:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

A Fast Fourier Transform (FFT) was applied to some of the signals that begin with ''Freq_'. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

Features are normalized and bounded within [-1,1].

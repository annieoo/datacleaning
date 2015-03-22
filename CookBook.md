# Codebook.md

# Course Project - Getting and Cleaning Data

## original data files

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data sets was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The data sets are called “X_train.txt” and X_test.txt”.

- The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Thus, the data sets have 30 Subject groups (1 to 30). The data sets are called “subject_train.txt” and “subject_test.txt”.  

- Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Thus, the data sets has 6 Activity groups.  The data sets are called “y_train.txt” and y_test.txt”.



## data sets

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

These signals were used to estimate variables of the feature vector for each pattern:  
- ‘-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
- prefix t indicate time domain signals
- prefix f indicate frequency domain signals

```
Accelerometer		Gyroscope	Total variables (33)tBodyAcc-XYZ		tBodyGyro-XYZ		6tGravityAcc-XYZ	                                3tBodyAccJerk-XYZ	tBodyGyroJerk-XYZ	6tBodyAccMag		tBodyGyroMag		2tGravityAccMag					1tBodyAccJerkMag		tBodyGyroJerkMag	2fBodyAcc-XYZ		fBodyGyro-XYZ		6fBodyAccJerk-XYZ				3fBodyAccMag		fBodyGyroMag		2fBodyAccJerkMag		fBodyGyroJerkMag	2
```

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

**Each record has 561 columns with time and frequency domain variables.**

The complete list of variables of each feature vector is available in ‘column_’labels.csv’ in the Github repository (https://github.com/annieoo/datacleaning).





- how to use each data files
- variables used
- column names


- column_label_transform.csv
- column_labels.csv
- activity_labels.txt - information only

Source Data Sets
- from where
- Test Data sets - test data folder
- Training Data sets - training data folder
- download to your working directory

Data Scope
- takes all columns with mean() and std()
- 33 each

- explain how the script work (run_analysis.R)


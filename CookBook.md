# Codebook.md

# Course Project - Getting and Cleaning Data

## (A) original data files

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data sets was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The data sets are called “X_train.txt” and X_test.txt”.

- The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Thus, the data sets have 30 Subject groups (1 to 30). The data sets are called “subject_train.txt” and “subject_test.txt”.  

- Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Thus, the data sets has 6 Activity groups.  The data sets are called “y_train.txt” and y_test.txt”.



## (B) source data sets

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

These signals were used to estimate variables of the feature vector for each pattern:  
- ‘-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
- prefix t indicate time domain signals
- prefix f indicate frequency domain signals
- Acc: accelerometer raw signals
- Gyro: gyroscope raw signals
- Body or Gravity: body or gravity signals
- Jerk: signal derived from body linear acceleration and angular velocity
- Mag: magnitude of these three-dimensional signals
```
Accelerometer		Gyroscope         Total variables (33)tBodyAcc-XYZ		tBodyGyro-XYZ		6tGravityAcc-XYZ	        		        3tBodyAccJerk-XYZ	tBodyGyroJerk-XYZ	6tBodyAccMag	        tBodyGyroMag		2tGravityAccMag			                1tBodyAccJerkMag		tBodyGyroJerkMag	2fBodyAcc-XYZ		fBodyGyro-XYZ		6fBodyAccJerk-XYZ		                3fBodyAccMag	        fBodyGyroMag		2fBodyAccJerkMag		fBodyGyroJerkMag	2
```

The set of variables that were estimated from these signals are: 
```
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
```

**Each record has 561 columns with time and frequency domain variables.**

The complete list of variables of each feature vector is available in “column_’labels.csv” in the Github repository (https://github.com/annieoo/datacleaning).


## (C) tidy data set
- is generated from the R script (run_analysis.R), and is called “TidyData.txt”
- only extract mean and standard deviation for each measurement/features listed above. 
  - only variables contains mean() and std()
  - there are 66 measurements: 33 mean and 33 standard deviation
- **has total 180 observations of 68 variables** 
  - 180 observations: 30 SubjectID x 6 Activity
  - 68 variables: 1 SubjectID, 1 Activity and 66 measurements 

- the variable names are transformed to be more descriptive. Refers to “column_label_transform.csv” for the complete list.
  - X, Y or Z: is used to denote 3-axial signals in the X, Y and Z directions.
  - prefix t indicate time domain signals
  - prefix f indicate frequency domain signals
  - Accel: accelerometer raw signals
  - Gyro: gyroscope raw signals
  - Body or Gravity: body or gravity signals
  - Jerk: signal derived from body linear acceleration and angular velocity
  - Mag: magnitude of these three-dimensional signals
  - ‘_mean’: mean value
  - ‘_std’: standard deviation
- a few examples:
```     
tBodyAccel_meanXtBodyAccel_stdXtGravityAccel_meanYtGravityAccel_stdY
tBodyAccelJerk_meanZ
tBodyGyroJerk_meanX
tBodyGyroJerk_stdX
fBodyGyroJerkMag_meanfBodyGyroJerkMag_std
```

## (C) the R script: run_analysis.R
For how to obtain data files and their requirements, refers to README.md section (B) Pre-requisite (what is needed before running the R script).

The R script programming logic:
1. read in all 8 data files:
   - test data set (X_test.txt), test subject data set (subject_text.txt), test activity data set (y_test.txt)
   - training data set (X_train.txt), training subject data set (subject_train.txt), training activity data set (y_train.txt)
   - column_labels.csv: provide column names to the original data sets
   - column_label_transform.csv: provide column names to the tidy data sets

2. assign/map column names to data sets
   - column_labels.csv to X_test.txt and X_train.txt

3. based on activity_label.txt, manually assign activity column with descriptive names
   - 1 = WALKING
   - 2 = WALKING UPSTAIRS
   - 3 = WALKING DOWNSTAIRS
   - 4 = SITTING
   - 5 = STANDING
   - 6 = LAYING

4. merge Subject and Activity training data to Training data sets, and create a new data set called “newTrain2”.  

5. merge Subject and Activity test data to Test data sets, and create a new data set called “newTest2”.

6. finally merge Training and Test data sets(newTrain2, newTest2), and create a new data set calledd “newDS”.

7. To extract only measurement name contains mean() or std(), and create a new data set called “subDS”.

8. assign/map column names to the new data set
   - column_label_transform.csv to subDS

9. to generate tidy data set, group by the data set (subDS) for each Subject and Activity, and apply average/mean for each variables.  Create a new tidy data set called “MyTidyData”.

10. generate tidy data file using “write.table”. The tidy data file is called “TidyData.txt”, and is created at the subdirectory “./data1”.







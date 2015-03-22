# README.md

# Course Project - Getting and Cleaning Data

## Introduction

This programming project require to write an R script that is able to collect, work with, and clean data sets. There are two data sets to work with - Test and Training. The R script will:
* merge these two data sets, 
* extract specific measurements (mean and standard deviation), 
* clean and transform the data sets, and 
* create an independent tidy data sets with the average/mean of each variable, and group by each Subject and each Activity.

The result of this project will produce:
* an R script called run_analysis.R
* tidy data set called TidyData.txt
* README.md file
* Cookbook.md file


## Pre-requisite (what is needed before running the R script) 

### 1) obtain source data
Two data sets are needed for this purpose:
* Test data sets
* Training data sets

The original data sets was obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

However, the required data sets can also be obtained from the Github repository:
https://github.com/annieoo/datacleaning

* testdata folder - Test data sets
* training folder - Training Data sets


### 2) additional data files  
* column_labels.csv - provide column names to the original data sets. This file is originated from the original data file called features.txt
* column_label_transform.csv - provide column names to the tidy data sets. The names are transformed to be more descriptive.
* activity_labels.txt - information only; the R script will use this information and manually transform the activity codes to these labels/names.

### 3) specific file location
- download the original data sets or required data sets into the working directory. 
- create sub directory “./data1” 
  - if download and unzip the original data sets, a new folder call “UCI HAR Dataset” will be created. To simplify the naming usage in the R script, rename the folder to “UCIHARDataset”. 
  - if download testdata and training folders from Github, create a sub folder called “UCIHARDataset” in “./data1” directory. Rename the folder name from testdata to test and training to train. Then transfer these folders to “./data1/UCIHardataset”


### 4) data sets
The required data sets by the R script are (location and name):

- ./data1/UCIHARDataset/train/X_train.txt
- ./data1/UCIHARDataset/train/y_train.txt
- ./data1/UCIHARDataset/train/subject_train.txt
- ./data1/UCIHARDataset/test/X_test.txt
- ./data1/UCIHARDataset/test/y_test.txt
- ./data1/UCIHARDataset/test/subject_test.txt
- ./data1/UCIHARDataset/column_labels.csv
- ./data1/UCIHARDataset/column_label_transform.csv

### 5) the R script: run_analysis.R
- download from the Github repository and transfer to the working directory.


## The R script: run_analysis.R

* how to run the R script
-  open R or R-Studio 
-  at the prompt,load the dplyr library:  
   - library(dplyr)
-  at the prompt, load/source the R script (make sure the R script is in the working directory):
   - source(“run_analysis.R”)
   The script will run and generate a tidy data set called “TidyData.txt”.

* how to read the tidy data set 
- the data set is in text format. Simply double click on the file to open and view the data.
- to make it more readable, open the file with MS-Excel. A sample tidy data set in excel format called “TidyData_excel.xlsx” can be download from the Github repository (https://github.com/annieoo/datacleaning).
- you may read the file using R.
   - rdfile <- read.table(“./data1/TidyData.txt”, header=TRUE)
   - head(refile) 


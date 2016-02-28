==================================================================
Human activity recognition by smartphones
Data manipulation R script

Version 1.0
Author: M.T. Westra
==================================================================

## Description
This R script manipulates the Human Activity Recognition Using Smartphones dataset available at the UC Irvine Machine Learning Repository.

It consists of a single R script `run_analysis.R`, which acts on a dataset which is available from the UCI Machine Learning Repository. The dataset is described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The actual data can be downloaded here: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/

Please refer to the license and rules for acknowledgement for the data as descibed in the README.md file in the dataset zip file.

## What the script does
The script performs the following actions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject and saves it to the file `tidy.csv`


A full description of the variables, data, and transformations used is avaialble in the file CodeBook.md in the R directory.

## How to get the data
 Download the `UCI HAR Dataset.zip` file from the link above, put it in the same  folder as the R script and unzip it. This will give you a folder `UCI HAR Dataset`.

## Running the R script
From the command line, run:
    Rscript run_analysis.R

The result file `tidy.csv` will be placed in the same folder as the R script.

## Background
This script was created as part of the Getting and Cleaning Data course offered by Coursera.

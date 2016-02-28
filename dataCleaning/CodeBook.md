 ==================================================================
Human activity recognition by smartphones
Codebook

Version 1.0
Author: M.TWestra
==================================================================

Here we describe the variables and data transformations as used by this script. For full information of the original data set variables, please consult the file features_info.txt included in the data set.

The script creates a derived dataset which contain subsets and aggregates of the original data set. The data transformations used are described in more detail below.

## Variables
The derived data sets transformed data set contains the following 81 variables:

1 subject
2 activity.label
3 tBodyAcc-mean()-X
4 tBodyAcc-mean()-Y
5 tBodyAcc-mean()-Z
6 tBodyAcc-std()-X
7 tBodyAcc-std()-Y
8 tBodyAcc-std()-Z
9 tGravityAcc-mean()-X
10 tGravityAcc-mean()-Y
11 tGravityAcc-mean()-Z
12 tGravityAcc-std()-X
13 tGravityAcc-std()-Y
14 tGravityAcc-std()-Z
15 tBodyAccJerk-mean()-X
16 tBodyAccJerk-mean()-Y
17 tBodyAccJerk-mean()-Z
18 tBodyAccJerk-std()-X
19 tBodyAccJerk-std()-Y
20 tBodyAccJerk-std()-Z
21 tBodyGyro-mean()-X
22 tBodyGyro-mean()-Y
23 tBodyGyro-mean()-Z
24 tBodyGyro-std()-X
25 tBodyGyro-std()-Y
26 tBodyGyro-std()-Z
27 tBodyGyroJerk-mean()-X
28 tBodyGyroJerk-mean()-Y
29 tBodyGyroJerk-mean()-Z
30 tBodyGyroJerk-std()-X
31 tBodyGyroJerk-std()-Y
32 tBodyGyroJerk-std()-Z
33 tBodyAccMag-mean()
34 tBodyAccMag-std()
35 tGravityAccMag-mean()
36 tGravityAccMag-std()
37 tBodyAccJerkMag-mean()
38 tBodyAccJerkMag-std()
39 tBodyGyroMag-mean()
40 tBodyGyroMag-std()
41 tBodyGyroJerkMag-mean()
42 tBodyGyroJerkMag-std()
43 fBodyAcc-mean()-X
44 fBodyAcc-mean()-Y
45 fBodyAcc-mean()-Z
46 fBodyAcc-std()-X
47 fBodyAcc-std()-Y
48 fBodyAcc-std()-Z
49 fBodyAcc-meanFreq()-X
50 fBodyAcc-meanFreq()-Y
51 fBodyAcc-meanFreq()-Z
52 fBodyAccJerk-mean()-X
53 fBodyAccJerk-mean()-Y
54 fBodyAccJerk-mean()-Z
55 fBodyAccJerk-std()-X
56 fBodyAccJerk-std()-Y
57 fBodyAccJerk-std()-Z
58 fBodyAccJerk-meanFreq()-X
59 fBodyAccJerk-meanFreq()-Y
60 fBodyAccJerk-meanFreq()-Z
61 fBodyGyro-mean()-X
62 fBodyGyro-mean()-Y
63 fBodyGyro-mean()-Z
64 fBodyGyro-std()-X
65 fBodyGyro-std()-Y
66 fBodyGyro-std()-Z
67 fBodyGyro-meanFreq()-X
68 fBodyGyro-meanFreq()-Y
69 fBodyGyro-meanFreq()-Z
70 fBodyAccMag-mean()
71 fBodyAccMag-std()
72 fBodyAccMag-meanFreq()
72 fBodyBodyAccJerkMag-mean()
73 fBodyBodyAccJerkMag-std()
74 fBodyBodyAccJerkMag-meanFreq()
75 fBodyBodyGyroMag-mean()
76 fBodyBodyGyroMag-std()
77 fBodyBodyGyroMag-meanFreq()
78 fBodyBodyGyroJerkMag-mean()
79 fBodyBodyGyroJerkMag-std()
80 fBodyBodyGyroJerkMag-meanFreq()

## Description of the variables
The 'subject' variable denotes the id of the test person.

The 'activity.label' variable denotes the type of activity, and can be:
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

The rest of the variables are measures of the following base set of measured parameters:
tBodyAcc - body linear acceleration along 3 axis
tGravityAcc - gravity linear acceleration along 3 axis
tBodyAccJerk - derivative of body linear acceleration along 3 axis
tBodyGyro - body angular velocity along 3 axis
tBodyGyroJerk - derivative of body angular velocity along 3 axis
tBodyAccMag - total magnitude of body linear acceleration
tGravityAccMag - total magnitude of gravity linear acceleration
tBodyAccJerkMag - derivative of total magnitude of body linear acceleration
tBodyGyroMag - total magnitude of body angular velocity
tBodyGyroJerkMag - derivative of total magnitude of body angular velocity
fBodyAcc - body linear acceleration in frequency domain
fBodyAccJerk - derivative of body linear acceleration in frequency domain
fBodyGyro - body angular velocity in frequency domain
fBodyAccMag - total magnitude of body linear acceleration in frequency domain
fBodyBodyAccJerkMag - derivative of total magnitude of body linear acceleration in frequency domain
fBodyBodyGyroMag - total magnitude of body angular velocity in frequency domain
fBodyBodyGyroJerkMag - derivative of total magnitude of angular velocity in frequency domain

* X, Y and Z denote the value of the parameter along the X, Y, and Z axis.
* mean() denotes the numerical mean
* std() denotes the standard deviation
* meanFreq() denotes the weighted average of the frequency components to obtain a mean frequency

## Data transformations
The following data transformations were used to arrive at the derived data set:

* Combine the test and training data sets into a single data set
* extract the columns with parameters that are either a mean, or a standard deviation
* replace the activity codes with descriptive activity labels
* use the descriptive parameter names as column headers
* aggregate the data on the subject and activity.label parameters
* for each aggregate combination, compute the mean for each of the parameters
* sort the dataset by subject, so that all data for a single subject is in adjacent rows.

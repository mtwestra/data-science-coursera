## Human activity recognition by smartphones
## Version: 1.0
## Author: M.T. Westra

## This R script takes data from the UCI Human activity recognition by smartphones dataset,
## and creates a tidy dataset consisting of averages over subject and activity, for mean and
## standard deviation variables.
## All variables and data transformations are described in detail in CodeBook.md

####################  Section 1  -  combine datasets ##################################
## read in the training and test data files, and combine them into single dataframes
## first, read in the test data and create data frames
subject <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)

## next, load the training data and combine it with the previously created dataframes
## remove dataframes that we don't need anymore, to conserve memory
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject <- rbind(subject, subject_train)
rm(subject_train)

x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
x <- rbind(x, x_train)
rm(x_train)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
y <- rbind(y, y_train)
rm(y_train)

## Make column names more meaningful
colnames(subject) <- c("subject")
colnames(y) <- c("activity.code")

## combine in a single data set, with the subject first, then the activity, then the features
## we start with x, as to preserve the column indices, which we need in the next step.
dataset <- cbind(x,y,subject)

################  Section 2  -  keep only selected columns ########################

## identify the column indexes of the mean and standard deviation variables
## we select based on if a variable name starts with "-mean", or "-std".
## this includes variables starting with 'meanFreq()', but exludes a number
## of variables which contain 'gravityMean' or 'tBodyAccMean', for example.
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
useFeaturesIndexes <- grep("-mean|-std",features$V2)

## add the subject and y column, otherwise we loose them when we subset
## it would be easier to first subset and then combine the datasets,
## but here we are following the instructions in the assignment to the letter.
indexSubject <- grep("subject", colnames(dataset))
indexActivity <- grep("activity.code", colnames(dataset))
selectColumns <- c(useFeaturesIndexes,indexSubject,indexActivity)

## subset the x dataframe
dataset <- dataset[,selectColumns]

################# Section 3  - use descriptive activity names ################################
## get the activity label corresponding to the activity code.
## we make use of the fact that the activity code corresponds to the index in the file.
activityLabels <-  read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activityLabels) <- c("code","label")
dataset <- transform(dataset,activity.label = activityLabels[activity.code,"label"])

## remove code column, which is not needed anymore
dataset <- subset(dataset, select = -c(activity.code))

################## Section 4 - use descriptive variable names ###############################
## we reuse the variable names from the original data set. The meaning of these terms are explained
## in the file CodeBook.md. We need to add the subject and activity.label names additionaly

columnNames <- c(as.character(features[useFeaturesIndexes,"V2"]),"subject","activity.label")
names(dataset) <- columnNames

################ section 5  -  create tidy data set containing averages #####################
## aggregate by subject and activity label
agg <- aggregate(dataset,by=list(subj = dataset$subject, label = dataset$activity.label),FUN=mean)

## remove original subject and activity.label columns, as we have just aggregated on them
agg <- subset(agg, select = -c(subject,activity.label))

## rename the new aggragation variable columns
names(agg)[names(agg) == 'subj'] <- 'subject'
names(agg)[names(agg) == 'label'] <- 'activity.label'
tidyData <- agg[order(agg$subject),]

## write the result to a file in the /result folder
write.table(tidyData, file = "tidy.txt",row.names=FALSE)

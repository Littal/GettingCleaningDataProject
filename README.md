# Getting and Cleaning Data - Project

	The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
	The goal is to prepare tidy data that can be used for later analysis. 

## The outputs of this project are 

	1) a tidy data set (see description below)
	2) a link to a Github repository with a script for performing the analysis
	3) a code book that describes the variables, the data, and transformations that have been performed to clean up the data

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## About the raw data:
## Human activities recorded while wearing a smartphone

The project data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The data was originally obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The following description was found at that site, and is valuable for understanding the work flow and output of this project:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
	Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
	Using its embedded accelerometer and gyroscope, the experiment captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
	The experiments have been video-recorded to label the data manually. 
	The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
	The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
	The gravitational force is assumed to have low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
	From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

	For each record in the dataset it is provided: 
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.

	The linear acceleration signal from the smartphone accelerometer in standard gravity units 'g'. 
	The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
	The body gyroscope measures are the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
	All features are normalized and bounded within [-1,1].

Check the above mentioned URL for further details about the dataset. 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## About the data set collected, worked with, and cleaned
## in this project, and the output txt file:

A zip file was downloaded from the following URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script called run_analysis.R in this repo does the following, in order to extract the file "SecondTidyData.txt": 
	- Merges the training and the test sets to create one data set.
	- Extracts only the measurements on the mean and standard deviation for each measurement. 
	- Uses descriptive activity names to name the activities in the data set
	- Appropriately labels the data set with descriptive variable names. 
	- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#### Important note about running the script:
In order to obtain the output txt file described below, the R script "run_analysis.R" must be run sequentially, with NO SKIPING on subsequent parts.

#### Important note about working directory:
The R script "run_analysis.R" was run on the working directory "~/Data_Science_Courses/3 Getting and Cleaning Data". 
(The working directory has been changed, though, when ever needed to explore the raw files. The relevant working directories are specified in the work flow detailed bellow).

#### Important note about usage of dplyr package:
The R script "run_analysis.R" included the usage of functions from the dplyr package, assuming pre instalation of this package. 
When needed in the script, the function library(dplyr) is called.    

#### Important note about the output txt file:  
The file "SecondTidyData.txt" has 180 rows, each represent a pair of subject and activity in the experiment (30 subjects x 6 activities per subjects).
The file "SecondTidyData.txt" has 68 columns. The first and second columns represent, respectively, subjects and activities. 
The remain 66 columns are calculated means of measurments chosen to be included in data, i.e, measurements on the mean and standard deviation for each measurement of the experiment.  
The file format is txt, in which variables are delimited by space. The first raw of the txt file contains the variable names.
There is no need to run the "run_analysis.R" script in order to see the output txt file, since it is pushed to the repo for convenience.

For additional details about the project's work flow, in R code, read bellow:

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- 


####Code for downloading zip file from URL, unziping, reading, exploring files dimentions

```{r}
setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")
FileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(FileURL, destfile = "Human_Activity_Recognition_Using_Smartphones.zip", mode = "wb")
list.files()

unzip("Human_Activity_Recognition_Using_Smartphones.zip")

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data/UCI HAR Dataset/test")
list.files()
Xtest <- read.table("X_test.txt")
dim(Xtest)
Ytest <- read.table("y_test.txt")
dim(Ytest)
Stest <- read.table("subject_test.txt")
dim(Stest)

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data/UCI HAR Dataset/train")
list.files()
Xtrain <- read.table("X_train.txt")
dim(Xtrain)
Ytrain <- read.table("y_train.txt")
dim(Ytrain)
Strain <- read.table("subject_train.txt")
dim(Strain)
```

####Code for merging the "train" and the "test" sets to create one data set, and checking file dimention

```{r}
setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")

TestData <- cbind(Stest, Ytest, Xtest)
TrainData <- cbind(Strain, Ytrain, Xtrain)
RawData <- rbind(TestData, TrainData)
dim(RawData)
```

####Code for naming data set variables, according to features file, using valid names 

```{r}
setwd("~/Data_Science_Courses/3 Getting and Cleaning Data/UCI HAR Dataset")
list.files()
Features <- read.table("features.txt")
dim(Features)
class(Features)

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")
Variables <- as.character(Features[, 2])
class(Variables)

SubjectCode <- c("SubjectCode")
ActivityCode <- c("ActivityCode")
AllVariables <- c(SubjectCode, ActivityCode, Variables)
validAllVariables <- make.names(AllVariables, unique = TRUE, allow_ = TRUE)

colnames(RawData) <- validAllVariables
names(RawData)
```

####Code for extracting only the measurements on the mean and standard deviation for each measurement

```{r}
library(dplyr)
SubsetData_S <- RawData[, 1:2]
SubsetData_mean <- select(RawData, contains(".mean.."))
SubsetData_std <- select(RawData, contains(".std.."))
SubsetData <- cbind(SubsetData_S, SubsetData_mean, SubsetData_std)
str(SubsetData)
```

####Code for Using descriptive activity names to name the activities in the data set (i.e., made it a factor variable)

```{r}
setwd("~/Data_Science_Courses/3 Getting and Cleaning Data/UCI HAR Dataset")
list.files()
Activities <- read.table("activity_labels.txt")
dim(Activities)
class(Activities)
ActivitiesVec <- Activities[,2]
class(ActivitiesVec)

SubsetData$ActivityCode <-as.factor(SubsetData$ActivityCode)
class(SubsetData$ActivityCode)
levels(SubsetData$ActivityCode) <- ActivitiesVec
str(SubsetData$ActivityCode)
summary(SubsetData$ActivityCode)
```

####Code for labeling the data set with descriptive variable names, (in few steps, each for every term)

```{r}
NewName1 <- sub("std", "STD", names(SubsetData[3:68]))
NewName2 <- sub("mean", "MEAN", NewName1)
NewName3 <- sub("t", "Time", NewName2)
NewName4 <- sub("f", "Frequency", NewName3)
NewName5 <- sub("BodyAcc", "BodyAccelometer", NewName4)
NewName6 <- sub("GravityAcc", "GravityAccelometer", NewName5)
NewName7 <- sub("Gyro", "Gyroscope", NewName6)
NewName8 <- sub("Mag", "Magnitude", NewName7)
NewName8

newAllVariables <- c(SubjectCode, ActivityCode, NewName8)
colnames(SubsetData) <- newAllVariables
names(SubsetData)
str(SubsetData)
```

####Code for creating a second, independent tidy data set with the average of each variable for each activity and each subject

```{r}
library(dplyr)
SubsetData$SubjectCode <-as.factor(SubsetData$SubjectCode)
str(SubsetData)

SecondTidyData <- summarise_each_(group_by(SubsetData, SubjectCode, ActivityCode), funs(mean), names(SubsetData[3:68]))
str(SecondTidyData)
head(SecondTidyData, 18)

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")
write.table(SecondTidyData, file = "SecondTidyData.txt", row.name=FALSE)
```

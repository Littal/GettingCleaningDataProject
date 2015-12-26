setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")

#Download zip file from URL
#--------------------------

FileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(FileURL, destfile = "Human_Activity_Recognition_Using_Smartphones.zip", mode = "wb")
list.files()


#Unzip, read, explore files dimentions
#-------------------------------------

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


#Merge the training and the test sets to create one data set, check file dimention
#----------------------------------------------------------------------------------

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")

TestData <- cbind(Stest, Ytest, Xtest)
TrainData <- cbind(Strain, Ytrain, Xtrain)
RawData <- rbind(TestData, TrainData)
dim(RawData)


#Name data set variables, according to features file, using valid names 
#----------------------------------------------------------------------

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


#Extract only the measurements on the mean and standard deviation for each measurement
#--------------------------------------------------------------------------------------

library(dplyr)
SubsetData_S <- RawData[, 1:2]
SubsetData_mean <- select(RawData, contains(".mean.."))
SubsetData_std <- select(RawData, contains(".std.."))
SubsetData <- cbind(SubsetData_S, SubsetData_mean, SubsetData_std)
str(SubsetData)


#Use descriptive activity names to name the activities in the data set (i.e., made it a factor)
#-----------------------------------------------------------------------------------------------

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


#Label the data set with descriptive variable names, (few steps, each for every term)
#------------------------------------------------------------------------------------

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


#Create a second, independent tidy data set with the average of each variable for each activity and each subject
#---------------------------------------------------------------------------------------------------------------

library(dplyr)
SubsetData$SubjectCode <-as.factor(SubsetData$SubjectCode)
str(SubsetData)

SecondTidyData <- summarise_each_(group_by(SubsetData, SubjectCode, ActivityCode), funs(mean), names(SubsetData[3:68]))
str(SecondTidyData)
head(SecondTidyData, 18)

setwd("~/Data_Science_Courses/3 Getting and Cleaning Data")
write.table(SecondTidyData, file = "SecondTidyData.txt", row.name=FALSE)

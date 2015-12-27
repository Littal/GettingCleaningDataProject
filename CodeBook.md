# Researcher Dictionary: Getting & Cleaning Data - Project
# Human activities recorded while wearing a smartphone
# Version 1.0
# December 27, 2015 


## Introduction

The project data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The data was originally obtained from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
The following description was found at that site, and it is valuable for understanding the further work flow and data output:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
	Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
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
	- An identifier of the subject who carried out the experiment.The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 

	Additional details about the measurements:
	The linear acceleration signal from the smartphone accelerometer in standard gravity units 'g'. 
	The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
	The body gyroscope measures are the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
	All features are normalized and bounded within [-1,1].


## Dataset Description

To obtain the project dataset, a zip file was downloaded from the following URL: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Using R script called run_analysis.R, the following processes revealed this dataset, called "SecondTidyData.txt": 
* Merging the training and the test sets to create one data set.
* Extracting only the measurements on the mean and standard deviation for each measurement. 
* Using descriptive activity names to name the activities in the data set.
* Labeling the data set with descriptive variable names. 
* Creating a second independent tidy data set with the average of each variable chosen, for each activity and each subject. 

The file "SecondTidyData.txt" has 180 rows, each represent a pair of subject and activity in the experiment (30 subjects x 6 activities per subjects).
The file "SecondTidyData.txt" has 68 columns. The first and second columns represent, respectively, subjects and activities. 
The remain 66 columns are calculated means of measurments chosen to be included in data, i.e, measurements on the mean and standard deviation for each measurement of the experiment.  
The file format is txt, in which variables are delimited by spaces. The first raw of the txt file contains the variable names. 

For additional details about the script "run_analysis.R", i.e, the work flow of creating this dataset called "SecondTidyData", please read the ReadMe.md file in the project repo.


## List of Variables

	* 1 SubjectCode ----------------------------------------- Factor with 30 levels, indicating each of 30 subjects who participated in the experiments.
	* 2 ActivityCode ---------------------------------------- Factor with 6 levels, indicating each of 6 activities that subjects performed in the experiments.
	* 3 TimeBodyAccelometer.MEAN...X ------------------------ numeric calculated mean of experiment measurment - mean of time body accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 4 TimeBodyAccelometer.MEAN...Y ------------------------ numeric calculated mean of experiment measurment - mean of time body accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 5 TimeBodyAccelometer.MEAN...Z ------------------------ numeric calculated mean of experiment measurment - mean of time body accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 6 TimeGravityAccelometer.MEAN...X --------------------- numeric calculated mean of experiment measurment - mean of time gravity accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 7 TimeGravityAccelometer.MEAN...Y --------------------- numeric calculated mean of experiment measurment - mean of time gravity accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 8 TimeGravityAccelometer.MEAN...Z --------------------- numeric calculated mean of experiment measurment - mean of time gravity accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 9 TimeBodyAccelometerJerk.MEAN...X -------------------- numeric calculated mean of experiment measurment - mean of time body accelometer jerks on axis x (g units, normalized and bounded within [-1,1])
	* 10 TimeBodyAccelometerJerk.MEAN...Y ------------------- numeric calculated mean of experiment measurment - mean of time body accelometer jerks on axis y (g units, normalized and bounded within [-1,1])
	* 11 TimeBodyAccelometerJerk.MEAN...Z ------------------- numeric calculated mean of experiment measurment - mean of time body accelometer jerks on axis z (g units, normalized and bounded within [-1,1])
	* 12 TimeBodyGyroscope.MEAN...X	------------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope on axis x (radians/second units, normalized and bounded within [-1,1])
	* 13 TimeBodyGyroscope.MEAN...Y	------------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope on axis y (radians/second units, normalized and bounded within [-1,1])
	* 14 TimeBodyGyroscope.MEAN...Z ------------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope on axis z (radians/second units, normalized and bounded within [-1,1])
	* 15 TimeBodyGyroscopeJerk.MEAN...X --------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope jerks on axis x (radians/second units, normalized and bounded within [-1,1])
	* 16 TimeBodyGyroscopeJerk.MEAN...Y --------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope jerks on axis y (radians/second units, normalized and bounded within [-1,1])
	* 17 TimeBodyGyroscopeJerk.MEAN...Z --------------------- numeric calculated mean of experiment measurment - mean of time body gyroscope jerks on axis z (radians/second units, normalized and bounded within [-1,1])
	* 18 TimeBodyAccelometerMagnitude.MEAN.. ---------------- numeric calculated mean of experiment measurment - mean of time body accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 19 TimeGravityAccelometerMagnitude.MEAN.. ------------- numeric calculated mean of experiment measurment - mean of time gravity accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 20 TimeBodyAccelometerJerkMagnitude.MEAN.. ------------ numeric calculated mean of experiment measurment - mean of time body accelometer jerks magnitude (g units, normalized and bounded within [-1,1])
	* 21 TimeBodyGyroscopeMagnitude.MEAN.. ------------------ numeric calculated mean of experiment measurment - mean of time body gyroscope magnitude (radians/second units, normalized and bounded within [-1,1])
	* 22 TimeBodyGyroscopeJerkMagnitude.MEAN.. -------------- numeric calculated mean of experiment measurment - mean of time body gyroscope jerks magnitude (radians/second units, normalized and bounded within [-1,1])
	* 23 FrequencyBodyAccelometer.MEAN...X ------------------ numeric calculated mean of experiment measurment - mean of frequency body accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 24 FrequencyBodyAccelometer.MEAN...Y ------------------ numeric calculated mean of experiment measurment - mean of frequency body accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 25 FrequencyBodyAccelometer.MEAN...Z ------------------ numeric calculated mean of experiment measurment - mean of frequency body accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 26 FrequencyBodyAccelometerJerk.MEAN...X -------------- numeric calculated mean of experiment measurment - mean of frequency body accelometer jerks on axis x (g units, normalized and bounded within [-1,1])
	* 27 FrequencyBodyAccelometerJerk.MEAN...Y -------------- numeric calculated mean of experiment measurment - mean of frequency body accelometer jerks on axis y (g units, normalized and bounded within [-1,1])
	* 28 FrequencyBodyAccelometerJerk.MEAN...Z -------------- numeric calculated mean of experiment measurment - mean of frequency body accelometer jerks on axis z (g units, normalized and bounded within [-1,1])
	* 29 FrequencyBodyGyroscope.MEAN...X -------------------- numeric calculated mean of experiment measurment - mean of frequency body gyroscope on axis x (radians/second units, normalized and bounded within [-1,1])
	* 30 FrequencyBodyGyroscope.MEAN...Y -------------------- numeric calculated mean of experiment measurment - mean of frequency body gyroscope on axis y (radians/second units, normalized and bounded within [-1,1])
	* 31 FrequencyBodyGyroscope.MEAN...Z -------------------- numeric calculated mean of experiment measurment - mean of frequency body gyroscope on axis z (radians/second units, normalized and bounded within [-1,1])
	* 32 FrequencyBodyAccelometerMagnitude.MEAN.. ----------- numeric calculated mean of experiment measurment - mean of frequency body accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 33 FrequencyBodyBodyAccelometerJerkMagnitude.MEAN.. --- numeric calculated mean of experiment measurment - mean of frequency body accelometer jerks magnitude (g units, normalized and bounded within [-1,1])
	* 34 FrequencyBodyBodyGyroscopeMagnitude.MEAN..	--------- numeric calculated mean of experiment measurment - mean of frequency body gyroscope magnitude (radians/second units, normalized and bounded within [-1,1])
	* 35 FrequencyBodyBodyGyroscopeJerkMagnitude.MEAN.. ----- numeric calculated mean of experiment measurment - mean of frequency body gyroscope jerks magnitude (radians/second units, normalized and bounded within [-1,1])
	* 36 TimeBodyAccelometer.STD...X ------------------------ numeric calculated mean of experiment measurment - standard deviation of time body accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 37 TimeBodyAccelometer.STD...Y ------------------------ numeric calculated mean of experiment measurment - standard deviation of time body accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 38 TimeBodyAccelometer.STD...Z ------------------------ numeric calculated mean of experiment measurment - standard deviation of time body accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 39 TimeGravityAccelometer.STD...X --------------------- numeric calculated mean of experiment measurment - standard deviation of time gravity accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 40 TimeGravityAccelometer.STD...Y --------------------- numeric calculated mean of experiment measurment - standard deviation of time gravity accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 41 TimeGravityAccelometer.STD...Z --------------------- numeric calculated mean of experiment measurment - standard deviation of time gravity accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 42 TimeBodyAccelometerJerk.STD...X -------------------- numeric calculated mean of experiment measurment - standard deviation of time body accelometer jerks on axis (g units, normalized and bounded within [-1,1])
	* 43 TimeBodyAccelometerJerk.STD...Y -------------------- numeric calculated mean of experiment measurment - standard deviation of time body accelometer jerks on axis y (g units, normalized and bounded within [-1,1])
	* 44 TimeBodyAccelometerJerk.STD...Z -------------------- numeric calculated mean of experiment measurment - standard deviation of time body accelometer jerks on axis z (g units, normalized and bounded within [-1,1])
	* 45 TimeBodyGyroscope.STD...X -------------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope on axis x (radians/second units, normalized and bounded within [1,1])
	* 46 TimeBodyGyroscope.STD...Y -------------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope on axis y (radians/second units, normalized and bounded within [-1,1])
	* 47 TimeBodyGyroscope.STD...Z -------------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope on axis z (radians/second units, normalized and bounded within [-1,1])
	* 48 TimeBodyGyroscopeJerk.STD...X ---------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope jerks on axis x (radians/second units, normalized and bounded within [-1,1])
	* 49 TimeBodyGyroscopeJerk.STD...Y ---------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope jerks on axis y (radians/second units, normalized and bounded within [-1,1])
	* 50 TimeBodyGyroscopeJerk.STD...Z ---------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope jerks on axis z (radians/second units, normalized and bounded within [-1,1])
	* 51 TimeBodyAccelometerMagnitude.STD.. ----------------- numeric calculated mean of experiment measurment - standard deviation of time body accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 52 TimeGravityAccelometerMagnitude.STD.. -------------- numeric calculated mean of experiment measurment - standard deviation of time gravity accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 53 TimeBodyAccelometerJerkMagnitude.STD.. ------------- numeric calculated mean of experiment measurment - standard deviation of time body accelometer jerks magnitude (g units, normalized and bounded within [-1,1])
	* 54 TimeBodyGyroscopeMagnitude.STD.. ------------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope magnitude (radians/second units, normalized and bounded within [-1,1])
	* 55 TimeBodyGyroscopeJerkMagnitude.STD.. --------------- numeric calculated mean of experiment measurment - standard deviation of time body gyroscope jerks magnitude (radians/second units, normalized and bounded within [-1,1])	
	* 56 FrequencyBodyAccelometer.STD...X ------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer on axis x (g units, normalized and bounded within [-1,1])
	* 57 FrequencyBodyAccelometer.STD...Y ------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer on axis y (g units, normalized and bounded within [-1,1])
	* 58 FrequencyBodyAccelometer.STD...Z ------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer on axis z (g units, normalized and bounded within [-1,1])
	* 59 FrequencyBodyAccelometerJerk.STD...X --------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer jerks on axis x (g units, normalized and bounded within [-1,1])
	* 60 FrequencyBodyAccelometerJerk.STD...Y --------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer jerks on axis y (g units, normalized and bounded within [-1,1])
	* 61 FrequencyBodyAccelometerJerk.STD...Z --------------- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer jerks on axis z (g units, normalized and bounded within [-1,1])
	* 62 FrequencyBodyGyroscope.STD...X --------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body gyroscope on axis x (radians/second units, normalized and bounded within [-1,1])
	* 63 FrequencyBodyGyroscope.STD...Y --------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body gyroscope on axis y (radians/second units, normalized and bounded within [-1,1])
	* 64 FrequencyBodyGyroscope.STD...Z --------------------- numeric calculated mean of experiment measurment - standard deviation of frequency body gyroscope on axis z (radians/second units, normalized and bounded within [-1,1])
	* 65 FrequencyBodyAccelometerMagnitude.STD.. ------------ numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer magnitude (g units, normalized and bounded within [-1,1])
	* 66 FrequencyBodyBodyAccelometerJerkMagnitude.STD.. ---- numeric calculated mean of experiment measurment - standard deviation of frequency body accelometer jerks magnitude (g units, normalized and bounded within [-1,1])
	* 67 FrequencyBodyBodyGyroscopeMagnitude.STD.. ---------- numeric calculated mean of experiment measurment - standard deviation of frequency body gyroscope magnitude (radians/second units, normalized and bounded within [-1,1])
	* 68 FrequencyBodyBodyGyroscopeJerkMagnitude.STD.. ------ numeric calculated mean of experiment measurment - standard deviation of frequency body gyroscope magnitude(radians/second units, normalized and bounded within [-1,1])
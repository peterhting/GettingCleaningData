##Getting and cleaning data project
##
##This project contain the run_analysis.R script which
1. download and unzip a data archive if its not in the current directory from
+"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. replace feature names with legal column labels
3. read in the test and training files using the legal column labels 
4. replace numeric activity,y data, with activity names before merging with larger dataset
5. cbind the xdata with the activity names
6  merge the test and training files
7. extract the mean and standard deviation for each measurement
8. create a independent tidy data set with the average of each variable for each activity and each subject
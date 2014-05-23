##Getting and cleaning data project
##
##This project contain the run_analysis.R script which
1. download and unzip a data archive if its not in the current directory from
+"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. read in the test and training files
3. merge the test and training files
4. extract the mean and standard deviation for each measurement
5. replace numeric activity with activity names
6. replace feature names with legal colume labels
7. create a independent tidy data set with the average of each variable for each activity and each subject
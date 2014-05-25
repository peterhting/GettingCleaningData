##Getting and cleaning data project
##
##This project contain the run_analysis.R script which
1. download and unzip a data archive if its not in the current directory from
+"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
2. replace feature names with legal column labels
3. read in the test and training files using the legal column labels 
4. replace numeric activity, y data, with activity names before merging with the larger x dataset
5. cbind the subject, activity names with xdata 
6. merge the test and training files
7. select only the mean and standard deviation measurements
8. use the melt function from library(reshap2) to create a table
+of activity,subject,measurements...
9. use dcast to compute the mean for each activity and each subject
10. create a independent tidy dataframe
11. use the describe function from package Hmisc to create a Codebook.txt
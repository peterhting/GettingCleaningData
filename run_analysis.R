##run_analysis.R


##get the required libraries and packages
##install.packages("httr")  for https, reshape2 for melt
library(httr)
library(reshape2)

directory="UCI HAR Dataset"
dlfile="getdata_projectfiles_UCI HAR Dataset.zip"
subFileDir1="test"
subFileDir2="train"

if(!file.exists(directory)){
    message(paste("Directory "),directory,paste(" does not exist, download"))
    #download the data
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip?accessType=DOWNLOAD"
    download.file(fileUrl, destfile=dlfile, mode = 'wb')
    unzip(dlfile) 
    #convert to file name without spaces
    #file.rename("UCI HAR Dataset",directory)
}


##assume that if the top directory exists, the rest also exist
##i.e. ./test and ./train subdirectories
##     activity_labels.txt,features.txt,features_info.txt and README.txt

fileactlabelName=file.path(directory,"activity_labels.txt")
filefeatName=    file.path(directory,"features.txt")

fileXtestName= file.path(directory,"test","X_test.txt")
fileytestName= file.path(directory,"test","y_test.txt")
fileztestName= file.path(directory,"test","subject_test.txt")

fileXtrainName=file.path(directory,"train","X_train.txt")
fileytrainName=file.path(directory,"train","y_train.txt")
fileztrainName=file.path(directory,"train","subject_train.txt")

#read in activity labels, transform to legal column names
activityLabels = read.table(fileactlabelName,sep=" ",header=FALSE)
act<-gsub("_","",activityLabels[,2])
act<-tolower(act)

#read in feature names, transform to legal column names
features       = read.table(filefeatName,header=FALSE)
featureNames<-gsub("\\(|\\)|\\-","",features[,2])
featureNames<-tolower(featureNames)
#replace embeded comma with "uuu"
featureNames<-gsub(",","uuu",featureNames)

#read in the test and training tables,name the column with
#cleaned feature column names
#note:xyz here are data, activityid and subject
xtestDF= read.table(fileXtestName,col.names=featureNames)
ytestDF= read.table(fileytestName,col.names="activityid")
ztestDF= read.table(fileztestName,col.names="subject")

xtrainDF= read.table(fileXtrainName,col.names=featureNames)
ytrainDF= read.table(fileytrainName,col.names="activityid")
ztrainDF= read.table(filesubtrainName,col.names="subject")

#replace activity code with activity names
activityl<-act[ytrainDB[,1]]
#add subject and activity name column to the testDF
trainDF<-cbind(ztrainDF,activityl,xtrainDF)

#replace activity code with activity names
#note: column names must match hence reuse activityl
activityl<-act[ytestDF[,1]]
#add the subject and activity name column to the trainingDF
testDF<-cbind(ztestDF,activityl,xtestDF)

#merge the test and training data frame rows
mergeDF<-rbind(testDF,trainDF)

#select only the column names containing mean,Mean,std
selMeanStd<-grepl("[Mm]ean|std",featureNames)
#add subjext and activity columns
selMeanStd<-c(TRUE,TRUE,selMeanStd)
selDF<-mergeDF[,selMeanStd]

subjActDF<-melt(selDF,id=c("subject","activityl"))
##tidyDF<-summary(actSubjDF)
tidyDF<-dcast(subjActDF,subject+activityl ~variable,
              fun.aggregate=mean, na.rm=TRUE)

write.table(tidyDF,"tidyDF.txt")

#get the names of the tidyDF for the codebook
tnames<-names(tidyDF)
write.csv(tnames,"Codebook.txt")



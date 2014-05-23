##


##get the required libraries and packages
##install.packages("httr")  #http url stuff
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
filetestsubjName=    file.path(directory,"test","subject_test.txt")
fileXtestName=   file.path(directory,"test","X_test.txt")
fileytestName=   file.path(directory,"test","y_test.txt")
fileXtrainName=  file.path(directory,"train","X_train.txt")
fileytrainName=  file.path(directory,"train","y_train.txt")
filesubtrainName=file.path(directory,"train","subject_train.txt")

activityLabels = read.table(fileactlabelName)
features       = read.csv(filefeatName,colClasses="character")
#features       = read.csv(filefeatName)
subjectTest    = read.table(filetestsubjName)
subjectTrain   = read.table(filesubtrainName)

#xtestDB= read.table(fileXtestName)
#ytestDB= read.table(fileytestName)
xtrainDB= read.table(fileXtrainName)
ytrainDB= read.table(fileytrainName)
subtrainDB=read.table(fileSubtrainName)


#mergeDf = merge(gdpDf,eduDf,by.x="X",by.y="CountryCode")
#mergeDf = mergeDf[order(as.numeric(mergeDf$"Gross.domestic.product.2012"),decreasing=TRUE,na.last=NA),]


#tt<-melt(mergeDf,id=("Income.Group"),
#         measure.vars=("Gross.domestic.product.2012"),variable.name="GDP.Rank")

#quantile(as.numeric(mergeDf$"Gross.domestic.product.2012"),na.rm=TRUE)
#qt<-cut(as.numeric(tt$"GDP.Rank",na.rm=TRUE),breaks=c(0,20,40,60,80))
#ct<-tt[(tt$"Income.Group" == "Lower middle income"),]

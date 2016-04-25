#### This script is for the Coursera Getting and Cleaning Data Course Project.
#### It assumes that you have already download and unzipped the dataset
#### and have set your working directory to "UCI HAR Dataset".
library(dplyr)
##Read datasets in:

#general
features<-read.table("features.txt")
labels<-read.table("activity_labels.txt")

#test data
subjtest<-read.table("test/subject_test.txt")
xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/Y_test.txt")

#human readable variable name for test subjects ID; adds flags for partition
names(subjtest)<-"subjectid"
names(ytest)<-"activity"
subjtest$partition <- "test"

#hopefully renamed the variables in xtest correctly
names(xtest)<-features$V2

#combine test individuals and data set together
testsubjdata<-cbind(subjtest,ytest,xtest)

#train data
subjtrain <- read.table("train/subject_train.txt")
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")

#human readable variable name for train subjects ID; adds flags for partition
names(subjtrain) <- "subjectid"
names(ytrain)<-"activity"
subjtrain$partition<- "train"

#rename variables for xtrain correctly
names(xtrain)<-features$V2

#combine train individuals and dataset
trainsubjdata<-cbind(subjtrain,ytrain, xtrain)

#combines train and test datasets
combined_data<-rbind(trainsubjdata,testsubjdata)

#subsets combined dataset to only include mean and standard deviation variables
reqdata<-combined_data[,c(1,2,3,grep("mean",names(combined_data)),grep("std",names(combined_data)))]

#convert activity variable to factor and set to descriptive names
reqdata$activity<-as.factor(reqdata$activity)
levels(reqdata$activity) <- labels$V2

#prepare to generate final dataset by creating combined subject/activity level variable and stripping out individual
#partition, subject, and activity variables
predata<-reqdata
predata$subjectactivity <- paste(as.character(predata$subjectid),as.character(predata$activity))
predata$subjectid <-NULL
predata$activity <- NULL
predata$partition <- NULL

#prepare final data frame
final_output <- predata %>% group_by(subjectactivity) %>% summarize_each(funs(mean))
final_output$subjectactivity<-as.factor(final_output$subjectactivity)

#save data frame to file
write.csv(final_output,"getdata_project_output.csv")
#### Things left to do: re-split subject/activity; write codebook and readme
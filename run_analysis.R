# Creating a directory for the course project
if(!file.exists('./Getting and Cleaning Data Course Project')){
    dir.create('./Getting and Cleaning Data Course Project')
}

# Downloading of file and unzipping it
fileUrl='https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile = './Getting and Cleaning Data Course Project/datafile.zip')
unzip('./Getting and Cleaning Data Course Project/datafile.zip', exdir='./Getting and Cleaning Data Course Project')

# Reading of data
features=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/features.txt')
activity_labels=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/activity_labels.txt')

test_data=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/test/X_test.txt')
test_labels=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/test/y_test.txt')
test_subject=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/test/subject_test.txt')
test=cbind(test_subject,test_labels,test_data)

train_data=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/train/X_train.txt')
train_labels=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/train/y_train.txt')
train_subject=read.table('./Getting and Cleaning Data Course Project/UCI HAR Dataset/train/subject_train.txt')
train=cbind(train_subject,train_labels,train_data)

dataset=rbind(train,test)

# Formating dataset
features$V2=as.character(features$V2)
names(dataset)=c('subject','labels',features$V2)

dataset$labels=factor(dataset$labels,levels = 1:6, labels = activity_labels$V2)

# Setting chosen features
features_chosen=grep('.*mean.*|.*std.*',features$V2)
features_names=features[features_chosen,]
features_names$V2=as.character(features_names$V2)

# Extract only the measurements on the mean and standard deviation for each measurement
extract=dataset[,c('subject','labels',features_names$V2)]

# Create second, independent tidy data set with the average of each variable for each activity and each subject
library(reshape2)
tidydata=melt(extract,id=c('subject','labels'),measure.vars=features_names$V2)
tidydata=dcast(tidydata,subject + labels ~ variable,mean)

# writing into text file
write.table(tidydata,'./Getting and Cleaning Data Course Project/tidydata.txt',row.names = FALSE)

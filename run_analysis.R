# import library tidyvers
library(tidyverse)
# import data sets to R
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "./file1",method = "curl",mode = "wb")
# unzip data sets
unzip(zipfile = "./file1",exdir = "./file2")
# read the x_train data set
x_train <- read.table("./file2/UCI HAR Dataset/train/X_train.txt",header = FALSE,sep = "")
# read y_train data set
y_train <- read.table("./file2/UCI HAR Dataset/train/y_train.txt",header = FALSE,sep = "")
# read subject_train data set
subject_train <- read.table("./file2/UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep = "")
# merge all data set relate to train and asign in to finaltrain
finaltrain <- cbind(subject_train,y_train,x_train)
# read y_test data set
y_test <- read.table("./file2/UCI HAR Dataset/test/y_test.txt",header = FALSE,sep = "")
# read x_test data set
X_test <- read.table("./file2/UCI HAR Dataset/test/X_test.txt",header = FALSE,sep = "")
# read subject_test data set
subject_test <- read.table("./file2/UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "")
# merge all data set relate to test and asign in to finaltest
finaltest <- cbind(subject_test,y_test,X_test)
# merge finaltest and finaltrain 
mergeData <- rbind(finaltest,finaltrain)
# read features.txt
features <- read.table("./file2/UCI HAR Dataset/features.txt",header = FALSE,sep = "")
# names merge data column from 3:563 by features values
names(mergeData)[3:563] <- features[,2]
# names the second column in mergedata to avoid error in select later(am not sure ^_^)
names(mergeData)[2] <- "V2"
# select the first two column and any column contain(mean() or std())
measurements <- select(mergeData,c(1:2,contains('mean()')|contains('std()')))
# read activity_labels
activity_labels <- read.table("./file2/UCI HAR Dataset/activity_labels.txt",header = FALSE,sep = "")
# use activity_lables second column to replace the value in measurements second column
measurements$V2 <- as.factor(sapply(measurements$V2,function(x) activity_labels$V2[x]))
# replace any underscore in column names by ""
colnames(measurements) <- gsub("-","",x = colnames(measurements))
# replace any "tBody" in column names by "timebody."
colnames(measurements) <- sub("tBody","timebody.",x = colnames(measurements))
# replace any "fBody" in column names by "freqbody"
colnames(measurements) <- sub("fBody","freqbody.",x = colnames(measurements))
# replace any "tGravity" in column names by "timegravity."
colnames(measurements) <- sub("tGravity","timegravity.",x = colnames(measurements))
# replace any "Acc" in column names by "acc."
colnames(measurements) <- sub("Acc","acc.",x = colnames(measurements))
# replace any "Gyro" in column names by "gyro."
colnames(measurements) <- sub("Gyro","gyro.",x = colnames(measurements))
# replace any "Mag" in column names by "mag."
colnames(measurements) <- sub("Mag","mag.",x = colnames(measurements))
# replace any "Jerk" in column names by "jerk."
colnames(measurements) <- sub("Jerk","jerk.",x = colnames(measurements))
# replace any "X"in column names by "x"
colnames(measurements) <- sub("X","x",x = colnames(measurements))
# replace any "Y" in column names by "y"
colnames(measurements) <- sub("Y","y",x = colnames(measurements))
# replace any "Z" in column names by "z"
colnames(measurements) <- sub("Z","z",x = colnames(measurements))
# replace any "Body" in column names by "body"
colnames(measurements) <- sub("Body","body",x = colnames(measurements))
# rename first two column by "subject" and "activitylabels" respectivly
colnames(measurements)[1:2] <- c("subject","activitylabels")
# make independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- measurements%>% group_by(subject,activitylabels) %>% summarise_each(funs = mean)


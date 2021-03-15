# Getting-and-cleaning-data-project

---
title: "REDAME.MD"
author: "Abdalbasit Abdalkarim Mohamed"
date: "3/15/2021"
---
        
============================================================
        Human Activity Recognition Using Smartphones Dataset
        Version 1.0
============================================================
        here i explain all step i do from import data to print tidy cleaning data

*first i load library i will use(tidyverse), then download the data set in r by download.file()
and unzib it

*read all the data relate to trainig set and merge them


*read all the data relate to test set and merge them


*merge the data from finaltrin and finaltest


*now we need to assign column name to dataframe,that help us to use select later for choseing variable as we want
note : the variable name in the second column in features.txt file ,so we read the filr in r
and then assign second column as name to column from 3:563
Tip: first two column assign to subject and activity labels respectively



* names the second column in mergedata to avoid error in select later



*select the column that measure mean or standard deviation for signals
for all subject and activity



*the activity lables in data frame is now set as number ,in second column in activity_lables.txt.
now we need to replace the number level by character values in activity table
Tip: the activity first column refer to activity levels


*the variable name look un understandable now,but we can use colnames and dplyr function sub,gsub
to make the name more cleraly.
-first we should avoid any special character like ("_",",",etc..) so we remove any "_" from column names,
-second we replace any chapital leatter with small letter,
-third we used "." to distinguish between major quantity in signal
-forth we replace ("t","f") with ("time","freq") to refer to time and frequency domain
-lastly we rename the first two column by ("subject","activitylables") respectively


*make independent tidy data set with the average of each variable for each activity and each subject.
Tip : we have 30 subject and 6 activity so we should print out just 180 observations


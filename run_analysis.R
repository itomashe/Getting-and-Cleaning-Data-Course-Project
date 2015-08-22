## 1. Merges the training and the test sets to create one data set.

##Source data files:
require(plyr)
xtrain<-"train\\X_train.txt"             ## 'train/X_train.txt': Training set.
ytrain<-"train\\y_train.txt"             ##  'train/y_train.txt': Training labels.
xtest<-"test\\X_test.txt"                ##'test/X_test.txt': Test set.
ytest<-"test\\y_test.txt"                ##'test/y_test.txt': Test labels.
subtrain<-"train\\subject_train.txt"     ##'train/subject_train.txt': Each row identifies 
subtest<-"test\\subject_test.txt"        ## the subject who performed the activity for each window sample. Its range is from 1 to 30. 
                                         ##'test/subject_test.txt': The description is equivalent to 
                                         ## the train file. 
flist<-"features.txt"                    ##'features.txt': List of all features.
alabels<-"activity_labels.txt"           ##'activity_labels.txt': Links the class labels with their activity name.
features<-read.table(flist)  
activities<-read.table(alabels)          ##'activity_labels.txt': Links the class labels with their activity name.


xset<-rbind(read.table(xtrain),read.table(xtest))
yset<-rbind(read.table(ytrain),read.table(ytest))
subjectset<-rbind(read.table(subtrain),read.table(subtest) )


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.


mstd<-grep("-(mean|std)",features[,2])
xset<-xset[,mstd]

## 3. Uses descriptive activity names to name the activities in the data set

names(xset)<-features[mstd,2]

## 4. Appropriately labels the data set with descriptive variable names. 

names(xset)<-paste("Average of",names(xset),sep=" ")
yset[,1]<-activities[yset[,1],2]
names(yset)<-"Activity"
names(subjectset)<-"Subject"

one_data<-cbind(xset,yset,subjectset)

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each
##variable for each activity and each subject.

avgvar<-ddply(one_data,.(Subject,Activity),function(x) colMeans(x[,1:66]))

## data set as a txt file created with write.table() using row.name=FALSE

write.table(avgvar,"tidy_data.txt",row.name=FALSE)


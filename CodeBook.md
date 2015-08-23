Data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Files were unzipped into working directory.
####The dataset includes the following files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

#### Script description
- Run_analysis.R reads the files into datafames and first merges the training and the test sets.
- Test and Train data merged together into corresponding datasets:xset,yset,subjectset
- Subset of xset is created containing only the measurements on the mean and standard deviation for each measurement
- Descriptive activity names are taken from features file to name the activities in the data set
- Names in xset are changed to better describe the variables and one data set is created.
- The final data set is made with the average of each variable for each activity and each subject.
- Final data set is written to a file.

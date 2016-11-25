#Getting and Cleaning Data Course Project

##Code Book

This is a code book that describes the variables, the data, and any transformations or work that are performed to clean up the data.

Datasets and variables used in this project are:

features: dataframe with 'V1' as the numbering and 'V2' as the list that contains all the features 

activity_labels: dataframe with 'V1' as number 1 to 6 and 'V2' as the corresponding activity descriptions

features_names: dataframe with 'V1' as numbering and 'V2' as the list of features that contains the mean and standard deviation for each measurement. 

test_data: dataframe containing test data; each column of train_data and test_data is the data for each feature in the features dataframe. 

test_labels: dataframe with 'V1' as numbering and 'V2' as the corresponding labels of activities in test_data

test_subject: dataframe with 'V1' as numbering and 'V2' as the corresponding subjects for the data in test_data

test: dataframe that combined test_subject as the subject column,test_labels as the labels column, and test_data of 561 variables as the data

train_data: dataframe containing train data; each column of train_data and test_data is the data for each feature in the features dataframe. 

train_labels: dataframe with 'V1' as numbering and 'V2' as the corresponding labels of activities in train_data

train_subject: dataframe with 'V1' as numbering and 'V2' as the corresponding subjects for the data in train_data

train: dataframe that combined train_subject as the subject column,train_labels as the labels column, and train_data of 561 variables as the data

dataset: test and train datasets are merged together and form the original dataset for transformations

extract: Dataframe that extracted the measurements on the mean and standard deviation for each measurement

tidydata: Dataframe that contains the average of each variable for each activity and each subject from the extract dataset

Data are first downloaded, then read in as individual variables of dataframes.
Test and train sets are then combined to create one data set with descriptive activity names to name the activities in the data set, and labels the data set with descriptive variable names. 
Activity were labelled as numbers 1 to 6 in the dataset, and is then transformed to descriptive variables names. Each column of train_data and test_data is the data for each feature in the features dataframe, and is then labelled using the activity_labels dataframe. After which, only the measurements on the mean and standard deviation for each measurement is extracted as a new dataframe named 'extract'. Features_names is created with the list of features that are to be extracted and used as for extracting data from the 'dataset' with features inside this variable.
Using 'extract', a second, independent tidy data set with the average of each variable for each activity and each subject is created named 'tidydata'. The result is then saved as a text file in the repo.

The result of tidydata is also saved as a text file in this repo as tidydata.txt

Features Variables:
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 


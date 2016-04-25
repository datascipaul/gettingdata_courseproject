This is the codebook for "getdata_project_output.csv", produced for the Coursera Getting and Cleaning Data Course Project.

Original Data:
The data were retrived from the UCI Machine Learning Repository Human Activity Recognition Using Smartphones Data Set.  
The data are 3-axial linear acceleration and 3-axial angular velocity data captured by smartphones worn on a group of 30 volunteers performing six different activities (Walking, Walking up stairs, walking down stairs, sitting, standing, and laying), with some processing applied by the researchers.  The dataset was randomly partitioned into two sets, 70% "training" and 30% "test".  These partitions were stored in separate files, as were the subject ids, variable names, activity keys, and other information.

Details on the dataset generation and individual variables can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.  
The files can be downloaded at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Processing:

The test and training data were combined with reference information providing subject ids, activities, activity names, and variable names to form a single data frame for all observations, in which each row was one observation by subject id, and each column was one variable

Aside from variables which described the observation condition (subject id, activity, and partition (test or train)), any variable that did not include the string "mean" or "std" was removed from the data frame.  A new variable, "subjectactivity", was created to capture activity by each individual subject, and the original descriptive variables (subject id, activity, and partition) were removed from the data frame.  For each subject/activity combination, the mean of each variable was calculated, forming the processed data.

Processed Data:
Columnns are variables.  The first column, subjectactivity, is a factor vector with a number followed by a plain english activity, with levels indicating the subject ID and the activity performed in the given row.  The remaining columns are numeric vectors which contain the average value of each variable for that subject/activity pair (calculated as described in data processing).

Data Source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 

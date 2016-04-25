This is my submission for the Coursera Getting and Cleaning Data Course Project.  The submission includes 4 files:

1. This README

2. The codebook (Codebook.md)

3. The rscript which generates the final data, titled "run_analysis.R"

4. The output dataset, titled "getdata_project_output.txt", located at   gettingdata_courseproject/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/getdata_project_output.txt 

The script is written to work on the data provided in the assignment.  It requires the following:

1. The user has downloaded the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. The user has unzipped the data

3. The user has set their working directory to the "UCI HAR Dataset" folder within the ZIP folder

4. The user has installed the dplyr package

When run, the script will pull data from the test and train folders, restructure and combine them, remove all variables except for the basic identifiers (subjectid, activity, and partition) that do not include the phrase "mean" or "std", and then create a new data frame which calculates the means of the mean and std variables at the subjectid/activity level.  It saves this data frame to a .txt file in the working directory.

In the resulting data frame, each column is a variable, and each row an obersvation.  I interpreted the instruction "average of each variable for each activity and each subject" to be asking for the mean of each variable for each subject/activity pair, which is why column one aggregatates subject and activity - for that question, that level of detailed appeared to be the correct unit of measure.

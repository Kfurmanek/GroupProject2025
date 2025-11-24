# GroupProject2025

Project Overview

This project processes the Human Activity Recognition Using Smartphones dataset.
The goal is to clean the raw data using STD and Mean from the TRAINING SET and TEST SET,
merge the data and create a tidy dataset.



Files Included in This Repository

GroupWork.R

README.md

CodeBook.md

tidy_dataset.txt



The script used: GroupWork.R
Final output: tidy_dataset.txt



To Download the Dataset:

Download the dataset ZIP file from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the folder: UCI HAR Dataset



To set working directory:

Modify the path to your own computer: setwd("C:/Your/Path/Here")


What each step of the script accomplishes:

Step 1: Loads all necessary packages to complete assignment
Step 2: Sets your working directory and reads in dataset "UCI HAR Dataset"
Step 3: Loads metadata (activities and features)
Step 4: Extracts mean and Standard Deviation features
Step 5: Loads and processes training data
Step 6: Loads and processes test data
Step 7: Combines training and test data (merge)
Step 8: Adds descriptive activity names
Step 9: Creates the tidy dataset with averages
Step 10: Saves completed dataset


To Verify Your Output

Run:

dim(tidy_data)             
table(tidy_data$subject)   
table(tidy_data$activity)  
summary(tidy_data[, 1:5])



Reflection Questions

Why merge training and test data?
  The training and test datasets were originally separated for machine learning 
  model building, not for data cleaning. We merge them to extract all relevant
  data and to create a tidy dataset that can later be used to analysis
  
How many observations per subject?
  To find number of observations per subject, run table(data_combined$subject). 
  The top number is the number of subjects, and the bottom number is the amount 
  observations.
  1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22  23 
347 302 341 317 302 325 308 281 288 294 316 320 327 323 328 366 368 364 360 354 408 321 372 
 24  25  26  27  28  29  30 
381 409 392 376 382 344 383   
  
Why select mean and std features?
  Mean and STD are the two most useful values in statisics. Not only do they help
  narrow down the data into a potion the is more useful, but they provide a clear
  picture of what the data means and how to use it.
  
What makes data “tidy”?
  A dataset is tidy when each variable is in its own column, each observation is
  in its own row, and each type of observational unit forms its own table.
  Simply put, it happens when you take thousands/millions of rows of numbers and
  orginize it so it is useable.
  
What does one row of tidy_data represent?
  A single subject performing a single activity, with the average of each mean/STD
  measurement for that subject-activity pair.

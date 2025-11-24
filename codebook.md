Data and Variables


Data Source and Description:

Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
This project uses data from the Human Activity Recognition Using Smartphones 
study conducted by Jorge L. Reyes-Ortiz et al. The dataset contains sensor signals
recorded from the accelerometer and gyroscope of a Samsung Galaxy S smartphone 
worn on the waist of 30 subjects performing six activities: walking, walking_upstairs,
walking_downstairs, sitting, standing, and laying. The original dataset contains
561 features. The tidy dataset extracts only mean and std measurements and 
calculates the average value of each feature for each subject–activity combination.


Variables of the Dataset:

Subject: A number identifying the person/subject being studied

Activity: One of the six actions a subject is tested for (walking, walking_upstairs,
walking_downstairs, sitting, standing, and laying.)

Features: measurable variables where we derive the mean() and std() from


Transformations Preformed:

Merging: The script takes in subject_train, y_train, X_train, subject_test, y_test,
and X_test and combines them using cbind() (merge subject, activity, and measurements)
and rbind() (stack training and test datasets).

Filtering: The script locates the desiried feature names (mean/std) and uses them
to continue the tidying process so that the data is not only smaller, but more 
understandable and usable.

Averaging: The script groups the data by subject and activity, then calculates the
mean of every selected feature, producing a tidy dataset. 


Units of Measurement:

Mean: The means (all numbers added together and then devided by the count of numbers
to show the average) of all activites per subject are recorded to analyze

Standard Deviation: The standard deviations (measure of how spread out or dispersed
the values in a dataset are around the mean.) of all activites per subject are 
recorded to analyze.

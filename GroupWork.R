### Step 1 ###
setwd("C:/Users/Kathr/OneDrive/Desktop/DAT511/group_proj")
library(dplyr)
install.packages("tidyr")
library(dplyr)
install.packages("tidyr")
library(tidyr)
install.packages("readr")
library(readr)

### Step 2 ###
setwd("C:/Users/Kathr/OneDrive/Desktop/DAT511/group_proj")
data_path <- "UCI HAR Dataset"

### Step 3 ###
activity_labels <- read.table(file.path(data_path, "activity_labels.txt"),
                              col.names = c("activity_id", "activity"))

features <- read.table(file.path(data_path, "features.txt"),
                       col.names = c("index", "feature_name"))

dim(features)
head(features, 10)
View(features)

### Step 4 ###
mean_std_features <- grep("-(mean|std)\\(\\)", features$feature_name)
selected_features <- features$feature_name[mean_std_features]

length(mean_std_features)
head(selected_features, 10)

### Step 5 ###
X_train <- read.table(file.path(data_path, "train", "X_train.txt"))[, mean_std_features]
colnames(X_train) <- selected_features

y_train <- read.table(file.path(data_path, "train", "y_train.txt"),
                      col.names = "activity_id")

subject_train <- read.table(file.path(data_path, "train", "subject_train.txt"),
                            col.names = "subject")
dim(subject_train)
length(unique(subject_train$subject))
table(subject_train$subject)

### Step 6 ###
X_test <- read.table(file.path(data_path, "test", "X_test.txt"))[, mean_std_features]
colnames(X_test) <- selected_features

y_test <- read.table(file.path(data_path, "test", "y_test.txt"),
                     col.names = "activity_id")

subject_test <- read.table(file.path(data_path, "test", "subject_test.txt"),
                           col.names = "subject")
dim(X_test)
dim(y_test)
dim(subject_test)
length(unique(subject_test$subject))

### Step 7 ###
data_train <- cbind(subject_train, y_train, X_train)
data_test <- cbind(subject_test, y_test, X_test)
data_combined <- rbind(data_train, data_test)

dim(data_combined)
colnames(data_combined)
summary(data_combined[, 1:3])

### Step 8 ###
data_combined <- merge(data_combined, activity_labels,
                       by = "activity_id", all.x = TRUE)
data_combined$activity_id <- NULL

colnames(data_combined)
table(data_combined$activity)
unique(data_combined$activity)

### Step 9 ###
tidy_data <- data_combined %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

dim(tidy_data)
head(tidy_data)
View(tidy_data)
nrow(unique(tidy_data[, c("subject", "activity")]))

### Step 10 ###
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)

test_data <- read.table("tidy_dataset.txt", header = TRUE)
dim(test_data)
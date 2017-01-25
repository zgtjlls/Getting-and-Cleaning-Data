## Step 0 set working directory and import librart
library(stringr)
library(dplyr)
setwd("/Users/linshanli/Documents/Coursera/Data Science/Getting and Cleaning Data/Project")

## Step 1 reading and merge data
## reading
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(X_train)
dim(X_test)

## merge
data_merged <- rbind(X_train, X_test)
dim(data_merged)

## Step2 extract only mean and std
## Import labels
label_all <- read.table("./UCI HAR Dataset/features.txt")
head(label_all)
names(label_all) <- c("index", "feature")

## extract only the mean and std
label_mean <- grep("mean()", label_all[["feature"]])
label_std <- grep("std()", label_all[["feature"]])
data_mean_std <- data_merged[c(label_mean,label_std)]

## Step3 name the activities
## reading the label, y, file and the label table
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)
names(y) <- "y"

## merge the label with the data
data_mean_std_y <- cbind(data_mean_std,y)

## read the activity label table
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_label) <- c("index", "name")

## merge the label with the data
data_with_act <- merge(data_mean_std_y, activity_label, by.x = "y", by.y = "index")

## Step 4 name the columns
## extract the column names from the feature table
names <- as.character(label_all[["feature"]][c(label_mean,label_std)])
class(names)

## use those names as the column name
names(data_with_act) <- c("y",names,"activity")

## Step 5 taking the average by activities
data_average <- group_by(data_with_act, activity)
data_final <- summarize_all(data_average, mean)
data_final <- select(data_final,-y) ##drop the column y
## export the final tidy data frame
write.table(data_final, "tidy_data.txt", row.names = FALSE)

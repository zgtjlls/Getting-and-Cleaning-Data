## Step 0 set working directory and import librart
library(stringr)
library(dplyr)
setwd("/Users/linshanli/Documents/Coursera/Data Science/Getting and Cleaning Data/Project")

## Step 1 reading and merge data

# X
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X <- rbind(X_train, X_test)

# y
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y <- rbind(y_train, y_test)
names(y) <- "y"

# subject
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(subject_train, subject_test)
names(subject)<-"subject"

## Step2 extract only mean and std
## Import labels
features <- read.table("./UCI HAR Dataset/features.txt")
names(features) <- c("index", "feature")

## label X columns
names(X) <- features$feature
head(X)

## extract only the mean and std
feature_mean_std <- grep("(mean|std)\\(\\)", features[["feature"]])
data_mean_std <- X[c(label_mean,label_std)]
data_mean_std <- cbind(data_mean_std, y, subject)


## Step3 name the activities
## read the activity label table
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activity_label) <- c("index", "activity")

## merge the label with the data
data_mean_std <- merge(data_mean_std, activity_label, by.x = "y", by.y = "index")

## Step 4 name the columns
## columns already named with the raw features names given, but let's do more cleaning
## replace the short name with the full name
# 't' -> time
# 'f' -> frequency
# 'Acc' -> Accelerometer
# 'Gyro' -> Gyroscope
# 'Mag' -> Magnitude
names(data_mean_std) <- gsub("^t", "time", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "frequency", names(data_mean_std))
names(data_mean_std) <- gsub("^Acc", "Accelerometer", names(data_mean_std))
names(data_mean_std) <- gsub("^Gyro", "Gyroscope", names(data_mean_std))
names(data_mean_std) <- gsub("^Mag", "Magnitude", names(data_mean_std))
names(data_mean_std)

## Step 5 taking the average by activities and subject
data_average <- group_by_(data_mean_std, .dots=c("activity", "subject"))
data_final <- summarize_all(data_average, mean)

## some small cleaning
data_final <- select(data_final,-y) ##drop the column y
data_final <- data_final[order(data_final$activity, data_final$subject),] ## sort by activity first then subject


## export the final tidy data frame
write.table(data_final, "tidy_data.txt", row.names = FALSE)
View(data_final)
dim(data_final)
temp <- data.frame(names(data_final))
View(temp)
temp

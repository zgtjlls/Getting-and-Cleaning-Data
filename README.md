# Getting-and-Cleaning-Data
### run_analysis.R Description
The run_analysis.R has 5 steps following the guidance.  
Step 1. Reading and merge data: read 'X_train.txt' and 'X_test.txt' and use rbind to merge the two. DataFrame 'data_merged' is the output from this step.  
Step 2. Extract columns: import the 'features.txt' which contains the column headers for the data. Using grep extract the column nummbers for columns contain 'mean()' and 'std()'. Extract these columns from 'data_merged'. DataFrame 'data_mean_std' is the output from this step.  
Step 3. Label the activities: import y_train and y_test and bind it with the data 'data_mean_std'. Then, import 'activity_labels.txt', which is a table describes the numerical factor with descriptive name. Then, use the 'merge' function on the data and the activity_label to match the names and add the names as another column in the data. DataFrane 'data_with_act' is the output from this step.  
Step 4. Label the columns: extract the relevant columns from the feature tabel. Rename the 'data_with_act' DataFrame with those names.  
Step 5. Take the averages by activities: first use the 'group_by' function to group the data by activities. Then use the 'summarize_all' to take the mean of all columns other than the activity column. Finally, some minor cleaning such as drop the 'y' column.   
Finally, the 'tidy_data.txt' is the final output.  
    
     
### tidy_data.txt code book
The final data has 6 rows and 80 columns.   
The 6 rows are the 6 activities: 'LAYING', 'SITTING', 'STANDING', 'WALKING', 'WALKING_DOWNSTAIRS', 'WALKING_UPSTAIRS', in this order.
For the 80 columns, the first column called the 'activiy' contains the activity names. Then, the rest 79 columns contain the average for the grouped by these activites for 79 variables. More details below:
Column Number          Column Name 
2                tBodyAcc-mean()-X        
3                tBodyAcc-mean()-Y
4                tBodyAcc-mean()-Z
5             tGravityAcc-mean()-X
6             tGravityAcc-mean()-Y
7             tGravityAcc-mean()-Z
8            tBodyAccJerk-mean()-X
9            tBodyAccJerk-mean()-Y
10           tBodyAccJerk-mean()-Z
11              tBodyGyro-mean()-X
12              tBodyGyro-mean()-Y
13              tBodyGyro-mean()-Z
14          tBodyGyroJerk-mean()-X
15          tBodyGyroJerk-mean()-Y
16          tBodyGyroJerk-mean()-Z
17              tBodyAccMag-mean()
18           tGravityAccMag-mean()
19          tBodyAccJerkMag-mean()
20             tBodyGyroMag-mean()
21         tBodyGyroJerkMag-mean()
22               fBodyAcc-mean()-X
23               fBodyAcc-mean()-Y
24               fBodyAcc-mean()-Z
25           fBodyAcc-meanFreq()-X
26           fBodyAcc-meanFreq()-Y
27           fBodyAcc-meanFreq()-Z
28           fBodyAccJerk-mean()-X
29           fBodyAccJerk-mean()-Y
30           fBodyAccJerk-mean()-Z
31       fBodyAccJerk-meanFreq()-X
32       fBodyAccJerk-meanFreq()-Y
33       fBodyAccJerk-meanFreq()-Z
34              fBodyGyro-mean()-X
35              fBodyGyro-mean()-Y
36              fBodyGyro-mean()-Z
37          fBodyGyro-meanFreq()-X
38          fBodyGyro-meanFreq()-Y
39          fBodyGyro-meanFreq()-Z
40              fBodyAccMag-mean()
41          fBodyAccMag-meanFreq()
42      fBodyBodyAccJerkMag-mean()
43  fBodyBodyAccJerkMag-meanFreq()
44         fBodyBodyGyroMag-mean()
45     fBodyBodyGyroMag-meanFreq()
46     fBodyBodyGyroJerkMag-mean()
47 fBodyBodyGyroJerkMag-meanFreq()
48                tBodyAcc-std()-X
49                tBodyAcc-std()-Y
50                tBodyAcc-std()-Z
51             tGravityAcc-std()-X
52             tGravityAcc-std()-Y
53             tGravityAcc-std()-Z
54            tBodyAccJerk-std()-X
55            tBodyAccJerk-std()-Y
56            tBodyAccJerk-std()-Z
57               tBodyGyro-std()-X
58               tBodyGyro-std()-Y
59               tBodyGyro-std()-Z
60           tBodyGyroJerk-std()-X
61           tBodyGyroJerk-std()-Y
62           tBodyGyroJerk-std()-Z
63               tBodyAccMag-std()
64            tGravityAccMag-std()
65           tBodyAccJerkMag-std()
66              tBodyGyroMag-std()
67          tBodyGyroJerkMag-std()
68                fBodyAcc-std()-X
69                fBodyAcc-std()-Y
70                fBodyAcc-std()-Z
71            fBodyAccJerk-std()-X
72            fBodyAccJerk-std()-Y
73            fBodyAccJerk-std()-Z
74               fBodyGyro-std()-X
75               fBodyGyro-std()-Y
76               fBodyGyro-std()-Z
77               fBodyAccMag-std()
78       fBodyBodyAccJerkMag-std()
79          fBodyBodyGyroMag-std()
80      fBodyBodyGyroJerkMag-std()

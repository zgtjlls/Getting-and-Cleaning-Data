# Getting-and-Cleaning-Data
This depository has 3 important files:   
This README.md.  
run_analysis.R contains the code.  
CodeBook.md describes the output file.

### run_analysis.R Description
The run_analysis.R has 5 steps following the guidance.  
Step 1. Reading and merge data: read 'X_train.txt' and 'X_test.txt' and use rbind to merge the two. DataFrame 'data_merged' is the output from this step.  
Step 2. Extract columns: import the 'features.txt' which contains the column headers for the data. Using grep extract the column nummbers for columns contain 'mean()' and 'std()'. Extract these columns from 'data_merged'. DataFrame 'data_mean_std' is the output from this step.  
Step 3. Label the activities: import y_train and y_test and bind it with the data 'data_mean_std'. Then, import 'activity_labels.txt', which is a table describes the numerical factor with descriptive name. Then, use the 'merge' function on the data and the activity_label to match the names and add the names as another column in the data. DataFrane 'data_with_act' is the output from this step.  
Step 4. Label the columns: extract the relevant columns from the feature tabel. Rename the 'data_with_act' DataFrame with those names.  
Step 5. Take the averages by activities: first use the 'group_by' function to group the data by activities. Then use the 'summarize_all' to take the mean of all columns other than the activity column. Finally, some minor cleaning such as drop the 'y' column.   
Finally, the 'tidy_data.txt' is the final output.  
    
    

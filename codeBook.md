## Getting and Cleaning Data
### Course Project Code Book
This code book is intended to provide information about the study design used, the summary choices made, the **run_analysis.R** script and the variables in the data set.

### Study design

The Samsung data set used for this project contains a README file that explains in detail how the data is organized.

The main measurements come in files '*train/X_train.txt*' and '*test/X_test.txt*'. The variable names come in a separated file called '*features.txt*'. So, the first thing to do is to assign the proper name to each variable.

Once each variable has its name, it is possible to remove those variables which are not relevant for us and just keep the mean and standard deviation, as requested in the project description.

On the other hand, the activity performed for each measurement come in a separate file for training and test data: '*train/Y_train.txt*' and '*test/Y_test.txt*'. Furthermore, these activities have no descriptive names, they are given as numbers from 1 to 6. The translation is given in file '*activity_labels.txt*'.

So, the next step is to assign a descriptive name to each activity and include this field as a new column in the dataset.

The subject who performed each measurement is given in separated files: '*train/subject_train.txt*' and '*test/subject_test.txt*'. They should be added as well as a new column to the dataset.

Finally, both training and test data sets can be merged.

#### Code Book

The **run_analysis.R** script is in charge of the following:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Script input, output and used variables are described in the following sections.

##### Input

The original Samsung dataset attached in the project description is used as input. It should be available in the working directory (unzipped) in a folder called '_UCI HAR Dataset_'.

##### Output

The output will be a text file called '*avg_clean_data.txt*', which contains a tidy data set with the average of each variable for each activity and each subject. For further information regarding the file format, please refer to '*codeBook.md*' document.

##### Variables

The following variables are used for storing the raw data:

- **activities** - Contains the different class labels and their corresponding activity names.
- **features** - Stores information about the variables used on the feature vector.
- **x_test** - Test data set.
- **y_test** - Test activity labels.
- **subject_test** - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- **x_train** - Training set
- **y_train** - Training activity labels
- **subject_train** - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Also, the following intermediate variables have been used:

- **clean_test** - Used for storing temporal information coming from the test data set
- **clean_train** - Used for storing temporal information coming from the training data set

Finally, the output is stored in:

- **clean_data** - Tidy dataset containing both test and training data. It contains mean and standard deviation for each measurement, descriptive activity names and variable names.
- **avg_clean_data** - Tidy data set coming from *clean_data*. It contains the average of each variable for each activity and each subject. 

### Tidy Data Set Variables

The output file contains the following variables:

1. subject: Subject who performed the activity (from 1 to 30).
2. activity: Performed activity (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS)
3. tBodyAccMeanX: Measurement in time domain.
4. tBodyAccMeanY: Measurement in time domain.
5. tBodyAccMeanZ: Measurement in time domain.
6. tBodyAccStdX: Measurement in time domain.
7. tBodyAccStdY: Measurement in time domain.
8. tBodyAccStdZ: Measurement in time domain.
9. tGravityAccMeanX: Measurement in time domain.
10. tGravityAccMeanY: Measurement in time domain.
11. tGravityAccMeanZ: Measurement in time domain.
12. tGravityAccStdX: Measurement in time domain.
13. tGravityAccStdY: Measurement in time domain.
14. tGravityAccStdZ: Measurement in time domain.
15. tBodyAccJerkMeanX: Measurement in time domain.
16. tBodyAccJerkMeanY: Measurement in time domain.
17. tBodyAccJerkMeanZ: Measurement in time domain.
18. tBodyAccJerkStdX: Measurement in time domain.
19. tBodyAccJerkStdY: Measurement in time domain.
20. tBodyAccJerkStdZ: Measurement in time domain.
21. tBodyGyroMeanX: Measurement in time domain.
22. tBodyGyroMeanY: Measurement in time domain.
23. tBodyGyroMeanZ: Measurement in time domain.
24. tBodyGyroStdX: Measurement in time domain.
25. tBodyGyroStdY: Measurement in time domain.
26. tBodyGyroStdZ: Measurement in time domain.
27. tBodyGyroJerkMeanX: Measurement in time domain.
28. tBodyGyroJerkMeanY: Measurement in time domain.
29. tBodyGyroJerkMeanZ: Measurement in time domain.
30. tBodyGyroJerkStdX: Measurement in time domain.
31. tBodyGyroJerkStdY: Measurement in time domain.
32. tBodyGyroJerkStdZ: Measurement in time domain.
33. tBodyAccMagMean: Measurement in time domain.
34. tBodyAccMagStd: Measurement in time domain.
35. tGravityAccMagMean: Measurement in time domain.
36. tGravityAccMagStd: Measurement in time domain.
37. tBodyAccJerkMagMean: Measurement in time domain.
38. tBodyAccJerkMagStd: Measurement in time domain.
39. tBodyGyroMagMean: Measurement in time domain.
40. tBodyGyroMagStd: Measurement in time domain.
41. tBodyGyroJerkMagMean: Measurement in time domain.
42. tBodyGyroJerkMagStd: Measurement in time domain.
43. fBodyAccMeanX: Measurement in frequency domain.
44. fBodyAccMeanY: Measurement in frequency domain.
45. fBodyAccMeanZ: Measurement in frequency domain.
46. fBodyAccStdX: Measurement in frequency domain.
47. fBodyAccStdY: Measurement in frequency domain.
48. fBodyAccStdZ: Measurement in frequency domain.
49. fBodyAccJerkMeanX: Measurement in frequency domain.
50. fBodyAccJerkMeanY: Measurement in frequency domain.
51. fBodyAccJerkMeanZ: Measurement in frequency domain.
52. fBodyAccJerkStdX: Measurement in frequency domain.
53. fBodyAccJerkStdY: Measurement in frequency domain.
54. fBodyAccJerkStdZ: Measurement in frequency domain.
55. fBodyGyroMeanX: Measurement in frequency domain.
56. fBodyGyroMeanY: Measurement in frequency domain.
57. fBodyGyroMeanZ: Measurement in frequency domain.
58. fBodyGyroStdX: Measurement in frequency domain.
59. fBodyGyroStdY: Measurement in frequency domain.
60. fBodyGyroStdZ: Measurement in frequency domain.
61. fBodyAccMagMean: Measurement in frequency domain.
62. fBodyAccMagStd: Measurement in frequency domain.
63. fBodyBodyAccJerkMagMean: Measurement in frequency domain.
64. fBodyBodyAccJerkMagStd: Measurement in frequency domain.
65. fBodyBodyGyroMagMean: Measurement in frequency domain.
66. fBodyBodyGyroMagStd: Measurement in frequency domain.
67. fBodyBodyGyroJerkMagMean: Measurement in frequency domain.
68. fBodyBodyGyroJerkMagStd: Measurement in frequency domain.

Please, refer to '*features_info.txt*' file in the original dataset for further information about each measurement.
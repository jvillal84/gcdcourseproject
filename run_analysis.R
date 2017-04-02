library(dplyr)

## Load raw data (Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test <-  read.table("./UCI HAR Dataset/test/subject_test.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train <-  read.table("./UCI HAR Dataset/train/subject_train.txt")

## Set column names of test and train sets according to features file
names(x_test) <- features[,2]
names(x_train) <- features[,2]

## Keep just columns containing mean() or std()
clean_test <- x_test[,grepl("mean\\(\\)|std\\(\\)",names(x_test))]
clean_train <- x_train[,grepl("mean\\(\\)|std\\(\\)",names(x_train))]

## Assign to each activity a descriptive name for both train and test sets
## according to activity_labels.txt file
y_test <- data.frame(sapply(y_test, function(x) activities[x,2]))
y_train <- data.frame(sapply(y_train, function(x) activities[x,2]))

## Include the activities in the clean sets
names(y_test) <- "activity"
clean_test <- cbind(y_test,clean_test)
names(y_train) <- "activity"
clean_train <- cbind(y_train,clean_train)

## Include the subjects in the clean sets
names(subject_test) <- "subject"
clean_test <- cbind(subject_test,clean_test)
names(subject_train) <- "subject"
clean_train <- cbind(subject_train,clean_train)

## Merge both training and test data sets
clean_data <- rbind(clean_train,clean_test) %>% mutate(subject = as.factor(subject))

## Clean the column names
names(clean_data) <- gsub("mean\\(\\)","Mean",names(clean_data))
names(clean_data) <- gsub("std\\(\\)","Std",names(clean_data))
names(clean_data) <- gsub("-","",names(clean_data))

## Create a second, independent tidy data set with the average of each variable
## for each activity and each subject.
avg_clean_data <- clean_data %>% group_by(subject,activity) %>% summarise_each(funs(mean))
write.table(avg_clean_data, "avg_clean_data.txt", row.name=FALSE)

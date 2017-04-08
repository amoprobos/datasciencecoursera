#!/usr/bin/env Rscript

# Read feature names and activity labels
feature.names <- read.table("UCI HAR Dataset/features.txt",
                            col.names=c("FeatureNumber", "FeatureName"))
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt",
                              col.names=c("ActivityNumber", "ActivityName"))


# Read training data
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt",
                             col.names=c("SubjectID"))
train.features <- read.table("UCI HAR Dataset/train/X_train.txt",
                             col.names=feature.names$FeatureName)
train.labels <- read.table("UCI HAR Dataset/train/y_train.txt",
                           col.names=c("ActivityNumber"))
train.dframe <- cbind(train.subjects, train.features, train.labels)


# Read test data
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt",
                            col.names=c("SubjectID"))
test.features <- read.table("UCI HAR Dataset/test/X_test.txt",
                            col.names=feature.names$FeatureName)
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt",
                          col.names=c("ActivityNumber"))
test.dframe <- cbind(test.subjects, test.features, test.labels)


# Merge training/test data
merged.dframe <- rbind(train.dframe, test.dframe)


# Extract features including mean / standard deviation
mean.std.feature.list <- c(grep("\\.mean\\.", colnames(merged.dframe), value=T),
                           grep("\\.std\\.", colnames(merged.dframe), value=T))
mean.std.dframe <- merged.dframe[, c("SubjectID", "ActivityNumber", mean.std.feature.list)]


# Join activity label numbers to names
joined.dframe <- merge(activity.labels, mean.std.dframe, by="ActivityNumber")


# Relabel variables in dataset, replacing dots with underscores (and removing trailing)
feature.colnames <- gsub("\\.+", "_", colnames(joined.dframe))
feature.colnames <- gsub("(.*)_+$", "\\1", feature.colnames)
colnames(joined.dframe) <- feature.colnames


# Aggregate results for each subject and activity
# Drop the first three columns in the input frame before aggregating
aggregated.data <- aggregate(joined.dframe[, c(-1, -2, -3)],
                             list(Activity=joined.dframe$ActivityName,
                                  Subject=joined.dframe$SubjectID),
                             FUN=mean)

# Output aggregated dataset
write.table(aggregated.data, file="aggregated_data.txt", row.names=F, quote=F)

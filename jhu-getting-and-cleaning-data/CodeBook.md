
# Introduction

This codebook document explains the dataset developed during the course project for the
Getting and Cleaning Data course.

This dataset contains aggregations from the existing Human Activity Recognition Using
Smartphones Dataset (for further details, see the original dataset at the
[UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).


# Inputs

The dataset uses the following files from the original HAR dataset:

* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `train/X_train.txt`: Training set.
* `train/y_train.txt`: Training labels.

* `train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `test/X_test.txt`: Test set.
* `test/y_test.txt`: Test labels.


# Outputs

The processed dataset consists of a single output data file:

* `aggregated_data.txt`: Each row corresponds to a combination of an experimental subject and activity, and indicates the mean of all sensor measurements for this combination.

Each row of the processed dataset contains the following columns:

* Activity: The descriptive name for the activity.
* Subject: The subject ID performing the activity.
* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyAccMag_mean
* tGravityAccMag_mean
* tBodyAccJerkMag_mean
* tBodyGyroMag_mean
* tBodyGyroJerkMag_mean
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyAccMag_mean
* fBodyBodyAccJerkMag_mean
* fBodyBodyGyroMag_mean
* fBodyBodyGyroJerkMag_mean
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* tBodyAccMag_std
* tGravityAccMag_std
* tBodyAccJerkMag_std
* tBodyGyroMag_std
* tBodyGyroJerkMag_std
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyAccMag_std
* fBodyBodyAccJerkMag_std
* fBodyBodyGyroMag_std
* fBodyBodyGyroJerkMag_std

These variables correspond to the per-category means of the features from the original HAR
dataset, with _mean and _std suffixes to indicating the variables calculated from
the raw metrics, the descriptions of which are duplicated below for convenience:

    The features selected for this database come from the accelerometer and gyroscope
    3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    These time domain signals (prefix 't' to denote time) were captured at a constant
    rate of 50 Hz.
    Then they were filtered using a median filter and a 3rd order low pass Butterworth
    filter with a corner frequency of 20 Hz to remove noise.
    Similarly, the acceleration signal was then separated into body and gravity
    acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass
    Butterworth filter with a corner frequency of 0.3 Hz.

    Subsequently, the body linear acceleration and angular velocity were derived in time
    to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
    Also the magnitude of these three-dimensional signals were calculated using the Euclidean
    norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

    Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
    fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag,
    fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

    These signals were used to estimate variables of the feature vector for each pattern:
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    tBodyAcc-XYZ
    tGravityAcc-XYZ
    tBodyAccJerk-XYZ
    tBodyGyro-XYZ
    tBodyGyroJerk-XYZ
    tBodyAccMag
    tGravityAccMag
    tBodyAccJerkMag
    tBodyGyroMag
    tBodyGyroJerkMag
    fBodyAcc-XYZ
    fBodyAccJerk-XYZ
    fBodyGyro-XYZ
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

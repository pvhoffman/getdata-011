## Introduction
The purpose of this document is to describe the dataset producted from executing the [run_analysis.R](run_analysis.R) script on the data obtained from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Executing the [run_analysis.R](run_analysis.R) script will produce 3 new datasets: X_tidy.txt, y_tidy.txt, and subject_tidy.txt in the current working directory.

### X_tidy.txt
Observational data obtained from smartphones on subjects performing various activites, matching activity rows exist in y_tidy.txt and matching subject rows exist in subject_tidy.txt.
Fields beginning with 't' are measurments defined in the time domain.
Fields beginning with 'f' are measurments defined in the frequency domain.
All fields are measurements on the mean and standard deviation of the observational measurment.
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
All measurements are floating point.
+  tBodyAccMean-XYZ 
+  tBodyAccStd-XYZ
+  tGravityAccMean-XYZ 
+  tGravityAccStd-XYZ
+  tBodyAccJerkMean-XYZ
+  tBodyAccJerkStd-XYZ
+  tBodyGyroMean-XYZ
+  tBodyGyroStd-XYZ
+  tBodyGyroJerkMean-XYZ
+  tBodyGyroJerkStd-XYZ
+  tBodyAccMagMean
+  tBodyAccMagStd
+  tGravityAccMagMean
+  tGravityAccMagStd
+  tBodyAccJerkMagMean
+  tBodyAccJerkMagStd
+  tBodyGyroMagMean
+  tBodyGyroMagStd
+  tBodyGyroJerkMagMean
+  tBodyGyroJerkMagStd
+  fBodyAccMean-XYZ
+  fBodyAccStd-XYZ
+  fBodyAccJerkMean-XYZ
+  fBodyAccJerkStd-XYZ
+  fBodyGyroMean-XYZ
+  fBodyGyroStd-XYZ
+  fBodyAccMagMean
+  fBodyAccMagStd
+  fBodyBodyAccJerkMagMean
+  fBodyBodyAccJerkMagStd
+  fBodyBodyGyroMagMean
+  fBodyBodyGyroMagStd
+  fBodyBodyGyroJerkMagMean
+  fBodyBodyGyroJerkMagStd
 
### y_tidy.txt
Rows containing the activity being performed by the subject from matching rows in X_tidy.txt
+  Activity.Name - Factor field, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. 

### subject_tidy.txt
Rows containing the subject identifier matching the rows of the activity, in y_tidy.txt, measured from matching rows in X_tidy.txt.
+  Subject.ID - Integer field identifying the subject, 1 - 30, performing the activity, matching the corresponding row in y_tidy.txt, and measurement in the corresponding row in X_tidy.txt.




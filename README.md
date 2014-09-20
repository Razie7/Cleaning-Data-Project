Cleaning-Data-Project
=====================

This code is an answer to the coursera Project Questions :
1. Merges the training and the test sets to create one data set. 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set 
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.



The scripit works in directory where it contains the giving files and directories in the project:

activity_labels.txt
features.txt
test/
train/

The output is created in working directory with the name of xxxx.txt

Code BreakDown:

Objective 1:
Read ( X-train and X_test) then merge them togather.
Do the same for Y values and Subject.

Objective 2 
read Feature from feature.txt
fetch only features that have mean() or STD() including MeanFreq as the question was not specific.
lable the marged (X) dataframe from objective 1 by the fetched feature names.

Objetive 3
read the activity lables from Activiy_labels.txt
replace the number with the extracted text.

Objective 4
Lable the columns by apporpriate names (Subject, Activity)
merged the three table sets togather(Subject,Activity,Features) into new dataframe (clean_Data)

Objective 5
for multiple values of the same subject and activity calculate one average value.
sort the result by Subject number then by Activity to make the result tidier.
#######
Trimimg and making the data tidier
####
assign short abbrivaition for the feature columns ( more details in the CodeBook)
replace the activity capital letter names with smaller ones.

write the findal tidy data in txt file (tidy.txt)

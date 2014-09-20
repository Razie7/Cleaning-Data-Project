##1. Merges the training and the test sets to create one data Set

Xtest<-read.table("./test/X_test.txt",stringsAsFactors=F)
	Xtrain<-read.table("./train/X_train.txt",stringsAsFactors=F)
	Xmerged<-rbind(Xtrain,Xtest)

Ytrain<-read.table("./train/Y_train.txt",stringsAsFactors=F)
        Ytest<-read.table("./test/Y_test.txt",stringsAsFactors=F)
        Ymerged<-rbind(Ytrain,Ytest)

temp1 <- read.table("train/subject_train.txt")
temp2 <- read.table("test/subject_test.txt")
Smerged <- rbind(temp1, temp2)

##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Features<- read.table("features.txt")
extracted_features <- grepl("mean|std",features) ## I included anything includes STD or Mean since
                                                 #the question was not specific.
                            Xmerged<-Xmerged[extracted_features]
                            names(Xmerged)<- extracted_features
                            
## 3.	Uses descriptive activity names to name the activites in the data set
                            
                            activities<-read.table("activity_labels.txt",stringsAsFactors=F)
                            Ymerged[,1]<-activities[Ymerged[,1],2]
                            ## substitute the activities for the numbers in the data set.
                            
                            
## 4. Appropriately labels the data set with descriptive activity names
                            names(Ymerged)= "Activity"
                            names(Smerged)= "Subject"
                            cleandata<-cbind(Smerged,Ymerged,Xmerged)
                            
##5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
                            aggr.data <- aggregate(cleandata[, 3:42],by=list(Subject = cleandata$Subject, 
                            Activity = cleandata$Activity), mean) # Extracting Series-time signals details in Codebook
                            aggr.data<-aggr.data[order(aggr.data$Subject,aggr.data$Activity),]
                            
                            
                            names(aggr.data)<-gsub("\\(|\\)", "",names(aggr.data))  # remove ()s from the column names
                            
                            
                            
                            ##Trimming the DATA
                            
                            > names(aggr.data)<-gsub("tBodyAcc-std-","TBA-S-",names(aggr.data))
                            > names(aggr.data)<-gsub("tGravityAcc-M-","TGA-M-",names(aggr.data))
                            > names(aggr.data)<-gsub("tGravityAcc-S","TGA-S",names(aggr.data)
                            > names(aggr.data)<-gsub("tGravityAcc-std","TGA-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccJerk-M","TBAJ-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccJerk-std","TBAJ-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyro-M","TBGJ-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyro-std","TBGJ-S",names(aggr.data))
                            > names(aggr.data)<-gsub("TBGJ-M","TBG-M",names(aggr.data))
                            > names(aggr.data)<-gsub("TBGJ-S","TBG-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroJerk-M","TBGJ-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroJerk-std","TBGJ-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccMag-M","TBAM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccMag-std","TBAM-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tGravityAccMag-M","TGAM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tGravityAccMag-std","TGAM-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccJerkMag-M","TBAJM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyAccJerkMag-std","TBAJM-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroMag-M","TBGM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroMag-std","TBGM-S",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroJerkMag-M","TBGM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("TBGM","TBGJM-M",names(aggr.data))
                            > names(aggr.data)<-gsub("tBodyGyroJerkMag-std","TBGJM-S",names(aggr.data))
                            
                            ##  convert activities words to smaller letters
                            > aggr.data$Activity<-gsub("WALKING_UPSTAIRS","Walking_U",aggr.data$Activity)
                            > View(aggr.data)
                            > aggr.data$Activity<-gsub("WALKING_DOWNSTAIRS","Walking_D",aggr.data$Activity)
                            > aggr.data$Activity<-gsub("LAYING","Laying",aggr.data$Activity)
                            > aggr.data$Activity<-gsub("SITTING","Sitting",aggr.data$Activity)
                            > aggr.data$Activity<-gsub("STANDING","Standing",aggr.data$Activity)
                            > aggr.data$Activity<-gsub("WALKING","Walking",aggr.data$Activity
                            
                     write.table(aggr.data, "tidy.txt",row.names=F,sep = "       ")                                              
                                                      

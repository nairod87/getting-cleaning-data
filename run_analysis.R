zip_file <- "getdata_projectfiles_UCI HAR Dataset.zip"                  #path to the zip file

testX <- read.table(unz(zip_file,"UCI HAR Dataset/test/X_test.txt"))    #load test set
testy <- read.table(unz(zip_file,"UCI HAR Dataset/test/y_test.txt"))    #load test labels
testsubject <- read.table(unz(zip_file,"UCI HAR Dataset/test/subject_test.txt"))    #load test subject ID
trainX <- read.table(unz(zip_file,"UCI HAR Dataset/train/X_train.txt")) #load training set
trainy <- read.table(unz(zip_file,"UCI HAR Dataset/train/y_train.txt")) #load training labels
trainsubject <- read.table(unz(zip_file,"UCI HAR Dataset/train/subject_train.txt"))    #load train subject ID
features <- read.table(unz(zip_file,"UCI HAR Dataset/features.txt"))    #load features
activityLabel <- read.table(unz(zip_file,"UCI HAR Dataset/activity_labels.txt")) #load explicit activity labels

meanstdfeat <- sapply(features[,2],function(t){grepl("mean",t)||grepl("std",t)}) #logical - select only mean and std

mergeX <- rbind(testX,trainX,check.names=TRUE)      # merge training and test set
mergey <- rbind(testy,trainy,check.names=TRUE)      # merge training and test labels
mergesubject <- rbind(testsubject,trainsubject,check.names=TRUE)      # merge subject ID

mxms <- mergeX[,meanstdfeat]                      #select only mean and std features
colnames(mxms) <- features$V2[meanstdfeat]        #set col names
lam <- split(mxms,mergey)                         #split by activity
mvalue <- as.data.frame(lapply(lam,function(x){sapply(x,mean)})) #meanvalue of each feature for activity
colnames(mvalue) <- activityLabel$V2

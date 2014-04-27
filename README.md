getting-cleaning-data
=====================

The code that loads the zip file in the working directory is in comment. You can uncomment this part of the code if you want to load the data (only needed once - can be necessary to add the method param)

Once all processing are done the tidy data are save in the data.txt file

For all the signification of the data please refer to the original readme file in the zip file.

data.txt is a summary of the original data, the following transformation have been done :
* merging the training and test data
* selecting the features with mean or std in the col names
* creating subset for each activity and subject
* averaging each feature in each subset

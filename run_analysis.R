run_analysis <- {
	
  ## load file contains column names
  colLabel <- read.csv("./data1/UCIHARDataset/column_labels.csv")
  newColLabel <- read.csv("./data1/UCIHARDataset/column_label_transform.csv")
  
  ## load training data sets; these data files do not have column names, thus set header=false
	trainData <- read.table("./data1/UCIHARDataset/train/X_train.txt", header=FALSE)
  trainActivity <- read.table("./data1/UCIHARDataset/train/y_train.txt", header=FALSE)
  trainSubject <- read.table("./data1/UCIHARDataset/train/subject_train.txt", header=FALSE)
  
  ## load test data sets; these data files do not have column names, thus set header=false
  testData <- read.table("./data1/UCIHARDataset/test/X_test.txt", header=FALSE)
  testActivity <- read.table("./data1/UCIHARDataset/test/y_test.txt", header=FALSE)
  testSubject <- read.table("./data1/UCIHARDataset/test/subject_test.txt", header=FALSE)
  
  ## assign column name to data sets
  colnames(trainData) <- colLabel[,]
  colnames(trainActivity) <- c("Activity")
  colnames(trainSubject) <- c("Subject")
  
  colnames(testData) <- colLabel[,]
  colnames(testActivity) <- c("Activity")
  colnames(testSubject) <- c("Subject")

  ## assign activities with names from activity_labels.txt
  trainActivity[trainActivity=="1"] <- "WALKING"
  trainActivity[trainActivity=="2"] <- "WALKING_UPSTAIRS"
  trainActivity[trainActivity=="3"] <- "WALKING_DOWNSTAIRS"
  trainActivity[trainActivity=="4"] <- "SITTING"
  trainActivity[trainActivity=="5"] <- "STANDING"
  trainActivity[trainActivity=="6"] <- "LAYING"
  
  testActivity[testActivity=="1"] <- "WALKING"
  testActivity[testActivity=="2"] <- "WALKING_UPSTAIRS"
  testActivity[testActivity=="3"] <- "WALKING_DOWNSTAIRS"
  testActivity[testActivity=="4"] <- "SITTING"
  testActivity[testActivity=="5"] <- "STANDING"
  testActivity[testActivity=="6"] <- "LAYING"
  
  ## merge Subject and Activity data to Training data sets
  newTrain1<- cbind(trainActivity, trainData)
  newTrain2 <- cbind(trainSubject, newTrain1)
  
  ## merge Subject and Activity data to Test data sets
  newTest1<- cbind(testActivity, testData)
  newTest2 <- cbind(testSubject, newTest1)
  
  ## merge Training and Test data sets
  newDS <- rbind(newTrain2, newTest2)

  ## select only measurements with name contains mean() or std()
  subDS <- newDS[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)]
  
  ## assign this subset with transformed column names
  colnames(subDS) <- newColLabel[,]
  
  ## to get tidy data
  MyTidyData <- subDS %>% group_by(SubjectID, Activity) %>% summarise_each(funs(mean))
  
  ## generate output file for tidy data (for grade submission)
  write.table(MyTidyData, file="./data1/TidyData.txt", row.names=FALSE)

	
}
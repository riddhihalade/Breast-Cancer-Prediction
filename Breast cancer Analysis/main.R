#import data
cancerData <- read.csv("C:/Users/riddh/Desktop/Projects/Breast cancer Analysis/dataset/data.csv", stringsAsFactors = FALSE)

 #display structure of data
str(cancerData)

#label dataset
names(cancerData) <- c("id", "clumpThickness","uniformityOfCellSize","uniformityOfCellShape",
                       "marginalAdhesion","singleEpithelialCellSize","bareNuclei","normalNuclei"
                       "mitoses","class")
str(cancerData)

#Data Preparation
cancerData$id <- NULL

#converting data into numeric format
cancerData$bareNuclei <- as.numeric(cancerData$bareNuclei)

#Identify rows without missing data
cancerData <- cancerData[complete.cases(cancerData),]

#display structure of dataset
str(cancerData)


#tranform in classes of 2 and 4 into benign and malignant,
cancerData$class <- factor(ifelse(cancerData $ class == 2, "benign", "malignant"))


#build the model
#data slicing

trainingSet <- cancerData[1:477, 1:9]
testSet <- cancerData[478:682, 1:9]

#split diagnosis into testing and training outcome sets
trainingOutcomes <- cancerData[1:477, 10]
testOutcomes <- cancerData[478:682, 10]


#apply KNN algorithms to trainig and testing Outcomes
library(class)
predictions <- knn(train - trainingSet, cl = trainingOutcomes, k=2, test = testSet)

#display predictions
predictions

#model evalution
table(testOutcomes,predictions)

#finding accuracy
actuals_pred <- data.frame(cbind(actuals = testOutcomes, predicted = predictions))
correlational_accuracy = cor(actuals_pred)
head(actuals_pred)

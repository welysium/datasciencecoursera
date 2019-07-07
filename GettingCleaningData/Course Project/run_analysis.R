## Getting and Cleaning Data Course Project
## ewilso49@jhu.edu
##

## Importing relevant packages (use install.packages() for any missing)
library(plyr)
library(dplyr)
library(tidyr)
library(data.table)

# Setting Directory to relevant folder (please personalize to your drive)
bigdir <- c("C:/Users/Elyse Wilson/Documents/RFiles/RStudio/datasciencecoursera/datasciencecoursera/GettingCleaningData/Week4")
setwd(bigdir)
# Shortened file path for cleaner code below
datafolder <- file.path(bigdir, "UCIHARDataset")


# Reading Activities and Features files
activities <- read.table(file.path(datafolder, "activity_labels.txt"))
colnames(activities) <- c("ActivityID", "Description")

features <- read.table(file.path(datafolder, "features.txt"))
colnames(features) <- c("FeatureID", "Description")


## Reading Test and Train folder files
## read.table into separate variables (and labeling with colnames), then combining into one data frame using cbind
subtrain <- read.table(file.path(datafolder, "train", "subject_train.txt"))
colnames(subtrain) <- c("SubjectID")
valtrain <- read.table(file.path(datafolder, "train", "X_train.txt"))
colnames(valtrain) <- c(features$Description)
acttrain <- read.table(file.path(datafolder, "train", "y_train.txt"))
colnames(acttrain) <- c("ActivityID")

traindata <- cbind(subtrain, valtrain, acttrain)

subtest <-read.table(file.path(datafolder, "test", "subject_test.txt"))
colnames(subtest) <- c("SubjectID")
valtest <-read.table(file.path(datafolder, "test", "X_test.txt"))
names(valtest) <- c(features$Description)
acttest <-read.table(file.path(datafolder, "test", "y_test.txt"))
colnames(acttest) <- c("ActivityID")

testdata <- cbind(subtest, valtest, acttest)

## Combining Test and Train data into one variable (data frame) using rbind; labelling columns 
testandtrain <- rbind(testdata, traindata)
colnames(testandtrain) <- c("SubjectID", features$Description, "ActivityID")


## Starting statistical analysis/tidying data by performing mean and standard deviation on the data set. First filters the Features by relevant mean and standard deviation values and inserts it into the "Data Statistics" data frame
featuresstats <- filter(features, grepl("(mean|std)", features$Description,ignore.case = T))
meanstd <- c("SubjectID", "ActivityID", featuresstats$Description)

datastatistics <- testandtrain[, meanstd]

datastatistics <- inner_join(datastatistics, activities, by = "ActivityID")
datastatistics <- select(datastatistics, SubjectID, Description, 3:89)

finaldata <- datastatistics %>% group_by(Description, SubjectID) %>% summarise_all(list(mean))

write.table(finaldata, file = "finaldataset.txt", sep = "\t", rownames = FALSE)

fread("finaldataset.txt")


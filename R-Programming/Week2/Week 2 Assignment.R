##Week 2 Assignment
## Data can be found at: https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332){
      setwd("C:/Users/Elyse Wilson/Documents/RFiles/RStudio/R-Programming/Week2")
      getwd() #checks current directory
      setwd(directory) #opens "specdata" (or chosen) directory
      getwd() ##confirms that directory is correct
      DA <- rep(0, length(id)) #vector with # of cells to data sampled
      lengths <- rep(0, length(id))
      for(i in 1:length(id)){
            file_name <- sprintf("%03d.csv", id[i]) #properly names files based on id
            table <- read.csv(file_name)
            lengths[i] <- sum(!is.na(table[[pollutant]]))
            DA[i] <- if(lengths[i] == 0L){
                  0
            } else {
                  sum(data.frame(tabrle[[pollutant]][!is.na(table[[pollutant]])]))  
            }
            #finds the length of non-NA rows
            #DA[i]<- sum(data.frame(table[[pollutant]][!is.na(table[[pollutant]])]))
            #finds the sum of values=
      }
      result <- sum(DA)/sum(lengths) #manual average
      result
}

complete <- function(directory = "specdata", id = 1:332){
      setwd("C:/Users/Elyse Wilson/Documents/RFiles/RStudio/R-Programming/Week2")
      getwd() #checks current directory
      setwd(directory) #opens "specdata" (or chosen) directory
      getwd() ##confirms that directory is correct
      nobs <- rep(0, length(id)) #vector with # of cells to data sampled
      for(i in 1:length(id)){
            file_name <- sprintf("%03d.csv", id[i]) #properly names files based on id
            table <- read.csv(file_name)
            #finds the length of non-NA rows
            nobs[i] <- dim(na.omit(table))[1]
            #determines number of complete rows
      }
      result <- cbind(id, nobs)
      result <- as.data.frame(result)
      result
}


#What I want to do is take every file in specified directory, check for "threshold of data
#(defined by input #), and use complete() to check for that threshold. THEN on all
# values that meet threshold, use cor() to find relationship b/w sulf and nit
pollutantcor <- function(directory = "specdata", pollutant1 = "sulfate", pollutant2 = "nitrate", id = 1:332){
      setwd("C:/Users/Elyse Wilson/Documents/RFiles/RStudio/R-Programming/Week2")
      getwd() #checks current directory
      setwd(directory) #opens "specdata" (or chosen) directory
      getwd() ##confirms that directory is correct
      corrtable <- rep(0, length(id)) #vector with # of cells to data sampled
      for(i in 1:length(id)){
            file_name <- sprintf("%03d.csv", id[i]) #properly names files based on id
            table <- read.csv(file_name)
            table <- na.omit(table)
            table <- as.data.frame(table)
            corrtable[i] <- cor(table[[pollutant1]], table[[pollutant2]])
      }
      result <- corrtable
      result
}

corr <- function(directory = "specdata", threshold = 0){
      setwd("C:/Users/Elyse Wilson/Documents/RFiles/RStudio/R-Programming/Week2")
      getwd() #checks current directory
      setwd(directory) #opens "specdata" (or chosen) directory
      getwd() ##confirms that directory is correct
      threshmatch <- complete(directory)
      threshfin <- subset(threshmatch, threshmatch$nobs > threshold)
      id <- threshfin$id
      correlations <- pollutantcor(directory, "sulfate", "nitrate", id)
      
}
## Times in R
## as.POSIXlt or as.POSIXct
## lt is a list which stores day of week/year, month, and day of month
## ct is very large integer, which is more useful in data frame (less data)
## Dates are stores with as.Date
## generic functions: weekdays, months, quarters

## Dates vs. Times
##Dates  are stores as number of days since (date)
##Times are stored as number of seconds since (date)

x <- as.Date("1970-01-01")
unclass(x)
## will say 0 bc it has not changed
unclass(as.Date("1970-01-02"))
## will say 1 bc has moved forward a day

x <- Sys.time()
x ## will return current sys time

p <- as.POSIXlt(x)
names(unclass(p)) ##will show all options for p -- seconds, mins, hours, etc
p$sec #will show the system seconds


## strptime will correct the formatting of your dates if they are not in YYYY-MM-DD format
datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x
## use ?strptime to get the formatting strings (%B = full written month, %d = day, etc)




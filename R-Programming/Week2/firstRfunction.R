## First function
add2 <- function(x, y) {
      x + y
}
## fin

above10 <- function(x) {
      use <- x > 10
      x[use]
}

above <- function(x, n = 10) {
      use <- x > n
      x[use]
}

columnmean <- function(x, removeNA = TRUE) {
      ##removes NA
      nc <- ncol(x)
      means <- numeric(nc) ##empty vector, all 0's
      for (i in 1:nc) {
            ##for loop with cycles that = length of nc
            means[i] <- mean(x[, i], na.rm = removeNA)
      }
      means ##return
} ## you can use columnmean(x,FALSE) to keep the NAs

# Elyse Wilson
#Week 3: Programming Assignment 2
#R-Programming

# matrix %*% matrix will multiply them properly -- if the result is the identity matrix, then solve() has been used correctly
# solve() will find the inverse of a matrix

# mat <- c(4,2,7,6)
# dim(mat) <- c(2,2)
# mat
# invmat <- solve(mat)
# invmat
# identity <- mat %*% invmat
# identity


makeVector <- function(x = makenumeric()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmean <- function(mean) m <<- mean
      getmean <- function() m
      list(set = set, get = get,
           setmean = setmean,
           getmean = getmean)
}

cachemean <- function(x, ...) {
      m <- x$getmean()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- mean(data, ...)
      x$setmean(m)
      m
}


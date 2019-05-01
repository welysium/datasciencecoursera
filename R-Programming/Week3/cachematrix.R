## Elyse Wilson
## Week 3: Programming Assignment 2
## R-Programming

## This script contains a pair of functions that cache the inverse of a matrix


## This function creates a special "matrix" object which caches its inverse

makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(y) {
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setmat <- function(solve) m <<- solve
      getmat <- function() m
      list(set = set, get = get,
           setmat = setmat,
           getmat = getmat)
}


## This function computes the inverse of the apecial "matrix" from the previous
## function. If the inverse has already been calculated, it is received from the
## cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getmat()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setmat(m)
      m
}

## This can be tested using the following code.
mat <- c(4,2,7,6) ## creates numeric vector
dim(mat) <- c(2,2) ## xforms to matrix
mat ## display
invmat <- solve(mat) ## solves
invmat ## display; proves our function works because it matches
identity <- mat %*% invmat ## matrix multiplication
identity ## displays identity matrix to confirm inverse
cacheSolve(makeCacheMatrix(mat)) ## see for yourself!
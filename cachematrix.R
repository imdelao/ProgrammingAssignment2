## Put comments here that give an overall description of what your
## functions do:
## The functions allow us to caluclate the inverse of any given
## matrix and allows us to store the inverse calculations for later
## use.  
##
## Write a short comment describing this function.
## This function is the one that calls and stores a given matrix and 
## the inverse fucntion--solve(). It also creates a list that allows
## the second function to access functions by name.
makeCacheMatrix <- function(x = matrix()) {
              m <- NULL
            set <- function (y) {
                    x <<- y
                    m <<- NULL
            }
            get <- function () x
            setinv <- function(solve) m <<- solve
            getinv <- function() m
            list(set = set, get = get, 
                 setinv = setinv,
                 getinv = getinv)
}

## Write a short comment describing this function.
## This function utilized the information from makeCacheMatrix function 
## to calculate the inverse of the matrix if it hasn't been calculated
## before. If the inverse has been calculated before and you call on the
## function, then you will get the inverse of the matrix with a message 
## that states "getting cached data."
cacheSolve <- function(x, ...) {
         m <- x$getinv()
         if(!is.null(m)) {
                message("getting cached data")
                return(m)
         }
      data <- x$get()
         m <- solve(data, ...)
         x$setinv(m)
         m
}
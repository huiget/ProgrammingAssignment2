# Essentially, the following functions can create a matrix and calculate its inverse using cache.

## Write a short comment describing this function
# This function returns a list containing functions that can read and set the values.
makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL
    set <- function(y)
    {
        x <<- y
        inverse <<- NULL 
    }
    get <- function()   x
    setInverse <- function(Inv) inverse <<- Inv
    getInverse <- function() inverse
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


# This function takes an object created by makeCacheMatrix and returns the matrix's inverse, calculating it only if it hasn't been calculated yet.
cacheSolve <- function(x, ...) {
    inverse <- x$getInverse()
    if (!is.null(inverse))
    {
        message("getting cached data")
        return(inverse)
    }
    inverse <- solve(x$get())
    x$setInverse(inverse)
    inverse
}

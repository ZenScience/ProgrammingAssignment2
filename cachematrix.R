## Matrix inversion library

## Creates a special matrix object that can cache its inverse
## Parameters:
##  x : invertible matrix
makeCacheMatrix <- function(x = matrix()) {
    ## Inverse initialized to NULL
    ## Inverse is computed the first time cacheSolve is called
    inv <- NULL
    ## Set the invertible matrix, inverse initialized to NULL
    ## Setting the inverse to NULL avoids cache values out of date on matrix updates
    set <- function(y) {
      x <<- y
      inv <<- NULL
    }
    ## Get the invertible matrix
    get <- function() x
    ## Set the inverse matrix, called from cacheSolved if it has
    ## not been initialized before
    setinverse <- function(inverse) inv <<- inverse
    ## Gets the inverse matrix, called from cacheSolved
    getinverse <- function() inv
    ## Returns all the functions to handle a matrix and its inverse
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Computes the inverse of a matrix returned by makeCacheMatrix
## If the inverse has been previously calculated, retrieves the matrix from its cache
cacheSolve <- function(x, ...) {
  ## Gets the inverse from makeCacheMatrix
  cache <- x$getinverse()
  ## Checks if the inverse has been calculated. If it is not NULL, returns the cached value
  if(!is.null(cache)) {
    message("getting cached data")
    return(cache)
  }
  ## The inverse has not been calculated. Retrieve the matrix
  data <- x$get()
  ## Calculate the inverse
  inv <- solve(data, ...)
  ## Set the inverse in makeCacheMatrix
  x$setinverse(inv)
  ## Return the inverse
  m
}

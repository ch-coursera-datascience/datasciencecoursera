## The function makeCacheMatrix creates a special matrix object that can also cache
# its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The function cacheSolve computes the inverse of the matrix from makeCacheMatrix. 
# It will return the inverse from the cache if the inverse has already been calculated.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("Getting cached data...")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

## Test the functions

# Matrix to input
m <- matrix(c(1, 2, 3, 0, 1, 4, 5, 6, 0), 3, 3)

# Make cache matrix
m2 <- makeCacheMatrix(m)

# Compute inverse using cacheSolve
cacheSolve(m2)

# Check for cache inverse matrix
cacheSolve(m2)

## 

# create a list of functions:
# The first function, 'makeCacheMatrix' creates a special "matrix", 
# which is really a list containing a function to:
# set the value of the matrix
# get the value of the matrix
# set the value of the inverse of the matrix
# get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {     # creating matrix
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x                     # get matrix x
        setSolve <- function(solve) m <<- solve
        getSolve <- function() m
        list(set = set, get = get,              # store functions as a list
             setSolve = setSolve,
             getSolve = getSolve)
}


## This function computes the inverse of the matrix returned by
## makeCacheMatrix or looks it up in cash and prints it.
cacheSolve <- function(x, ...) {                 # Return a matrix that is the inverse of 'x'
        m <- x$getSolve()              
        if(!is.null(m)) {                       # Test whether m is empty
                message("getting cached data")  # print message and content of m
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
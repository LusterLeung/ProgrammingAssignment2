slo## Put comments here that give an overall description of what your
## functions do

## make a list contains four functions for caching matrix
makeCacheMatrix <- function(x = matrix()) {
        
        ## call m for saving data, initial value is null
        m <- NULL
        
        ## cache the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        
        ## get the matrix
        get <- function() {
                x
        }
        
        ## cache the inverse matrix
        setinverse <- function(inverse) {
                m <<- inverse
        }
        
        ## get the inverse matrix
        getinverse <- function() {
                m
        }
        
        ## return a list of four function for later use
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## calculate inverse matrix by using caching one first (if it exist)
cacheSolve <- function(x, ...) {
        
        ## try to get the caching inverse matrix 
        m <- x$getinverse()
        
        ## if the matrix exist then return
        if(!is.null(m)) {
                message("getting cache data")
                return(m)
        }
        
        ## else calculate the inverse matrix by solve() function and return it
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}



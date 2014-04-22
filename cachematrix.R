## The following two funcitons work together - with cacheSolve referencing makeCacheMatrix
## to create a matrix x and return the inverse of matrix x

## The mackCacheMatrix creates a matrix with input of a matrix x
## It then creates a list with two functions of 
## set which sets the data in the matrix
## and get which returns the data in the matrix

makeCacheMatrix<-function(x=matrix()){

        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x

        list(set = set, get = get)
}


## This function returns the inverse of matrix x by referencing the 
## get() function created in makeCacheMatrix

cacheSolve <- function(x, ...) {
        solve(x$get())
}
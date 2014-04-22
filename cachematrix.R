## The following two funcitons work together - with cacheSolve referencing makeCacheMatrix
## to create a matrix x and return the inverse of matrix x via cache

## The mackCacheMatrix creates a matrix with input of a matrix x
## It then creates a list with four functions of 
## set which sets the data in the matrix
## get which returns the data in the matrix
## setInv which creates the inverse of matrix x
## getInv which returns the data of the inverse of matrix x

makeCacheMatrix<-function(x=matrix()){
        inv<-NULL
        set <- function(y) {
                x <<- y
                inv<<-NULL
        }
        get <- function() x
        setInv<-function(solve)inv <<- solve
        getInv<-function()inv
        list(set = set, get = get,
             setInv = setInv,
             getInv = getInv)
}


## cacheSolve creates a cache of the inverse of matrix x from the
## makeCacheMatrix function by referencing the nested funcion
## getInv. If there is no cache, it outputs a message relaying that it is
## getting the cached data, then creates the inverse of matrix x

cacheSolve <- function(x, ...) {
        inv<-x$getInv()
        if(!is.null(inv)){
                message("getting cached data")
                return(inv)
        }
        data<-x$get()
        inv<-solve(data,...)
        x$setInv(inv)
        inv
}

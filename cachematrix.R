## We have two functions makeCacheMatrix,cacheSolve
##makeCacheMatrix consists of set,get, setinv, getinv.I will use library(MASS)..
#to calculate inverse for non squared as well as squared matrices

makeCacheMatrix <- function(x=matrix()){
  inv <- NULL           #initializing inverse as NULL 
  set <- function(y){
    x <<- y
    inv <<- NULL
}
  get <- function() x           #function to get matrix x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() {
                           inver<-ginv(x)              #function  to obtain the inverse of the matrix
                           inver%*%x
                           }
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

##İt is used cache data.And checked whether inverse is NULL or not.Then returns inverse value.
#After all calculated inverse value. ## Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...)   
  {
  inv <- x$getinverse()
  if(!is.null(inv)){                     
    message("getting cached data!")
    return(inv)                            
  }
  data <-x$get()
  inv <- solve(data, ...)              
  x$setinverse(inv)
  inv           ## Return a matrix that is the inverse of 'x'

}

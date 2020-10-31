setwd('C:/Users/esb/Desktop/Coursera-R')

## set the input x as a matrix then  solved value "s" as a null
## Also I changed every reference to "mean" to "solve"

makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3))  {
  e <- NULL
  set <- function(y) {
    x <<- y
    e <<- NULL
}
  get <- function() x
  setsolve <- function(solve) e <<- solve
  getsolve <- function() e
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Did Same things here

cacheSolve <- function(x, ...) {
     e <- x$getsolve()
  if(!is.null(e)) {
    message("getting inversed matrix")
    return(e)    
}

  data <- x$get()
  e <- solve(data, ...)
  x$setsolve(e)
  e
}

makeCacheMatrix <- function(cacheMat = matrix()){
    #makeCacheMatrix have an input of a matrix 
    #and will give an output a list of function, containing a cached data 
    #of the input matrix, and the inverse of the input matrix
    
    invMat <- NULL                       #initialization of the cached inverse matrix
    set <- function(inputMat){           
        cacheMat <<- inputMat            #making the cached data of the input matrix
        invMat <<- NULL                  #initialization of the inverse matrix, 
                                         #because a new matrix is inserted
    }
    get <- function() {                 
        cacheMat                         #retrieve the cached matrix
    }
    setInv <- function(inputInvMat){
        invMat <<- inputInvMat           #making the cached data of the inverse matrix
    }
    
    getInv <- function(){
        invMat                           #retrieve the cached inverse matrix
    }
    list(set = set, get = get,           #the list of function that will call and set the cached data
         setInv = setInv, 
         getInv = getInv)
}

cacheSolve <- function(cacheMat,...){
    #cacheSolve recieve a cache matrix created from makeCacheMatrix
    #and will output the inverse of the matrix if it have not been calculated
    #if the inverse have been calculated, then the cached will be the output instead
    
    invMat <- cacheMat$getInv()       #retrieve the cached inversed matrix
    if (is.null(invMat)){             #if the inverse matrix have not been calculated
        data <- cacheMat$get()        #retrieve the cached matrix
        invMat <- solve(data)         #calculate the inverse matrix
        cacheMat$setInv(invMat)       #make a cache of the inverse matrix
        return(invMat)
    }
    print("getting cache data")       #if the the inverse matrix is already present
    invMat                            #return the inverse matrix
}

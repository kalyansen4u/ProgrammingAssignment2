test.cacheSolveWithIdentityMatrix <- function() {
  # The inverse of the identity matrix is equals to itself
  x <- makeCacheMatrix(diag(1,3))
  checkEquals(cacheSolve(x), diag(1,3))
}


test.cacheSolveWithRandomMatrix <- function() {
  # The inverse of a normal matrix is equals to the inverse 
  # of the cached matrix
  set.seed(1)
  z <- matrix(rnorm(9, 100), ncol=3, nrow=3)
  y <- solve(z)
  x <- makeCacheMatrix(z)
  checkEquals(cacheSolve(x), y)
}


test.cacheSolveWithSingularMatrix <- function() {
  # A singular matrix raises an error
  x <- makeCacheMatrix(matrix(1:9, nrow = 3))
  checkException(
    cacheSolve(x), 
    "Lapack routine dgesv: system is exactly singular: U[3,3] = 0"
  )
}
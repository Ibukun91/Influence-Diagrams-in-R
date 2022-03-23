#COVARIANCE TO INFLUENCE DIAGRAM PROGRAM
# Input: matrix E, vector mu
# Output: matrix B, vector v
#   Also matrix K (by-product)
s <- 4
E <- matrix(c(16, 8, 12, -4,
              8, 5, 11, -4, 
              12, 11, 70, -31,
              -4, -4, -31, 63),
            nrow=s, ncol=s, byrow=TRUE)
mu <- rep(0, time=s)

# definition of objects to save the outputs
B <- matrix(NA, nrow=s, ncol=s)
K <- 1/E
v <- rep(NA, time=s)

for (j in 1:s) {
  
  B[j, j] <- 0
  
  if (j > 1) {
    for (k in 1:(j-1)) {
      B[k, j] <- sum(as.vector(K[k, 1:(j-1)]) * as.vector(E[1:(j-1), j]))
      B[j, k] <- 0
    }
  }
  
  if (E[j, j] == Inf) {
    v[j] <- Inf
  } else {
    if (j > 1) {v[j] <- max(0, E[j, j]-sum(as.vector(E[j, 1:(j-1)])*as.vector(B[1:(j-1), j])))}
    else {v[j] <- max(0, E[j, j])}
  }

  # print(c(j))
  # browser()
    
  if (v[j]==0 | v[j]==Inf) {
    K[j, j] <- 0
    if (j > 1) {
      K[j, 1:(j-1)] <- 0
      K[1:(j-1), j] <- 0
    }
  } else {
    K[j, j] <- 1/v[j]
    if (j > 1) {
      for (k in 1:(j-1)) {
        temp <- K[j, j] * B[k, j]
        if (k > 1) {
          for (l in 1:(k-1)) {
            K[k, l] <- K[k, l] + temp * B[l, j]
            K[l, k] <- K[k, l]
          }
        }
        K[k, k] <- K[k, k] + temp * B[k, j]
      }
    }
    if (j > 1) {
      for (k in 1:(j-1)) {
        K[j, k] <- -K[j, j] * B[k, j]
        K[k, j] <- K[j, k]
      }
    }
  }
}
B
v

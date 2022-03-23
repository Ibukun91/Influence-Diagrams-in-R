#NODE REMOVAL PROGRAM
n.pred <- 1
n.tgt <- 2
n.succ <- 1

n <- n.pred+n.tgt+n.succ
#M <- rep(NA, time=4)
mu <- c(0, 0, 0, 0)
v <- c(16, 1, 36, 49)
B <- matrix(c(0, 0.5, -1.75, -0.125, 
              0, 0, 5, 0.5,
              0, 0, 0, -0.5,
              0, 0, 0, 0),
            nrow=4, ncol=4, byrow=TRUE)
for (i in (n.pred+n.tgt):(n.pred+1)){
  if (B[i,n] == 0) {
    next
  } else {
    for (j in 1:n.pred) {
      if (B[j,i] == 0) {
        next
      }
      B[j,n] <- B[j,n] + B[j,i]*B[i,n] 
    }
   }
    if ((i-1) >= (n.pred+1)) {  #INCREASING SEQUENCE
    for (j in (n.pred+1):(i-1)) {
      if (B[j,i] == 0) {
        next
      }
      B[j,n] <- B[j,n] + B[j,i]*B[i,n] 
    }
    }
  for (j in (n.pred+n.tgt+1):(n-1)) {
    if (B[j,i] == 0) {
      next
    }
    B[j,n] <- B[j,n] + B[j,i]*B[i,n] 
   }
  if (v[i] == 0) {
    next
  }
  if ((v[i] != Inf) & (v[n] != Inf)) {
    v[n] <- v[n] + B[i,n]*B[i,n]*v[i]
   } else {
     v[n] <- Inf
   }
  v[i] <- 0
}
for (i in 1:n) {
  for (j in (n.pred+1):(n-1)) {
    B[i,j] <- 0
    B[j,i] <- 0
  }
}
v
B

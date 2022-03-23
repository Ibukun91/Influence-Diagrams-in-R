#ARC REVERSAL BETWEEN VECTOR NODES PROGRAM

n.pred <- 2
n.tgt <- 1
n.succ <- 1

v <- c(16, 1, 36, 49)
B <- matrix(c(0, 0.5, -1.75, -0.125, 
              0, 0, 5, 0.5,
              0, 0, 0, -0.5,
              0, 0, 0, 0),
            nrow=4, ncol=4, byrow=TRUE)

for (i in (n.pred+1):(n.pred+n.tgt)) {
  
  for (j in (n.pred+n.tgt+1):(n.pred+n.tgt+n.succ)) {
    
    if (B[i,j] == 0) {
      next
    } else {
      
      for (k in 1:n.pred) {
        if (B[k,i] == 0) {
          next
        } else {
          B[k,j] <- B[k,j] + B[k,i] * B[i,j]
        }        
      }
      
      if ((i-1) >= (n.pred+1)) { # assume increasing order
        for (k in (n.pred+1):(i-1)) {
          if (B[k,i] == 0) {
            next
          } else {
            B[k,j] <- B[k,j] + B[k,i]*B[i,j]
          }
        }  
      }
      
      if ((j-1) >= (n.pred+n.tgt+1)) { 
        for (k in (n.pred+n.tgt+1):(j-1)) {
          if (B[k,i] == 0) {
            next
          } else {
            B[k,j] <- B[k,j] + B[k,i]*B[i,j]
          }
        }  
      }
      
      if (v[i] == 0) {
        B[j,i] <- 0
      } else {
        if ((v[i] != Inf) & (v[j] != Inf)) {
          if (v[j] == 0) {
            v[j] <- B[i,j]*B[i,j]*v[i]
          } else {
            v.j.old <- v[j]
            v[j] <- v[j] + B[i,j]*B[i,j]*v[i]
            v.ratio <- v[i] / v[j]
            v[i] <- v.j.old * v.ratio
            B[j,i] <- B[i,j] * v.ratio
          }
        } else {
          if (v[j] != Inf) {
            B[j,i] <- 1 / B[i,j]
          } else {
            B[j,i] <- 0
          }
          if ((v[i] == Inf) & (v[j] != Inf)) {
            v[i] <- v[j]*B[j,i]*B[j,i]
          }
          v[j] <- Inf
        }
      }
      
      B[i,j] <- 0
      
      for (k in 1:n.pred) {
        if (B[k,j] == 0) {
          next
        } else {
          B[k,i] <- B[k,i] - B[k,j]*B[j,i]
        }        
      }
      
      if ((i-1) >= (n.pred+1)) { # assume increasing order
        for (k in (n.pred+1):(i-1)) {
          if (B[k,j] == 0) {
            next
          } else {
            B[k,i] <- B[k,i] - B[k,j]*B[j,i]
          }
        }  
      }
      
      if ((j-1) >= (n.pred+n.tgt+1)) { 
        for (k in (n.pred+n.tgt+1):(j-1)) {
          if (B[k,j] == 0) {
            next
          } else {
            B[k,i] <- B[k,i] - B[k,j] * B[j,i]
          }
        }  
      }
    
    }   
    
  }
  
}

v
B
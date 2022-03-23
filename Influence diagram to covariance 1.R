#INFLUENCE DIAGRAM CONVERSION TO COVARIANCE MATRIX
v <- c(16,1,36,49)
B <- cbind(c(0,0,0,0),c(0.5,0,0,0),c(-1.75,5,0,0),c(-0.125,0.5,-0.5,0))
#Covariance matrix E
E <- matrix(nrow=4,ncol=4)
for (i in 1:4) {
  if(i > 1) {
    for (j in 1:(i-1)){
      E[i,j]=0
      for(k in 1:(i-1)) {
        #print(E[j,k])
        if (E[j,k]!= Inf) {
          E[i,j]<- E[i,j] + (E[j,k]*B[k,i])
        }
      }
      E[j,i]= E[i,j]
    }
  }
  
  if (v[i]== Inf) {
    E[i,i]=Inf
  } else {
    if(i > 1) {E[i,i]= v[i] + sum(E[i,1:(i-1)]*B[1:(i-1),i])}
    else {E[i, i]=v[i]}
  }
}
E



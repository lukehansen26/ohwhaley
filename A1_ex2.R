library(tidyverse)
#exercise 2
#question 0
set.seed(2048) #setting the seed for reproducibility

#question 1
X <- list(1:100) #create an list of 100 slots 
for(i in 1:100){ #run a for loop to access every slot of the list x
  name <-  paste("n",i) #create the name for each slot 
  vect <- c(rnorm(5,20,10)) #create a numeric vector of 5 elements randomly sampled from N(mu = 20, sd = 10)
  X[[i]] <- list(name = name, vect = vect) #at each slot of the main list create a sub-list containing the name and corresponding vector 
}
X #returning the list 

#question 2
str(X)

#question 3
q3 <- c(1:100)   #create a new vector of 100 slots 
for(i in 1:100){ #run a for loop to access every slot of the list q3
  q3[[i]] = sum(X[[i]]$vect) #at every slot sum all the elements in the x lists vect sub-list and save in corresponding q3 slot.
}
q3 #return the output as a vector of size 100

#question 4
M = matrix(nrow = 100, ncol = 5) #create a matrix of size 100x5
for(i in 1:100){ #run a nested for loop to access each element of the 'vect' list inside each element of the list 'x'
  for(j in 1:5){
    M[i,j] = X[[i]]$vect[j] #at each element in the 'vect' list copy to the corresponding 'j' position in the matrix.
  } #then iterate the outer for loop to access the next element in the 'x' list which moves down a row in the matrix 
}
M #return the matrix M

#question 5
q4 <- c(0,0,0,0,0) #create an empty vector of size 5 
for(i in 1:5){ #run a nested for loop to access each element in the 5 columns of the matrix 
  for(j in 1:100){
  q4[i] = q4[i] + M[j,i] #for each column 1:5 in the matrix, add each element to the corresponding position in the vector 1:5 
  }#this gives the sum by columns of M
}
q4 #return as a vector 


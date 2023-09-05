#question 1 
x <- 1
x == 1
x > 1
log(x)
if(x ==1) log(x)
if(x > 1)log(x)
foo <- function(x){
  if(x>2){
    "a"
  }else if(x < 2){
    "b"
  }else if(x ==1){
    "c"
  }else{
    "d"
  }
}
foo(1)
foo(7)
foo(3.4)
#question 2
clean <- function(x) {
  if (x == -99 || x =="." || x =="NaN") {  #use the logical or operator so i dont have to write 4 if
    return("NA")
    "NA"
  }
}
clean(-99)

#r is an iterative algorithm it will will read line by line ie iterate the lines 
#if the curer moves to an uderscore rather than a vertical line press the insert button its ins on my keyboard

impatient_square <- function(x) {
  return(x) #it will jsut return the value passed and not read the x^2 code 
  xˆ2
}
impatient_square(2)

clean <- function(x) {
  if (x %in% c(-99,".","","NaH")){
  } else if(x == NULL){
    stop('x is NULL')
  }
  return(x)
}
clean(-99)
clean(".")
clean("NaN")
clean(1)

immovable_square <- function(x) {
  stop("I refuse to proceed.") #stop will give you an error now when the conition is satified in this instance the 
  xˆ2 #condition is passing a value to the function 
}
immovable_square(2) #the error will say whatever you wrtie as an aargument for stop 

clean(NULL)

#the difference between stop() and warnign() is tht stop will give you an error message and stop executing the code
#warning() will generate a warnign message and then continue runnign code 

#question 3

n <- 1
while(n<=5){ #the whie loop will run until the condition is no longer satisfied at whcih point it will cease 
  print(n)
  n <- n+1
}
is_prime <- function(x){
  n <- 2 #you will start at 2 if n is equal to 2 then you will return true else it will check 
  repeat{ #if the mod of the argument and n is zero its divisible and its not prime so return false
    print(n) #otherwise increment n by one and repeat 
    if(n == x){
      return(TRUE)
    }
    if(x%% n == 0){
      return(FALSE)
    }
    n <- n+1
  }
}
is_prime(7557)
help('repeat') #the repeat function will continue on forwever until something is returned
#if nothings reutrned it will probably give an eror or stack overflow 

is_prime2 <- function(x){
  n <- 2
  while(n < x){
    print(n)
    if(n == x){
      return(TRUE)
    }
    if(x%% n == 0){
      return(FALSE)
    }
    n <- n+1
  }
}
is_prime2(345)


for (n in c(1, 2, 3, 4, 5)) { #its going to evaluate every element in the combine vecotr for n 
  print(n) #and then print n for each 
}
for (i in c(1, 10, 200)) { #same thing for this funciton we are passing i as the name of the variable this time 
  print(i)
}
for (person in c("Betty", "Veronica", "Archie")) { #this time we are passing person as the variable 
  greeting <- paste("Hello", person) #its going to evaluate every sting in the combine vecotr 
  print(greeting) #then store "hello person" as a tempoary variable then print the temp variable 
}

#the above code is similar to assignment question with paste 

seq(1, 10) #seq(1,10, by = 1) this will create a sequence starting at 1 and ending at 10 increamenting by 'by' 
#whichi in this case is 1

seq_along(c(1, 10, 200)) #seq_along(1,100,10000) will generate a sequence of the length of each of each arguement 


is_prime3 <- function(x){
  n <- 2
  for(n in seq(2,x-1)){ #now we are making is_prime a for loop which iterates over the sequence 2 to x-1
    print(n)
    if(n == x){
      return(TRUE)
    }
    if(x%% n == 0){
      return(FALSE)
    }
    n <- n+1
  }
}
is_prime2(345)


x <- c(1, 2, 3, 4, 5) #this is creating a combine vector from 1:5
y <- double(length = 5) #this creates a double of length 5 ie an array length 5. this creates a numerical vector of length 5 
for (i in seq_along(x)) { #this evaluates every index i along the sequence passed refered to as x
  y[i] <- sqrt(i) #this will store the square root of every index in i in the array y 
}
y #this calls y
sqrt(x)  #this calls the square root of x to show you they are the same
c(1, 2, 3, 4, 5) + c(1, 2, 3, 4, 5) 
round_square <- function(vec) {  #this is a function which will do the same thing as above but 
  sqs <- sqrt(vec) #then round the suqare root of each item the array to two decimal places 
  round(sqs, digits = 2)
}
round_square(x)

is_prime4 <- function(x, n = 2) { #this is a recursive funciton starting at 2
  if (n == x) { #this is the base case if we reach this without getting false its a prime hence true 
    return(TRUE)
  } else if (x %% n == 0) { #it will test if theres no remainder hence its divisible at each point
    return(FALSE) #reutrnign false if the mod is 0 
  } else {
    is_prime4(x, n = n + 1) #if none of these things happen the funciton will call itself with the value of 
  } #n increasing by 1, in effect iterating itself till it returns true or false 
}
is_prime4(7)

x <- -99
x == -99 | x == "." #  | ia the logical or operator for integers 
x <- c(-99, 0, 1)
x == -99 #if you use the | operator on a vector then it will evaluate the first item in the vecotr
x == "." #then it will stop  
x == -99 | x == "."
x <- c(-99, 0, 1)
if (x == -99 || x == ".") NA # || is the logcal operator for vecotrs this will evaluate ALL items in the vector
x <- -99
if (x == -99 || stop("if you eval_sol this.")) "I didn't eval_sol stop()."

clean <- function(x) {
  ifelse(x == -99, NA, x) {#this will go though every item in the vector and go if its -99 reutrn NA
    #else return x
    }
}
clean(c(-99, 0, 1))

foo <- function(x) {
  if (x > 2) {
    "a"
  } else if (x < 2) {
    "b"
  } else if (x == 1) {
    "c"
  } else {
    "d"
  }
}
foo(1)
library(tidyverse) #to export case_when
foo2 <- function(x) {
  case_when( #using the case_when function will stop you from needing to use the if else constnatly to check 
    x > 2 ~ "a", #conditions, its just going to go though each comma and say if this is true return the thing after the ~
    x < 2 ~ "b",#ie x < 2 ~"b" is if(x<2) "b" else
    x == 1 ~ "c",
    TRUE ~ "d"
  )
}
foo2(1)

clean <- function(x) {
  if (x == -99) {
    NA
  } else if (x == ".") {
    NA
  } else if (x == "") {
    NA
  } else if (x == "NaN") {
    NA
  } else {
    x
  }
  #you cant do clean(c("","."),-99,-99) as this is a vector instead you need ot use ifelse()

  grade <- function(x){ #here we made a funciton which returns the average of the best 9 marks 
    return((sum(x)-min(x))/9)
  }
  chris <- c(94, 97, 88, 93, 87, 84, 87, 85, 87, 88) #then we can pass a vector of 10 grades for each student
  maurizio <- c(94, 83, 82, 85, 76, 77, 83, 75, 73, 97)
  tom <- c(77, 73, 77, 69, 59, 69, 72, 69, 71, 77)
grade(chris)  #then we can grade them  very fast rather than having to calcuate the average for each
grade(maurizio)
grade(tom)

#7 challenge questions 
coin1 <- function(){
  x = runif(1)
  y = runif(1,min = 0, max = 1)
  w = 'false';
  z = 'false';
  if(x >= 0.5){
    w = 'heads'
  } else {
    w = 'tails'
  }
  if(y >= 0.5){
    z = 'heads'
  } else {
    z = 'tails'
  }
  print(c(w,z))
}
coin1()

coin2 <- function(){
  x = runif(1)
  y = runif(1,min = 0, max = 1)
  w = 'false';
  z = 'false';
  if(x >= 0.65){
    w = 'heads'
  } else {
    w = 'tails'
  }
  if(y >= 0.5){
    z = 'heads'
  } else {
    z = 'tails'
  }
  print(c(w,z))
}
coin2()
coin2()
coin2()
coin2()
coin2()

foo <- function(x) {
  if (x > 2) "a"
  else if (x < 2) "b"
  else if (x == 1) "c"
  else "d"
}
foo(1)

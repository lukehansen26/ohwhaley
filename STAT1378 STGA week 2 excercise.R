x <- 1
1+1
2+24
2^4
log(10)
log10(10)
exp(3)
x <- 2
x
x+3
x <- x+3
x
1:10
a <- 1:10
a
a[3]
a <- a+5
a
a*a
a%*%a
a %o% a
a%/%3
5%%3
a%%3
5%/%3
matrix(data = 1:50, nrow = 5, ncol = 10)
y <- matrix(1:12, ncol = 3, nrow = 4)
x <- matrix(1:12, ncol = 4, nrow = 3)
x%*%y
A
round(3.14159)
round(3.14159,2)
round(x=3.14159, digits = 2)
x <- 1:10
mean(x)
round(mean(x))
round(mean(x),digits=0)
round(mean(x),digits =2)
my_function <- function(x){
  x <- x+2
  mean(x)
}
my_function(1:10)
my_function(1:5)
tabyl()
install.packages("janitor")
library("janitor")
tabyl()
x <- c(1,2,2,2,3,3)
tabyl(x)
help()
rnorm(100)
rnorm(10,mean =1, sd = 2.5)
rnorm(10,mu = 1,sd = 2.5)
hel0(rnorm)
help(rnorm)
q <- rnorm(10,mean =1, sd = 2.5)
plot(q)
hist(q)
w <- rnorm(1000,mean=1,sd=2.5)
hist(w)
install.packages("reprex")
library(reprex)
y <- 1:4
mean(y)
reprex(y = NULL)
fn <- function(x = c(), k = integer){
  plot(x,x^k)
  return(x^k)
}
fn(2,3)
fn(c(2,3,4,4,5,6,6),3)

fn1 <- function(x=c(),k=integer,cols = c("#1E2F81","#17582E")){
  f1 <- x^k
  f2 <- x^(k+1)
  ylim <- range(c(f1,f2))
  plot(x,x^k,type = "l", main = "power.functions",ylim=ylim,col = cols[1])
  lines(x,x^(k+1), col = cols[2])
}
fn1((-100:100)/50,2,c("#D78141","#8B41D7"))


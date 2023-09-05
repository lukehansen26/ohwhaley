a <- 1:10
a
a%*%a #gives the dot product of a ie 1+4+9+16+25...+100
      #this is called inner matrix multiplication

a %o% a #gives outer matrix multiplication 

5%%3 #this is the modulo operator ie gives the remainder

5%/%3 #this is the quotient operator and gives you the integer of division

y <- matrix(1:12, ncol = 3, nrow = 4) #this is how you create matrixes 
x <- matrix(1:12, ncol = 4, nrow = 3) #then you can do matrix multiplication
x%*%y     #remember the number of inside row/col needs to be same ie
          #3x4 * 4x3 = 3x3 matrix 

# r is case sensitive ie A != a 

z <- c(1,2,3,4,5,10,2,5,9,6) # c creates a numeric vector, the c() fucntion is short for combine
z

tabyl(z) #tabyl() creates a frequency distribution table of the numeric vector

plot(a,z,type = "l", col(a = "#1E2F81", z = "red")) #type = "l" means line plot, by defult its a dot plot 

fn1 <- function(x=c(),k=integer,cols = c("#1E2F81","#17582E")){ #this function passes defult colours seen on this line, so if unspecified will go to these
  f1 <- x^k
  f2 <- x^(k+1)
  ylim <- range(c(f1,f2)) #range saves the minimum range of the passed values by defult 
  plot(x,x^k,type = "l", main = "power.functions",ylim=ylim,col = cols[1]) #main = "power.functions" will tite the plot power.functions
                                                      #col tells the colour to be the first value in the first argument for the numeric vector cols
  lines(x,x^(k+1), col = cols[2])  #this will now plot anoter line according to the function and colour it the seccond col in cols
}
fn1((-100:100)/50,2,c("#D78141","#8B41D7")) #here we call the function passing the colours as organe adn purple 


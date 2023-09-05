#DRY over WET code, ie dont repeat yourself, if you can write a funciton do so
df$a[df$a == -99] <- NA #theres 2 errors here due to typos 
df$b[df$b == -99] <- NA #to prevent typos we can use a cution to remove scources of duplication
df$c[df$c == -99] <- NA #ie to avoid writing out the same thing again remeber DRY > WET
df$d[df$d == -99] <- NA
df$e[df$e == -99] <- NA
df$f[df$f == -99] <- NA
df$g[df$g == -98] <- NA
df$h[df$h == -99] <- NA
df$i[df$i == -99] <- NA
df$i[df$j == -99] <- NA
df$k[df$k == -99] <- NA

fix_missing <- function(x) { #now all we need to do is call the funciton for each value and store
  x[x == -99] <- NA #the output of the function. but there are still errors 
  x
}
df$a <- fix_missing(df$a)
df$b <- fix_missing(df$b)
df$c <- fix_missing(df$c)
df$d <- fix_missing(df$d)
df$e <- fix_missing(df$e)
df$f <- fix_missing(df$f)
df$g <- fix_missing(df$g)
df$h <- fix_missing(df$h)
df$h <- fix_missing(df$i)

fix_missing <- function(x) { #now we have the function 
  x[x == -99] <- NA
  x
}
for (i in seq_along(df)) { #but instead of having to type the whole df sequence risking typos 
  df[[i]] <- fix_missing(df[[i]]) #(also its much slower) we can use a for loop to evaluate every 
} #item in the df sequence by calling the function at each point in the loop 

means <- apply(mtcars, 2, mean) #in base r the you can use the function apply 
median <- apply(mtcars, 2, median) #the argument 1 or 2 in this case 2 apply it to rows or coloums respectivlty 


library(purrr) #map_dbl applys the function eg mean or median to every element in the vector 
means <- map_dbl(mtcars, mean) #in tidyverse you can use map_dbl 
medians <- map_dbl(mtcars, median)


#map(x,f) for each element in x apply f 
#.x is a special pronoun that map understands to solve for a single x 
map_dbl(mtcars, ~ max(.x))
#map_chr() returns a vector of a character
#map_dbl returns a vector of a numeric
map_int returns a vector of an integer
#same for lgl and df 
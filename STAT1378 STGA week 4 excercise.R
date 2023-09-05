#Atomic vectors -- theres are six types, logical, integer, double, character, complex, and raw 
# intergers adn doubles are numeric vectors 

#lists -- theres are called recursive ectors are they can contain other lists 
#the main difference between atomic vectors and lists are that atomic vecetors are homogenous 
#(they must all be of the same type) while lists are heterogenous (elements can have different tyoes)

#atomic vectors as doubles 
library(tidyverse)
x <- c(1, 2, 3, 4, 5, 6) #this is a double as weve input values, all these numbers are doubles
x #x is an atomic vector 
typeof(x)
class(x)
str(x)
x <- 1:6 #this is of type integer, and is also an atomic vector 
x
typeof(x)
class(x)
str(x)
x <- seq(1, 6, len = 6)
x
typeof(x)
class(x)

#atomic vectors as integers 
x <- c(1L, 2L, 3L, 4L, 5L, 6L) #how you define a integer is the number followed by L 
xv #so 2L is an integer but 2 is a double 
typeof(x)
class(x)
str(x)
x <- c(1, 2, 3, 4, 5L, 6L) #everything has to be uniform as this is an atomic vector 
x #but they must be uniform of the most complex type this has doubles and integers so this 
typeof(x) #is an atomic vector of type double 
class(x)
str(x)
x <- as.integer(x) #this converts the data type to integer 
x
typeof(x)
class(x)
str(x)

#atomic vectors as characters 
x <- "This" #weve put "" around the character which tells r the data type is character 
x
typeof(x)
class(x)
str(x) #str(x) returns the type followed by the atomic vecotr 
x <- c("This", "unit", "is", "great.", "Do", "you", "agree?")
x
typeof(x)
class(x)
str(x)
x <- paste("This", "unit", "is", "great.", "Do", "you", "agree?", sep = "::")
x #paste allows you to return an atomic vector but separate the element by whatever you choose
typeof(x)#use sep = "" to separate the elements in this case its separated by ::
class(x)
str(x)
x <- paste("This", "unit", "is", "great.", "Do", "you", "agree?", sep = " ")
x #you can also separate by " " ie a space this is probably most useful 
typeof(x)
class(x)
str(x)
cat("This", "unit", "is", "great.", "Do", "you", "agree?", sep = "\t") #\t seperates by a tab
cat("This", "unit", "is", "great.", "Do", "you", "agree?", sep = "\n")#\n seperates by a line
cat("This", "unit", "is", "great.", "\n", "Do", "you", "agree?") #you can choose where you want to 
#sepeate by putting "\n" in the middle of the vector
cat("This ", "unit ", "is ", "great.", "\n", "Do ", "you ", "agree? ", sep = "")
glue::glue("This unit is great. Do you agree?")
glue::glue("This unit is great. 
Do you agree?") #anything inside of glue will get returned as is, this isnt an atomic vector

#atomic vectors as logicals
1 > 0
1 < 0
1 <- 1
1 == 1
x <- c(TRUE, TRUE, FALSE)
x
typeof(x) #this is an atomic vector of type logical each element can either be true or false
class(x)
str(x)
x <- c(T, T, F) #capital T or F are the shorthand for true or false 
x
typeof(x)
class(x)
str(x)
x <- 1 > 0
x
typeof(x)
class(x)
str(x)
x <- c(1 > 0, 5 > 0, 5 > 10) #x is a combine vector of logical statments
x #when you return the x atomic vecotr it will evaluate the elements and reutnr the logical output 
typeof(x)
class(x)
str(x)

#atomic vectors as factors 
x <- c("spring", "spring", "winter", "spring", "winter", "spring", "spring")
x #this is just an atomic vector of characters 
typeof(x)
class(x)
str(x)
attributes(x)
x <- factor(c("spring", "spring", "winter", "spring", "winter", "spring", "spring"))
x #you can specify the vector is of type factor, here it will find common factors 
typeof(x)#and cetegorise them into factors of level spring and winter
class(x)
str(x)
attributes(x) #then it can tell you what element belongs to what type 
table(x) #now it can tabulate the how many of each categories there are 
as.character(x)

#factors are essentially how we do categorical vectors in r when we fit models 
x <- 1:6
attributes(x)

names(x) #here weve named each element in x which goes from 1 to 6 
names(x) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun")#the atomic vector is 1,2,3,4,5,6
names(x)
attributes(x) #they type is still integer but the integers have atributes ie the months 
str(x)
class(x)
x

#matrices
x <- 1:6 #here we have an integer atomic vector
dim(x) <- c(2, 3) #now weve added attributes to x which is a dimention making it a matrix
attributes(x)
str(x)
class(x) 
x #x is a matrix weve fit the elements in the atomic vector into the matrix 

m <- matrix(1:6, nrow = 2) #now we are specifying straight away that m is a matrix rather than
str(m)#having to do dim(x) <- c(2,3)
class(m)
m
m <- matrix(1:6, nrow = 2, byrow = TRUE) 
str(m)
class(m)
m

#arrays 
x <- array(c(1:5, 11:15), dim = c(5, 5)) #we want an array of numbers 1:5 then 11:15 and then we
str(x)#specified the dimenion of the matrix and it will continue to do this till the matrix is full
class(x)
x
## R add to recycle values: we gave in input 10 values, but needed 25 (5*5)
x <- array(c(1:15, 21:30), dim = c(5, 5)) #here we gave r 25 values so it will fill the matrix
str(x)#without repeating or recycling values 
class(x)
x
x <- array(c(1:15, 21:30, 101:125), dim = c(5, 5, 2)) #this is a 3 dimensional matrix
str(x)#the last thing in dim ie 2 is the z coordinate 
class(x)
x #this reurn sheets of the 3d vector ie the first sheet is 1 the second sheet is 2 
x <- array(c(1:25, 101:125), dim = c(5, 5, 2))#it will continue to fill up the array without 
str(x) #repeating as we have specified all cells in the array
class(x)
x

#lists
x <- list(1:5, 11:15, c("a", "b", "c")) #the list can hold integers and characters in the same thing
str(x)
class(x)
x#the first 2 elements in the list are integers the 3rd is characters 
x <- list(x1 = 1:5, x2 = 11:15, x3 = c("a", "b", "c")) #you can name each element in the list 
str(x)
class(x) #the calss will allways be lsit 
x
x <- list(x1 = 1:5, x2 = 11:15, x3 = list(y1 = "a", y2 = "b", y3 = "c")) #this is why lists 
str(x)#are called recursive vectors as this one is a list of a list 
class(x)
x


#tibble is the tidyverse implementation of a data frame, we prefer to work with tibble as we use tidyverse
#data frames and tibbles
x <- data.frame(
  season = c("winter", "winter", "spring", "spring"),
  month = c("Jan", "Feb", "Apr", "Apr"),
  station = c("Sydney", "New Castle", "Sydney", "Melbourne"),
  temperature = c(14, 17, 26, 25)
)
str(x)
typeof(x)
class(x)
x
x <- tibble(
  season = c("winter", "winter", "spring", "spring"), #you can specify each element on each 
  month = c("Jan", "Feb", "Apr", "Apr"),#category 
  station = c("Sydney", "Newcastle", "Sydney", "Melbourne"),
  temperature = c(14, 17, 26, 25) #tibble creates the data frame coloum wise 
)
str(x)
typeof(x)
class(x)
x
x <- tribble(
  ~season, ~month, ~station, ~temperature, #or you can specify each category with ~ 
  "winter", "Jan", "Sydney", 14,#then for each row in the tribble you can fil out all the data
  "winter", "Feb", "Newcastle", 17, #tribble is a tibble but you create it row wise 
  "spring", "Apr", "Sydney", 26,
  "spring", "Apr", "Newcastle", 25
)
glimpse(x)
typeof(x)
class(x)
x #we like tibbles better than data.frames as tibbles show the data type of each colom

#loading and saving data
library(tidyverse) #make a r project for each class and then set the folder the project is in as the workign directory
x <- read_csv(file = "test.csv") #then you can store all the data files in that folder and use read_csv wihtout it being annoying
str(x) #otherwise you must specify theworking direcotry every time you make a new r script 
glimpse(x)
typeof(x)
class(x)
x

x <- tribble(
  ~season, ~month, ~station, ~temperature,
  "winter", "Jan", "Sydney", 14,
  "winter", "Feb", "Newcastle", 17,
  "spring", "Apr", "Sydney", 26,
  "spring", "Apr", "Newcastle", 25
)
str(x)
typeof(x)
class(x)
x
write_csv(x, file = "my_data_file.csv") #use write_csv to wrtie an excel document from the data


#selecting and modifying values 
    # Vectors
x <- c("spring", "spring", "winter", "spring", "winter", "spring", "spring")
x[2]
x[c(2, 3, 5)]
x[2] <- "summer" #identify  which element in the atomic vector using x[2] <- "summer" and assign it 
x
x[-2]
x[c(T, T, F, F, F, T, T)]
    # Matrices
x <- matrix(1:18, nrow = 3)
x
x[2, 3] #here we just want element (2,3)
x[2, c(1, 3)] #here we want row 2 and elements 1,3 from that row
x[2, 3] <- 9 #here we jsut want elemetn 2,3 and assign it 9 
x
x[1:2, 1]

x[, 1] #we want coloum 1 and it will list them
x[, 1, drop = FALSE] #here it wont drop the data telling us which row they are all from
x[-2, ]
x[-2, -c(2, 3)] #the minus exludes stuff, so thi swould be everythign but row 2
x[c(T, F, T), ]

# Data frames & tibbles
x <- tribble(
  ~season, ~month, ~station, ~temperature,
  "winter", "Jan", "Sydney", 14,
  "winter", "Feb", "Newcastle", 17,
  "spring", "Apr", "Sydney", 26,
  "spring", "Apr", "Newcastle", 25
)
x
x[2, 3]
x[2, c(1, 3)]
x[3, 3] <- "Melbourne"
x
x[1:4, 1]
x[, 1]
x %>% #pipe tells r that we are talking about data frame x now 
  pull(1) #we pull coloum 1 
x %>%
  pull(season) #this time we are pulling the whole season coloum which is coloum 1 
x[-2, ]
x[-2, -c(2, 3)] #this is everythign but whats specified here
x[c(T, F, T, T), ]
x$temperature
x$temperature[2]
x$temperature[2] <- 16 #here we are identifying it by the $ and then the elemetn in the coloum 
x
x <- as.data.frame(x)
x[, 1]
x[, 1, drop = FALSE]
# Lists
x <- list(1:5, 11:15, c("a", "b", "c"))
x
x[[1]]
x[[2]]
x[[3]][2]
x[[3]][c(2, 3)]
x <- list(x1 = 1:5, x2 = 11:15, x3 = c("a", "b", "c"))
x
x[[1]]

#https://posit.co/resources/cheatsheets/
#control shift m is the pipe operator shortcut 

#data wrangling wtih dplyr 
library(babynames)
# select
babynames
select(babynames, name) #we can select coloums based on attributes such as their name sex ect
select(babynames, name, sex)
select(babynames, name | year)
select(babynames, !prop)
select(babynames, -c(year, sex, prop))
select(babynames, name:n)
select(babynames, starts_with("n"))

# filter
filter(babynames, name == "Khaleesi") #filter will only return data which fits the specifications weve given it 
filter(babynames, name == "Sea" | name == "Anemone")
filter(babynames, prop > 0.08)
filter(babynames, year == 1880, (n == 5 | n == 6))
filter(babynames, name %in% c("Acura", "Lexus", "Yugo"))

# arrange
arrange(babynames, n)
arrange(babynames, n, prop) #this will sort the data or arrage it given the criteria
arrange(babynames, year, desc(prop)) #you can also give multiple criterias once the first is filled it will go onto the seccond ect
arrange(babynames, desc(year), desc(prop)) #if you want it to be decending you must specify it desc(n)

# pipe %>%
babynames %>% #control shift m is the shortcut for pipe
  filter(year == 2017, sex == "M") %>% #the pipe will specify the data we are talking about then give it a list of stuff to
  select(name, n) %>%#do with the data 
  arrange(desc(n))

# summarise
babynames %>%
  filter(name == "Thomas", sex == "M") %>% #here we can filter out a group of data points 
summarise(total = sum(n), max = max(n), mean = mean(n))#then sumaraise things about them for inscane the mean or total number
babynames %>%
  filter(name == "Khaleesi") %>%
  summarise(year = first(year)) #this is the first occurance of the data filterd previously and we want to summarise the year 
babynames %>%
  summarise(n = n(), distinct = n_distinct(name))

# group_by
babynames %>%
  group_by(year, sex) %>%
  summarise(total = sum(n)) %>%
  summarise(total = sum(total))
babynames %>%
  group_by(year, sex) %>%
  ungroup()
babynames %>%
  group_by(year, sex) %>%
  group_by(name)
babynames %>%
  group_by(name, sex) %>% #this has grouped by name and sex then found the total number of names at that sex
  summarise(total = sum(n)) %>%#then arranged them in decensing order 
  arrange(desc(total))

# mutate
babynames %>%
  mutate(births = n / prop) #here we added another coloum named births which is the n on prob for each row  
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(n)) %>%
  ungroup() %>%
  mutate(fraction = n / year_total) %>%
  group_by(name) %>%
  slice_max(fraction, n = 1)

#questions 
#1
filter(babynames, name == "Sea")
#2
babynames %>% 
  group_by(sex,year) %>% 
  arrange(desc(prop))
babynames %>% 
  group_by(sex,year) %>% 
  arrange(desc(n))
#3
babynames %>% 
  filter(sex == "F", year == "2017") %>% 
  select(name,n) %>% 
  arrange(desc(n))



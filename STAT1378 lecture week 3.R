library(tidyverse)
mtcars
str(mtcars)
rename(mtcars, miles_per_gallon = mpg)
arrange(mtcars, wt)

mtcars %>% #take the mtcars data and then
  rename(miles_per_gallon = mpg) %>% #rename mpg as miles per gallon then,
  arrange(wt) #arrange by row wt

#by using pipes you dont need to constantly call the mtcars data everytime you want 
#to do soemthign to it 

subset(mtcars, hp > 250) #this returns a subset of the data called with a specific condition or values we are looking for
#remember you need to do verb(data, argument) you cannot just evaluate the argument alone
#as r wont know what its looking for 

#filter is the tidyverse verson of subset
filter(mtcars, hp > 250)
#if you get an error using filter then you havnt loaded tidyverse and must do
#library(tidyverse) or dplyr::filter to load speficially filter from the dplyr package

#dplyr::filter is in conflict with status:filter so install the conflicted packages to remid
#you of potential conflicts

install.packages("conflicted")

speed <- subset(cars, speed > 24)
speed

ind <- 1:nrow(cars)
subset(cars, ind > 49)

filter(cars, ind >49) #cars inst a variable that exists in r data so its seatching the parent enviroment for
#evaluation it will find mtcars nd assume thats what I meant 

filter(cars, speed >24) #variables in data take priority for reference over thoes in parental enviroment 

speed <-  1:nrow(cars)
filter(cars, .data$speed > 24) #.data isa special pronoun refereing to varaibles in the data passed in the first argument
filter(cars, .env$speed > 24) #.env is a special pronoun referring to variables in the enviroment (not data in the first arg)

mtcars %>%  #you can use select to only select variables you choose from a data frame 
  select(mpg, cyl, disp)

select(mtcars, mpg, cyl, disp) #you could also not use a pipe and specify the data frame but if your doing multiple thigns with the 
#data after its quicker to use a pipe so you dont need ot keep specifying the data frame

mtcars%>%
  select(mpg:disp) #you can use a semicolon to select continous variables ie it will go from variables first:last

select(mtcars, c(mpg, cyl))
select(mtcars, c("mpg", "cyl"))
select(mtcars, mpg, cyl)
select(mtcars, "mpg", "cyl") #these are all the same as mtcars %>% select(mpg, cyl)

#subsetting a single coloum doenst reduce it to a vector, as a vector isnt tidy if yo ucant a vector you need to pull
mtcars%>% 
  pull(mpg)

#you can subset by index though using slice
mtcars%>% 
  slice(3:1)

mtcars %>% #this will return data by specific row names specified in the combine vector 
  filter(rownames(.) %in% c("Datsun 710", "Mazda RX4"))

mtcars %>%
  mutate(
    gpm = 1 / mpg, #evaluation is done sequentually based on input order so you can reference newly created variables 
    wt = gpmˆ2, #later in input 
    wt = if_else(cyl == 6, 10, wt),
    hp = case_when(
      cyl == 6 ~ 11,
      cyl == 4 ~ 10,
      TRUE ~ 3
    )
  ) %>%
  slice_head()


mtcars %>%
  mutate(gpm = 1 / mpg) %>% #you can call multiple mutates but computational performance is better if done within
  mutate(wt = gpmˆ2) #hthe same mutate cell, also its faster to use a pipe instead of using muliple mutate cells 

mtcars %>%
  relocate(am, carb, .before = cyl) #you can sort coloums and move around where they are by using relocate 
#you can also use the .before = cyl or .after = cyl the dot operator will be referenceing the variable passed in previous arguments

mtcars %>%
  select(sort(names(.)))
mtcars %>%
  select(wt, gear, everything()) #this select by the snames and then sort the names by wt then gear then everythign rearranging by that

mtcars %>% 
  group_by(gear) %>%
  summarise(avg_wt = mean(wt)) #tis will group the variables by some category and then give you a new tibble by whaterer you put
#as the data ie avg_wt = mean(wt) will create a coloum avg_wt which is composed of the mean of (wt) in mtcars and do this for each 
#category of gear 

mtcars %>% 
  group_by(am) %>%
  summarise(avg_wt = mean(wt))

mtcars %>%
  group_by(gear, vs) %>% #this will now group by multiple things and give every option or combination of these variables
  summarise( #then summarise whatever we want ie mean and median for each of these groups 
    avg_wt = mean(wt),
    med_wt = median(wt) 
  )

#pivoting 

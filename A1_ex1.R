library(tidyverse)
#excercise 1
#question 1
X <- read.csv(file = "A1_Ex1.csv")
X
#question 2
str(X)
#question 3
X %>% 
  summarise(total = sum(expenditure))
#question 4
X %>% 
  filter(month == "Mar") %>% 
  summarise(total = sum(expenditure))
#question 5 
X %>% 
  filter(month == "Mar", weather == "cloudy") %>% 
  summarise(total = sum(expenditure))
#question 6
temp = 0
for(i in X$expenditure-1){ #run a for loop to find highest expenditure
  if(X$expenditure[i]>temp){
    temp <- X$expenditure[i] #store highest expenditure as a double
  }
}
temp
X %>% 
  filter(expenditure == temp) %>% #filter data by row with highest expenditure
  select(month) #extract the month of highest expenditure


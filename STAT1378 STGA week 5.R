library(tidyverse)
library(glue)
library(babynames)

#week 4 part 3 q 2
babynames %>%
  group_by(sex,year) %>%
  arrange(desc(n))
#q3
babynames %>%
  filter(sex == "F", year == 2017) %>%
  select(name, n) %>%
  arrange(desc(n))

table4a_long <- table4a %>%
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
table4a_long
table4a_long %>%
  pivot_wider(values_from = cases, names_from = year)

dat <- tibble(oat_bran_free = c(4.61, 5.42, 5.40, 4.54, 3.98),
              oat_bran = c(3.64, 5.57, 4.85, 4.80, 3.68))
dat_long <- dat %>%
  pivot_longer(c('oat_bran_free','oat_bran'))
dat_long


# barplot
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut)) #this maps the x axis as cut and y is count of cut

ggplot(data = pressure) + #this will use the data pressure and the x will be temp and show its effect on pressure
  geom_col(mapping = aes(x = temperature, y = pressure))

ggplot(data = diamonds) + #same as the first but colours by the cut
geom_bar(mapping = aes(x = cut, colour = cut))

ggplot(data = diamonds) + #fills by cut same as previous but fills instead of highlights
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) + colours fill by the clarity
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamonds) +#by using position by dodge it can split up the cuts by clarity
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(clarity ~ cut)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(~cut)

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color)) +
  facet_grid(clarity ~ .)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = color, fill = cut)) +
  facet_wrap(~cut, scales = "free_y")

ggplot(data = pressure) +
  geom_col(mapping = aes(x = temperature, y = pressure))
ggplot(data = pressure) +
  geom_col(mapping = aes(x = temperature, y = pressure))
ggplot(data = diamonds)+
    geom_col(mapping = aes(x= color, fill = cut))

luke <- babynames %>%
  filter(name == "Luke", sex == "M")
  ggplot(data = luke)+
  geom_line(mapping = aes(x = year, y = n))

  #q3
  library(tidyverse)
frog <- read.csv(file = "frog_signal.csv")
frog
frog %>% 
  mutate(standardtotal = Standard1 + Standard2 + Standard3)

a1 <- frog %>% 
  filter(FirstPresented == "Alternative")
mean(a1)



#Week 5
#we ar going to use purr and map to replace for loops in repetative tasks 

negatives <- list(-25, -31, -111)
map(negatives, abs)
list1 <- list(1, 2, 3, 4, 5)
map(list1, log)
list1 %>% #you can pipe list 1 then map fucntions such as log and round to every element in list1 
map(log) %>%
map(round)

list1 %>%
  map(log) %>%
  map(round, digits = 2)
# changing output format
map_dbl(list1, log) #map_dbl will change the output format to a double ie an atomic vector 

x <- matrix(1:100, nrow = 25, ncol = 4)
## for: summing rows
rowsum <- vector(length = 25)
for (i in 1:25) {
  rowsum[i] <- sum(x[i, ])
}
rowsum
# solving it one time
.x <- 1
sum(x[.x, ])
# generalises it with map family and ~
map(1:25, ~ sum(x[.x, ]))
# putting it to a different/more appropriate output format
map_dbl(1:25, ~ sum(x[.x, ]))
## for: summing columns
colsum <- vector(length = 4)
for (j in 1:4) {
  colsum[j] <- sum(x[, j])
}
colsum
map_dbl(1:4, ~ sum(x[, .x]))
## summing squared rows
sq_sum <- vector(length = 25)
for (i in 1:25) {
  colsum[i] <- sum(x[i, ]ˆ2)
}
colsum
map_dbl(1:25, ~ sum(x[.x, ]ˆ2))
x <- list(x1 = 1:5, x2 = 11:15, x3 = c("a", "b", "c"))
map(x, ~
      glue("This slot is of {length(.x)} and class {glue_collapse(class(.x), ', ', last = ' and ')}."))
set.seed(1024)
map_dfc(x, ~ rnorm(6, mean = length(.x), sd = 1))
set.seed(1024)
map(x, length) %>%
  map_dfc(rnorm, n = 6)
set.seed(1024)
# why this doesn't work?
map_dfc(x, ~ rnorm(length(.x)))
# and how would you fix it?
?map_dfc

#1
library(stringr)
strings <- list("Mary", "John", "Jill")
map_chr(strings, str_sub, start = 1, end = 1) #used map_dbl but data are strings need map_chr

ldeaths
ldeaths %>% 
map

## apply: summing rows
x <- matrix(1:100, nrow = 25, ncol = 4)
rowsum <- apply(x, MARGIN = 1, sum)
rowsum
apply(x, 1, sum)
## apply: summing columns
colsum <- apply(x, MARGIN = 2, sum)
colsum
apply(x, 2, sum)
sumsq <- function(x) sum(xˆ2)
rowsumsquare <- apply(x, 1, sumsq)
rowsumsquare
## apply: summing squared rows with in-line anonymous function
rowsumsquare <- apply(x, 1, function(irow) sum(irowˆ2))
rowsumsquare
x <- list(x1 = 1:5, x2 = 11:15, x3 = c("a", "b", "c"))
#
length_and_class_2 <- function(x) {
  paste(
    "This slot is of length",
    length(x), "and class",
    paste(class(x), collapse = ", ")
  )
}
ll <- sapply(x, length_and_class_2)
ll
3
2. Research and find solutions to the following problems
class(ll)
#
my_rnd_generator_1 <- function(x) rnorm(6, mean = length(x), sd = 1)
ll1 <- sapply(x, my_rnd_generator_1)
ll1
class(ll1)
#
my_rnd_generator_2 <- function(x) rnorm(length(x), mean = 0, sd = 1)
ll2 <- sapply(x, my_rnd_generator_2)
ll2
class(ll2)
install.packages(c("devtools", "roxygen2","testthat","knitr"))
library(devtools)
has_devel()

#all r packages require your code and documentations to be organised according to specific rules theres a fucntion to create the required folder structure 
# usethis::create_package("~/desktop/praiseme") use this command if you havnt changed direory 
usethis::create_package("praiseme") #this one if you have changed the directory 
#' Title
#'
#' @param name 
#' @param punctuation 
#'
#' @return
#' @export
#'
#' @examples
praise <- function(name, punctuation = "!"){
  glue::glue("You're the best, {name}{punctuation}")
}
praise("Thomas")
devtools::document()
usethis::use_r("praise") #creates a new r file as praise 

#to modify praise r we need to entere the praise function into the file 
praise <-  function(name, punctuation = "!")
  
  devtools::load_all() #normally we need to run the funciton at leasst once in the ocnsole for it to be defined like doing
#libaray(tidyverse) but with devtools::load_all() you can load all the functions in the package 

devtools::check() #once the package is more complicated we can check if it follows all the required cran rules the aims to get 
#zero warnings notes or errors. Check frequently so you can locate the problems early rathe rthan having to continuously isolate
#everything to narrow down the error if you do it at the end 

#the package needs special R documentation. Instead of creating these files manually, we will write a specially formated comment
#above praise(). and let the package roxygen2 to handle the creation of the help file 

#put the cursor inside the pariase fucntions {} and then go to the menu bar and do coe > insdert roxygen skeleton 

?praise 

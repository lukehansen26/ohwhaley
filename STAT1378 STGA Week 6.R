library(testthat) # loading the package
expect_equal(5*2, 10)
expect_equal(5*2, 10+ 1e-7)
expect_equal(5*2, 10+ 1e-6) #these are used to test if the expected output of the code you put in it
expect_identical(2*2, 4+ 1e-8)#matches with the output you want it to be
#it will not throw an error if its true otherwise it will thow the error

m <- function(x,y){
  return(x*y)
}
expect_error(m("2","3"), "non-numeric argument to binary operator")
expect_equal(m(2,3), 6)
expect_equal(m(2,c(2,3)), c(4,6))
expect_error(m(2,"3"), "non-numeric argument to binary operator")

is_greater_10 <- function(x){
  if (x > 10) "Not greater than 10"
}
expect_null(is_greater_10(9))
expect_identical(is_greater_10(11), "Not greater than 10")

usethis::create_package("ohwhaley")


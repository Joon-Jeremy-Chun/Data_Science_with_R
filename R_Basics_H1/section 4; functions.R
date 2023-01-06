#Objectives: How to create functions? The R function, called 'function()' use for defining a bew function.

# example of defining a function to compute the average of a vector x
avg <- function(x){ 
  s <- sum(x) 
  n <- length(x)
  s/n
  }

# we see that the above function and the pre-built R mean() function are identical
x <- -10000:10000
identical(mean(x), avg(x))
#Outcome: TURE

# variables inside a function are not defined in the workspace
s <- 3
avg(1:10)
#Outcome:5.5
s
#Outcome:3


# functions can have multiple arguments as well as default values
avg <- function(x, arithmetic = TRUE){
  n <- length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}

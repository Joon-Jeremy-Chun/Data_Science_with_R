#Objectives: How to create functions? The R function, called 'function()' use for defining a bew function.

# example of defining a function to compute the average of a vector x
avg <- function(x){ 
  s <- sum(x) 
  n <- length(x)
  s/n
  }

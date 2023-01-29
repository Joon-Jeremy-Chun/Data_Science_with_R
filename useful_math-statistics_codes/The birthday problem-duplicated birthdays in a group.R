# checking for duplicated birthdays in one 50 person group
library(tidyverse)

n <- 50
bdays <- sample(1:365, n, replace = TRUE)    # generate n random birthdays
any(duplicated(bdays))    # check if any birthdays are duplicated
#[1] TRUE <- however, it depend on the chance

# Monte Carlo simulation with B=10000 replicates
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)    # calculates proportion of groups with duplicated birthdays
#[1] 0.9714 <- this is the chance


#What about 25 people in the group
n <- 25
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)
#[1] 0.5773

#Try to find a number of members for a group which gives half probability in duplicated birthday. 
#What about 22 people in the group
n <- 22
B <- 10000
results <- replicate(B, {    # returns vector of B logical values
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)
#[1] 0.4707


#In order to find probability of each n (1:60)

#Defining birthday function

birthday_prob <- function(x,B) {
  n <- x
  b <- B
  prob <- replicate(b, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  y <- mean(prob)
  print(y)
}
birthday_prob(22,1000)
# [1] 0.483

#Using the function 'aspply' to safe the results(the probability) 
birthday_prob_2 <- function(x) {
  n <- x
  b <- 10000
  prob <- replicate(b, {
    bdays <- sample(1:365, n, replace = TRUE)
    any(duplicated(bdays))
  })
  y <- mean(prob)
  print(y)
}

n <- seq(1,60)
prob <- sapply(n, birthday_prob_2)
qplot(n, prob)

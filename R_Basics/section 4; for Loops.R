#Objectives: To know about 'for loops.'
#We can use them when the same task over and over 'while changing the variable.'
library(dslabs)

# creating a function that computes the sum of integers 1 through n
compute_s_n <- function(n){
  x <- 1:n
  sum(x)
}

# a very simple for-loop
for(i in 1:3){
  print(i)
}
#Outcome:
#1
#2
#3

# a for-loop for our summation
# the sum of integers 1through n. We want to have that process for n over 1 to 50
m <- 50
#create an empty vector
s_n <- vector(length = m) 
for(n in 1:m){
  s_n[n] <- compute_s_n(n)
}

# creating a plot for our summation function
n <- 1:m
plot(n, s_n)
#Outcome:a plot

# a table of values comparing our function to the summation formula
head(data.frame(s_n = s_n, formula = n*(n+1)/2))
#Outcome: a table

# overlaying our function with the summation formula
plot(n, s_n)
lines(n, n*(n+1)/2)
#Outcome: a plot with a line on them


#For the previous question
library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 100000){print(murders$state[ind])} else{print("No state has a murder rate that low.")}
#'Outcome:"Vermont"'

#!1:length(murder_rate) or seq(length(murder_rate))
for(i in seq(length(murder_rate))){
  if(murder_rate[i] < 0.75){print(murders$state[i])}
}
# Outcome;
# [1] "Hawaii"
# [1] "Iowa"
# [1] "New Hampshire"
# [1] "North Dakota"
# [1] "Vermont"
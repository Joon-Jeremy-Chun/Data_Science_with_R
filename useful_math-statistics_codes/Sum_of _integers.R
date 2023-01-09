#Sum of integers formula S = [n(n+1)]/2
library(dslabs)
#creating a function that computes the sum of integers 1 through n
sum_n <- function(n){
  x <- 1:n
  sum(x)
}

#compute multiple equations for-loop

# a very simple for-loop
for(i in 1:3){
  print(i)
}
#Outcome:
#1
#2
#3

# a for-loop for our summation
# the sum of integers 1through n. We want to have that process for n over 1 to 100
m <- 100
#create an empty vector
s_n <- vector(length = m) 
for(n in 1:m){
  s_n[n] <- sum_n(n)
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


#creating a function that computes the sum of integers 1 through n^2
sum_n_p2 <- function(n){
  x <- 1:n
  n_p2 <- x^2
  sum(n_p2)
}

sum_n_p2(10)
#Outcome:385
k <- 10
(k*(k+1)*(2*k+1))/6
#Outcome:385

# Double checking with the graph
# overlaying our function with the summation formula
e <- 10
s_n_p2 <- vector(length = e)
for(i in 1:e){
  s_n_p2[i] <- sum_n_p2(i)
}

plot(1:e, s_n_p2)

lines(n, (n*(n+1)*(2*n+1))/6)
#Outcome: a plot with a line on them


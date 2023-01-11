# Types of data
# Categorical data; Ordinal categorical data or Non-ordinal categorical data
# Numerical data; Continuous variables or Discrete variables

library(tidyverse)
library(dslabs)
data(heights)

#make a table of category proportions
prop.table(table(heights$sex))
#Outcome: table; Female and Male proportions


# define x as vector of male heights
index <- heights$sex=="Male"
x <- heights$height[index]

# calculate the mean and standard deviation manually
# length(x) is the number of x-s
average <- sum(x)/length(x)   
SD <- sqrt(sum(((x - average)^2)/length(x)))
print(average)
print(SD)
#Outcome:69.31475
#Outcome:3.608799

# built-in mean and sd functions - note that the audio and printed values disagree
average <- mean(x)
SD <- sd(x)
c(average = average, SD = SD)
#Outcome: average, SD table

# calculate standard units
z <- scale(x)

# calculate proportion of values within 2 SD of mean
mean(abs(z) < 2)
#Outcome:0.9495074 ~ 0.95
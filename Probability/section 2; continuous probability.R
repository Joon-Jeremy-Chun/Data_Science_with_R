#Objectives:
#The cumulative distribution function (CDF) is a distribution function for continuous data  that reports the proportion of the data below x for all values of x :

#Code: Cumulative distribution function
#Define x as male heights from the dslabs dataset:
  
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)

#Given a vector x, we can define a function for computing the CDF of x using:
  
F <- function(a) mean(x <= a)

# probability of male taller than 70 inches

1 - F(70)    
# [1] 0.3768473
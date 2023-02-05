#Objectives:
#The cumulative distribution function (CDF) is a distribution function for continuous data  that reports the proportion of the data below x for all values of x :

#Code: Cumulative distribution function
#Define x as male heights from the dslabs dataset:
  
library(tidyverse)
library(dslabs)
data(heights)
x <- heights %>% filter(sex=="Male") %>% pull(height)
x
# num [1:812]

#Given a vector x, we can define a function for computing the CDF of x using:
  
F <- function(a) mean(x <= a) 
#mean function of x; how many x's over all by given '<= a'


#The probability of male taller than 70 inches
1 - F(70)    
#[1] 0.3768473

#(Checking)The probability of male taller than 1 inches and smaller then 70
F(70) - F(0) 
#[1] 0.6231527
0.3768473+0.6231527
#[1] 1

#The probability of male taller than 62 inches and smaller then 72 inches
F(72) - F(62)
#[1] 0.8103448

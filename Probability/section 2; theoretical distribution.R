#Objectives; 
#To understand the normal distribution

library(tidyverse)
library(dslabs)
data(heights)


x <- heights %>% filter(sex == "Male") %>% pull(height)
#In R, 'pnorm()' function define F(a) = pnorm(a, m, s); m <- mean, s <- sd
m <- mean(x)
s <- sd(x)
1 - pnorm(70.5, m, s)
#[1] 0.371369

#The normal distribution will be the same(or close) with the actual 'theoretically'.
F <- function(a) mean(x <= a)
1 - F(70.5)
#[1] 0.3633005


#The normal distribution well approximating in some intervals:
mean(x <= 68.5) - mean(x <= 67.5)
#[1] 0.114532
mean(x <= 69.5) - mean(x <= 68.5)
#[1] 0.1194581
mean(x <= 70.5) - mean(x <= 69.5)
#[1] 0.1219212

pnorm(68.5, m, s) - pnorm(67.5, m, s)
#[1] 0.1031077
pnorm(69.5, m, s) - pnorm(68.5, m, s)
#[1] 0.1097121
pnorm(70.5, m, s) - pnorm(69.5, m, s)
#[1] 0.1081743

#But, the approximation is not as useful for other intervals.
a <- 75
b <- 74
mean(x <= a) - mean(x <= b)
#[1] 0.02955665
pnorm(a, m, s) - pnorm(b, m, s)
#[1] 0.03953645

#Mathematical reasoning
#Seems it tends to increase the errs goes to each side of the population.
#I believe the uncertainty will increase when the number of sample decrease.
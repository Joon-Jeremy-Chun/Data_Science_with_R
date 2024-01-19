#Note from the textbook:
#There are two different regression lines depending on whether we are taking the expectation of Y given X or taking the expectation of X given Y.

library(tidyverse)
library(HistData)
data("GaltonFamilies")
set.seed(1983)

#the data set
galton_heights <- GaltonFamilies %>%
  filter(gender == "male") %>%
  group_by(family) %>%
  sample_n(1) %>%
  ungroup() %>%
  select(father, childHeight) %>%
  rename(son = childHeight)

# compute a regression line to predict the son's height from the father's height
mu_x <- mean(galton_heights$father)
mu_y <- mean(galton_heights$son)
s_x <- sd(galton_heights$father)
s_y <- sd(galton_heights$son)
r <- cor(galton_heights$father, galton_heights$son)

m1 <- r * s_y / s_x
b1 <- mu_y - m1*mu_x

# compute a regression line to predict the father's height from the son's height
m2 <-  r * s_x / s_y
b <- mu_x - m2*mu_y

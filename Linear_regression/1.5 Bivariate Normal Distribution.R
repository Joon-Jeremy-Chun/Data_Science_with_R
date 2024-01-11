#Note from the textbook:
#When a pair of random variables are approximated by the bivariate normal distribution, scatterplots look like ovals.
#They can be thin (high correlation) or circle-shaped (no correlation)
#When two variables follow a bivariate normal distribution, computing the regression line is equivalent to computing conditional expectations.
#We can obtain a much more stable estimate of the conditional expectation by finding the regression line and using it to make predictions.

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

#
galton_heights %>% 
  mutate(z_father = round((father - mean(father))/sd(father))) %>%
  filter(z_father %in% -2:2) %>%
  ggplot() +
  stat_qq(aes(sample = son)) +
  facet_wrap(~z_father)

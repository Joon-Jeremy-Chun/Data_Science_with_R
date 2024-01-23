set.seed(1989, sample.kind="Rounding")
library(tidyverse)
library(HistData)
data("GaltonFamilies")

female_heights <- GaltonFamilies %>%     
  filter(gender == "female") %>%     
  group_by(family) %>%     
  sample_n(1) %>%     
  ungroup() %>%     
  select(mother, childHeight) %>%     
  rename(daughter = childHeight)

#means and standard deviations
female_heights %>% summarize(mean(mother), sd(mother), mean(daughter), sd(daughter))

#Outcome:
# # A tibble: 1 × 4
# `mean(mother)` `sd(mother)` `mean(daughter)` `sd(daughter)`
# <dbl>        <dbl>            <dbl>          <dbl>
#   1           64.1         2.29             64.3           2.39

#correlation coefficient mothers and daughters
female_heights %>% summarize(cor(mother, daughter))

#Outcome:
# A tibble: 1 × 1
# `cor(mother, daughter)`
# <dbl>
#   1                   0.325

#Calculate the slope of regression line and intercept of regression line

mu_x <- mean(female_heights$mother)
mu_y <- mean(female_heights$daughter)
s_x <- sd(female_heights$mother)
s_y <- sd(female_heights$daughter)
r <- cor(female_heights$mother , female_heights$daughter)
m <- r * s_y / s_x 
b <- mu_y - m *mu_x

# a mother has a height of 60 inches. What is the conditional expected value of her daughter's height given the mother's height?
x <- 60
y <- m * x + b
r2 <- r**2

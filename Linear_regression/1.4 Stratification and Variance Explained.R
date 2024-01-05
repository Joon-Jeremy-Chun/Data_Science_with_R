#Note from the textbook:
#1.The general idea of conditional expectation is that we stratify a population into groups and compute summaries in each group.
#2.A practical way to improve the estimates of the conditional expectations is to define strata of similar values of X.
#3.If there is perfect correlation, the regression line predicts an increase that is the same number of SDs for both variables.
#IF there is 0 correlation, then we don't use X at all for the prediction and simply predict the average Mu_y.
#For values between 0 and 1, the prediction is somewhere in between. If the correlation is negative, we predict a reduction instead of an increase.

#Intercept is zero and slope is Rho when variables are standardized

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

# number of father with height 72 or 72.5 inches
sum(galton_heights$father == 72)
# Outcome:8
sum(galton_heights$father == 72.5)
# Outcome:1

#predicted height of a son with a 72 inch tall father
conditional_avg <- galton_heights %>%
  filter(round(father) == 72) %>%
  summarize(avg = mean(son)) %>%
  pull(avg)
conditional_avg
#Outcome: [1] 70.5

#stratify fathers' heights to make a boxplot of son heights
galton_heights %>% mutate(father_strata = factor(round(father))) %>%
  ggplot(aes(father_strata, son)) +
  geom_boxplot() +
  geom_point()

#center of each boxplot
galton_heights %>%
  mutate(father = round(father)) %>%
  group_by(father) %>%
  summarize(son_conditional_avg = mean(son)) %>%
  ggplot(aes(father, son_conditional_avg)) +
  geom_point()

# add regression line to standardized data
r <- galton_heights %>% summarize( r =  cor(father, son)) %>% pull(r)

galton_heights %>%
  mutate(father = scale(father), son = scale(son)) %>%
  mutate(father = round(father)) %>%
  group_by(father) %>%
  summarize(son = mean(son)) %>%
  ggplot(aes(father, son)) +
  geom_point() +
  geom_abline(intercept = 0, slope = r)

#See the difference only in the units
#add regression line to original data (before standardized)
mu_x <- mean(galton_heights$father)
mu_y <- mean(galton_heights$son)
s_x <- sd(galton_heights$father)
s_y <- sd(galton_heights$son)
r2 <- cor(galton_heights$father, galton_heights$son)
m <- r2 * s_y/s_x
b <- mu_y - m*mu_x

galton_heights %>%
  ggplot(aes(father, son)) +
  geom_point(alpha = 0.5) +
  geom_abline(intercept = b, slope = m)

#plot in standard units and see that intercept is 0 and slope is rho (after standardized)
galton_heights %>%
  ggplot(aes(scale(father), scale(son))) +
  geom_point(alpha = 0.5) +
  geom_abline(intercept = 0, slope = r2)

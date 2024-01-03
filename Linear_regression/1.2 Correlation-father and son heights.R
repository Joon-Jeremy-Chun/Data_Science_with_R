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

#means and standard deviations
galton_heights %>%
  summarize(mean(father), sd(father), mean(son), sd(son))

#Output:
# A tibble: 1 × 4
# `mean(father)` `sd(father)` `mean(son)` `sd(son)`
# <dbl>        <dbl>       <dbl>     <dbl>
#   1           69.1         2.55        69.2      2.71

#scatterplot of father and son heights
galton_heights %>%
  ggplot(aes(father, son)) +
  geom_point(alpha = 0.5)

#father-son correlation
galton_heights %>% summarize(cor(father, son))
# A tibble: 1 × 1
# `cor(father, son)`
# <dbl>
#   1              0.433

#key note(from the textbook): 
#The correlation that we compute and use as summary is a random variable.
#When interpreting correlations, it is important to remember that correlations derived from samples are estimates containing uncertainty.
#Because the sample correlation is an average of independent draws, the central limit theorem applies.

#compute sample correlation
my_sample <- slice_sample(galton_heights, n =25, replace = TRUE)

R <- my_sample %>% summarize(cor(father, son))

# Monte Carlo simulation to show distribution of sample correlation
B <- 1000
N <- 25
R <- replicate(B, {
  slice_sample(galton_heights, n = N, replace = TRUE) %>% summarize(r = cor(father, son)) %>% .$r
})

data.frame(R) %>% ggplot(aes(R)) + geom_histogram(binwidth = 0.05, color = "black")

# expected value is the population correlation
mean (R)
#Output:[1] 0.4291816

# standard error is high relative to its size
sd (R)
#Output:[1] 0.1663783

#qq-plot to evaluate whether N is large enough
data.frame(R) %>%
  ggplot(aes(sample = R)) +
  stat_qq() +
  geom_abline(intercept = mean(R), slope = sqrt((1-mean(R)^2)/(N-2)))

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

# means and standard deviations
galton_heights %>%
  summarize(mean(father), sd(father), mean(son), sd(son))

#Output:
# A tibble: 1 × 4
# `mean(father)` `sd(father)` `mean(son)` `sd(son)`
# <dbl>        <dbl>       <dbl>     <dbl>
#   1           69.1         2.55        69.2      2.71

# scatterplot of father and son heights
galton_heights %>%
  ggplot(aes(father, son)) +
  geom_point(alpha = 0.5)

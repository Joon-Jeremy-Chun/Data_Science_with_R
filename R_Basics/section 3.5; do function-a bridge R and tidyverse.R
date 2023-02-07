#Introduction to DATA SCIENCE, Rafael A., p.70
#Most R functions do not recognize grouped tibbles nor do they return data frames.
#The do function serves as a bridge between R functions such as quantile and the tidyvers.
#The do function understands grouped tibbles and always returns a data frame.

library(dslabs)
library(dplyr)
data(heights)

heights %>%
  filter(sex == "Female") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))
# range
# 1 51.00000
# 2 64.98031
# 3 79.00000


#First we have to write a function that fits into the tidyverse approach: that is, it receives a data frame and returns a data frame.
my_summary <- function(dat){
  x <- quantile(dat$height, c(0, 0.5, 1))
  tibble(min = x[1], median = x[2], max = x[3])
}

my_summary(heights)
# # A tibble: 1 × 3
#       min median   max
#      <dbl>  <dbl> <dbl>
#   1    50   68.5  82.7

#We can now apply the function to the heights dataset to obtain the summaries:
heights %>%
  group_by(sex) %>%
  my_summary
# # A tibble: 1 × 3
#       min median   max
#      <dbl>  <dbl> <dbl>
#   1    50   68.5  82.7

#But this is not what we want. We want a summary for each sex and the code returned just one summary.
#This is because my_summary is not part of the tidyvers and does not know how to handled grouped tibbles.
#do makes this connection:
heights %>%
  group_by(sex) %>%
  do(my_summary(.))
# # A tibble: 2 × 4
# # Groups:   sex [2]
#   sex      min median   max
#   <fct>  <dbl>  <dbl> <dbl>
# 1 Female    51   65.0  79  
# 2 Male      50   69    82.7

#From text book, p.245
#Important distinction and connection between the distribution of a list of numbers and a probability distribution.

library(tidyverse)
library(dslabs)
data(heights)


x <- heights %>% filter(sex == "Male") %>% pull(height)


#A straightforward definition m and sd of the list of numbers x:
m <- sum(x) / length(x)
s <- sqrt(sum((x-m)^2) / length(x))


#A random variable X has a distribution function. To define this, we do not need a list of numbers.
#It is a theoretical concept. In this case, we define the distribution as the F(a) that answer the question:
#What is the probability that X is less than or equal to a? There is no list of numbers.


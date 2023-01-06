#Objectives; To know how to create plots, histogram, and boxplots

library(dslabs)
library(dplyr)
data("murders")

murders <- mutate(murders, rate = total / population * 100000)

# a simple scatterplot of total murders versus population
x <- murders$population / 10^6
y <- murders$total
plot(x, y)
#Outcome: plots

# a histogram of murder rates
hist(murders$rate)
#Outcome: histogram

# boxplots of murder rates by region
boxplot(rate~region, data = murders)
#Outcome: boxplots
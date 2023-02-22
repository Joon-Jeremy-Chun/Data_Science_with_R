#Objectives; 
#What is the reasonable interest rates?
#given; 1000loans for $180,000 this year. 2% of clients will probably default. The bank will loses $200,000 per foreclosure.
#*clients default independently each*
library(ggplot2)
library(dplyr)

n <- 1000
loss_per_foreclosure <- -200000
p <- 0.02
defaults <- sample( c(0,1), n, prob=c(1-p, p), replace = TRUE)

#Total losing in condition
sum(defaults * loss_per_foreclosure)
#[1] -4200000
#[1] -5200000
# it is random variable

#The average of the total losing in condition
n*loss_per_foreclosure*p
#[1] -4e+06


#Monte Carlo simulation
B <- 100000
losses <- replicate(B, {
  defaults <- sample( c(0,1), n, prob=c(1-p, p), replace = TRUE)
  sum(defaults * loss_per_foreclosure)
})

data.frame(losses/10^6) %>% ggplot(aes(losses)) + geom_histogram(color = "black", binwidth = 1*10^5)

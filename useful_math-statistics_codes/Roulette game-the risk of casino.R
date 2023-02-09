#Find the chance that the casino's total risks (Ex <= $0). with Monty Carlo simulations


#define roulette
color <- rep(c("Black", "Red", "Green"), c(18, 18, 2))

#Let's say 1000 people play on the game. The casino loss $-1 for Red and $+1 for otherwise.
n <- 1000
X <- sample(ifelse(color == "Red", -1, 1), n, replace = TRUE)
X[0:10]
#[1] -1  1  1  1  1 -1  1 -1 -1  1

#We call above a sampling model


#Total gain or loss a day
sum(X)
#[1] 26

#expectation of gain or loss.(B days, lage enough)
#and the probability that the casino gain 0 or negative gaining.
n <- 1000
B <- 10000
roulette_gains <- function(n){
  X <- sample(ifelse(color == "Red", -1, 1), n, replace = TRUE)
  sum(X)
}
roulette_gains(n)
#[1] 48
roulette_gains(n)
#[1] 42

S <- replicate(B, roulette_gains(n))
mean(S)
#[1] 52.8174
#Double check!
10/19*1*1000+9/19*(-1)*1000
#[1] 52.63158

#Find the chance of a day that casino gain 0 or less.
mean(S <= 0)
#[1] 0.049

365*0.049
#[1] 17.885
# Around only 18 days the casino going to loss the game.

#In other words, in average, players expected to loss money in 347 days.
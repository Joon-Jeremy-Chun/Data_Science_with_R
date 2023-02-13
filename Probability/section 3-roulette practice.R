#--roulette practice
# five pockets  roulette;(00, 0, 1, 2, 3) of 38. the bet pays 6 to 1; win +6 loss -1
#expectation for one bet
38-5-2
m <- 5/38*6 + (38-5)/38*(-1)
#[1] 1.210526

#define roulette
#black for win
color <- rep(c("Black", "Red", "Green"), c(5, 32, 2))

#standard err for one bet
abs(6 --1) * sqrt(5/38 * (38-5)/38)
#[1] 2.366227
#(need think this way) why not mach with?
sqrt((6 - m)^2*5/38 + ((-1) - m)^2*32/38)
#[1] 2.361505

# 500 bet
n <- 500
X <- sample(ifelse(color == "Black", 6, -1), n, replace = TRUE)
X[0:10]
#[1] -1  6 -1 -1 -1 -1 -1 -1 -1 -1

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

p <- 1/5

1-p

a <- 1
b <- -0.25

a*p+b*(1-p)

abs(b-a)*sqrt(p*(1-p))

sqrt(44)*abs(b-a)*sqrt(p*(1-p))

m <- a*p+b*(1-p)
sd <- sqrt(44)*abs(b-a)*sqrt(p*(1-p))
1-pnorm(8, m, sd)

set.seed(21, sample.kind = "Rounding")

B <- 10000
S <- function(){
  test_a <- sample(5, 44, replace = TRUE)
  test_c <- sample(5, 44, replace = TRUE)
  ifelse(test_a == test_c, 1, -0.25)
  }
S()

Y <- replicate(B, S())
sum(Y)/length(Y)


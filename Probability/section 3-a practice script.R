#There are 44 questions of five multiple chose. one mark for correct and -0.25 for incorrect marks. 
p <- 1/5

1-p

a <- 1
b <- -0.25

#let's say a person how do pick the all questions randomly
#find expectation
a*p+b*(1-p)

#find sd
abs(b-a)*sqrt(p*(1-p))

sqrt(44)*abs(b-a)*sqrt(p*(1-p))

m <- a*p+b*(1-p)
sd <- sqrt(44)*abs(b-a)*sqrt(p*(1-p))

#the chance that get 8 or more
1-pnorm(8, m, sd)
#[1] 0.007930666

#What a chance that 10000 students done this and the proportions of the students who gets 8 or more
set.seed(21, sample.kind = "Rounding")

B <- 10000
S <- function(){
  test_a <- sample(5, 44, replace = TRUE)
  test_c <- sample(5, 44, replace = TRUE)
  ifelse(test_a == test_c, 1, -0.25)
  }
S()
sum(S())
Y <- replicate(B, sum(S()))
Z <- ifelse(Y >= 8, 1, 0)
sum(Z) / length(Z)
#[1] 0.0078


#Suppose the number of the option is 4 what is the expectation and no penalty for guessing?
P <- 1/4
n <- 44
Ex <- n*1*P -n*0*(1-P) 
Ex
#[1] 11

#Using the normal approximation, scoring over 30 when guessing?
SD <- sqrt(44)*abs(0-1)*sqrt(P*(1-P))

1-pnorm(30, Ex, SD)
#[1] 1.85838e-11
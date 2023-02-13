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
SD
#[1] 2.872281

1-pnorm(30, Ex, SD)
#[1] 1.85838e-11

#correct answer p following and find the lowest p for scoring over 35 exceeds 80percents?
p <- seq(0.25, 0.95, 0.05)
p
#[1] 0.25 0.30 0.35 0.40 0.45 0.50 0.55 0.60 0.65 0.70 0.75 0.80 0.85 0.90 0.95
n <- 44
Ex <- n*1*p -n*0*(1-p) 
Ex
#[1] 11.0 13.2 15.4 17.6 19.8 22.0 24.2 26.4 28.6 30.8 33.0 35.2 37.4 39.6 41.8

SD <- sqrt(44)*abs(0-1)*sqrt(p*(1-p))
SD
#[1] 2.872281 3.039737 3.163858 3.249615 3.300000 3.316625 3.300000 3.249615 3.163858 3.039737 2.872281 2.653300 2.368544 1.989975 1.445683

pp <- 1-pnorm(35, Ex, SD)
pp
#[1] 0.000000e+00 3.704814e-13 2.914853e-10 4.290144e-08 2.051844e-06 4.433929e-05 5.325760e-04 4.066871e-03 2.154449e-02 8.353214e-02 2.431172e-01 5.300430e-01
#[13] 8.445370e-01 9.895998e-01 9.999987e-01
min(p[which(pp > 0.8)])

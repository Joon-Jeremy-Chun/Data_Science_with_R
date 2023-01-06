#Objectives: To understand following function; 'if-else statement', 'ifelse()', 'any()', and 'all()'

# an example showing the general structure of an if-else statement
a <- 0
if(a!=0){print(1/a)} else{print('No reciprocal for 0.')}
#Outcome:"No reciprocal for 0."

#other exmaple
b <- -1
c <- 10
if(b >= 0){print(sqrt(b))} else{print('x is out of domain.')}
#Outcome:"x is out of domain"
if(c >= 0){print(sqrt(c))} else{print('x is out of domain.')}
#Outcome:"3.162278"


# an example that tells us which states, if any, have a murder rate less than 0.5
library(dslabs)
data(murders)
murder_rate <- murders$total / murders$population*100000
ind <- which.min(murder_rate)
if(murder_rate[ind] < 0.5){print(murders$state[ind])} else{print("No state has murder rate that low")}
#Outcome:"Vermont"

if(murder_rate[ind] < 100000){print(murders$state[ind])} else{print("No state has murder rate that low")}
#Outcome:"Vermont"
#!!!Note: this simple if-else statement complete by the first element. If you want recall all elements should use with repeating algorithm.

if(murder_rate[ind] < 0.1){print(murders$state[ind])} else{print("No state has murder rate that low")}
#Outcome:"No state has murder rate that low"


#'ifelse()' function works similarly to and if-else conditional -> 'ifelse(condition, if ture, else)'
a <- c(0,1,2,-4,5)
result <- ifelse(a > 0, 1/a, NA)
print(result)
#Outcome:NA 1.0 0.5  NA 0.2

# the ifelse() function is also helpful for replacing missing values
data(na_example)
#Check the 'na_example' first
sum(is.na(na_example))
#Outcome:145

no_nas <- ifelse(is.na(na_example), 0, na_example) 
sum(is.na(no_nas))
#Outcome:0


# the any() and all() functions evaluate logical vectors
z <- c(TRUE, TRUE, FALSE)
any(z)
#Outcome:TRUE
all(z)
#Outcome:FALSE
#Objectives: To know operation of 'sort' and 'order'

library(dslabs)
data("murders")

# sort; sorts a vector in increasing order
sort(murders$total)

# order; it takes a vector as input and returns the vector of indexes that sort the input vector.
# simply 'order' function will creat new input vector (of indexes)
x <- c(3,5,1,2,4)
sort(x)
order(x)
index<-order(x)
x[index]

#... for example
ind <- order(murders$total)
murders$state[ind]

#max; the largest value, which.max; create the index of the largest value
max(murders$total)
x <- which.max(murders$total)
murders$state[x]

#rank; returns ranks smallest to largest
x <- c(3,4,5,1,2)
rank(x)

#data.frame
states <- murders$state
ranks <- rank(murders$population)
ind <- order(murders$population)
my_df <- data.frame(name = states[ind], rank =ranks[ind])
my_df

#NA(not available) & in.na funcion ; it is logical index tells which entries are NA
data(na_example)
mean(na_example)
ind<-is.na(na_example)
str(ind)
sum(ind)

#removing NAs with '!' operator
#example
x <- c(1, 2, 3)
ind_x <- c(FALSE, TRUE, FALSE)
x[ind_x]
x[!ind_x]

sum(!ind)
mean(na_example[!ind])

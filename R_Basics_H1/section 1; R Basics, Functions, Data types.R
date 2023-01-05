library(dslabs)
data(murders)
a<-1
b<-1
c<--1
d = 1

#recall the names of the function's local variables
ls()

#help("")
log
help("log")
args(log)

#data : to see all datasets 
data()

#to determine the type of objects 
class(murders)

#to see the structure of an objects
str(murders)

#Show the first five variables of objects(table)
head(murders)

#Reveal the names for each variables stored in objects
names(murders)

#The accessor : $, [[]]
murders$state
murders[["state"]]

#Identical ; TRUE, FALSE
identical(a,c)

#To show the categories for the factor
levels(murders$region)
levels(murders$abb)

# # of ~
nlevels(murders$region)

#Determin the number of the vriable in vector (or # of lows or clon)
length(murders$region)

# takes a vector as input and returns the frequency of each unique element in the vector.
x <- c("a", "a", "b", "b", "b", "c")
table(x)
table(murders$region)


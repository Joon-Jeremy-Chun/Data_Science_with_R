# 'concatenate' to entries by the function c
codes <- c(380,124,818)
# with out the quotes, R will recevid the codes as a variable
country <- c("italy","canada","egypt")


#assign name on vector 
#without quotes are find
codes <- c("litaly" = 380, "canada" = 124, egypt = 818)
class(codes)
names(codes)

codes <- c(380,124,818)
names(codes) <- country
codes

#sequences
seq(1,10,2)
seq(1,10,0.5)
#length.out;generate sequences that are increasing by the same amount but are of the prespecified length.
seq(1,10, length.out = 3)


#Subsetting: use square brackets
codes[2]
codes[c(1,3)]
codes[c(seq(1,2))]
#?
codes[c(seq(1,2,0.5))]
c(seq(1,3,2))
codes[c(seq(1,3,2))]

#Coercion; In general, coercion is an attempt by R to be flexible with data types.
x <- c(1,"canada",3)
x
class(x)

y<- 1:5
class(y)
z <- as.character(y)
class(z)
as.numeric(y)
#NA; not available
as.numeric(x)

#modifiy numeric to integer typ:The main difference is that integers occupy less space in the computer memory, so for big computations using integers can have a substantial impact.
class(3)
class(3L)
class(-3L)
class(0.5L)

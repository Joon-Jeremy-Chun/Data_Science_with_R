# Types of data
# Categorical data; Ordinal categorical data or Non-ordinal categorical data
# Numerical data; Continuous variables or Discrete variables

library(dslabs)
data(heights)

#make a table of category proportions
prop.table(table(heights$sex))
#Outcome: table; Female and Male proportions
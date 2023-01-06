#Objectives: To find states that have a lower murder rate.
#Knowing the usage the functions 'which()', 'match()', or '%in%'.

library(dslabs)
data("murders")

# defining murder rate as before
murder_rate <- murders$total / murders$population * 100000

# creating a logical vector that specifies if the murder rate in that state is less than or equal to 0.71
index <- murder_rate <= 0.71

# determining which states have murder rates less than or equal to 0.71
murders$state[index]

# calculating how many states have a murder rate less than or equal to 0.71
sum(index)
# the output is 5

# creating the two logical vectors representing our conditions
west <- murders$region == "West"
safe <- murder_rate <= 1

# defining an index and identifying states with both conditions true
index <- safe & west
murders$state[index]
# the output: "Hawaii"  "Idaho"   "Oregon"  "Utah"    "Wyoming"

# to determine the murder rate in Massachusetts we may do the following
ind <- which(murders$state == "Massachusetts")
murder_rate[ind]
# the output: 1.802179

# to obtain the indices and subsequent murder rates of New York, Florida, Texas, we do:
ind <- match(c("New York", "Florida", "Texas"), murders$state)
ind
#output:33 10 44
murder_rate[ind]
#output:2.667960 3.398069 3.201360

# to see if Boston, Dakota, and Washington are states
c("Boston", "Dakota", "Washington") %in% murders$state
#output:FALSE FALSE  TRUE
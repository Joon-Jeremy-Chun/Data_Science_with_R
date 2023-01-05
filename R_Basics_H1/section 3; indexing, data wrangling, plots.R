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
# the ouput; "Hawaii"  "Idaho"   "Oregon"  "Utah"    "Wyoming"
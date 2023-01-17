#An important application of the mean function
#Sampling- sample(); with and without replacement
#Monte Carlo simulations for categorical data


beads <- rep(c("red", "green"), times = c(3,6))
beads    # view beads object

sample(beads, 1)    # sample 1 bead at random
#Outcome: 'randomly' one from the sample

B <- 10000    # number of times to draw 1 bead
events <- replicate(B, sample(beads, 1))    # draw 1 bead, B times
tab <- table(events)    # make a table of outcome counts
tab    # view count table
#Outcome: table
#events
#green   red 
#6681  3319 
prop.table(tab)    # view table of outcome proportions
#Outcome: table
#events
#green    red 
#0.6681 0.3319 

#use of the mean function
beads

#To find probability for red beads
beads == "red"
#Outcome: *randomly ... FALSE (or) TRUE...
mean(beads == "red")
#Outcome:0.3333333

#When the mean function is applied, R coerces the logical values to numeric values, changing TRUE to 1 and FALSE to 0.

#sampling with replacement and without replacement

#sampling; with and without replacement
sample(beads,1)
#Outcome: *one random sample
sample(beads,9)
#Outcome: *respectively 9 samples
sample(beads,10)
#Error in sample.int(length(x), size, replace, prob) : 
#cannot take a sample larger than the population when 'replace = FALSE'

sample(beads, 10, replace = TRUE) # sampling with replacement
#Outcome: 10 random sample with replacement

#Checking
b_table<- replicate(10000, sample(beads, 10, replace = TRUE))
table(b_table)
#Outcome: *randomly but in the ratio
#green   red 
#66388 33612 
#Objectives and note;
#Pr(A)= probability of event A
#An important application of the mean function
#Sampling- sample(); with and without replacement


#Monte Carlo simulations for categorical data
beads <- rep(c("red", "blue"), times = c(9,6))    # create an urn with 9 red, 6 blue
beads    # view beads object

sample(beads, 1)    # sample 1 bead at random
#Outcome: 'randomly' one from the sample

B <- 10000    # number of times to draw 1 bead
events <- replicate(B, sample(beads, 1))    # draw 1 bead, B times
tab <- table(events)    # make a table of outcome counts
tab    # view count table
#Outcome: table
#events
#blue  red 
#3984 6016 
prop.table(tab)    # view table of outcome proportions
#Outcome: table
#events
#blue    red 
#0.3984 0.6016 

#use of the mean function
beads

#To find probability for blue beads
beads == "blue"
#Outcome: *randomly ... FALSE (or) TRUE...
mean(beads == "blue")
#Outcome:0.4

#When the mean function is applied, R coerces the logical values to numeric values, changing TRUE to 1 and FALSE to 0.


#sampling; with and without replacement
sample(beads,1)
#Outcome: *one random sample
sample(beads,15)
#Outcome: *respectively 15 samples
sample(beads,16)
#Error in sample.int(length(x), size, replace, prob) : 
#cannot take a sample larger than the population when 'replace = FALSE'

sample(beads, 16, replace = TRUE) # sampling with replacement

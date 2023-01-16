#Pr(A)= probability of event A

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
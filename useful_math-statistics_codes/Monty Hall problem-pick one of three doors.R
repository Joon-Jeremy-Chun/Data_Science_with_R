#Monty Hall was the host of a game show called "Let's Make a Deal."
#There are three doors and behind that doors; one car and two goats each.
#A player will choose one door first.
#The host will open the one of lost doors(goats)
#lastly let a player make a deal whither he/she can change his or her mind to choose anther door.

#Use Monte Carlo simulation

#define the function
monty_hall <- function(strategy){
  doors <- as.character(1:3)
  prize <- sample(c("car", "goat", "goat"))
  prize_door <- doors[prize == "car"]
  my_pick <- sample(doors, 1)
  show <- sample(doors[!doors %in% c(my_pick, prize_door)], 1)
  stick <- my_pick
  stick == prize_door
  switch <- doors[!doors %in% c(my_pick, show)]
  choice <- ifelse(strategy == "stick", stick, switch)
  choice == prize_door
}

#test it
monty_hall("stick")
#1] TRUE <- by chance

# replicate 100000 stick and switch
B <- 100000
stick <- replicate(B, monty_hall("stick"))
mean(stick)
#[1] 0.33289

switch <- replicate(B, monty_hall("switch"))
mean(switch)
#[1] 0.66894

#Mathematical reasoning
#The probability always depends on the given information.
#Most of the cases in statistic questions are based on the fixed given information
#But, for incidents, stock market, the information has been changing all the time
#In the case of the above, once you choose to switch the door, actually it is the same scenario that you choose "TWO doors" at first.
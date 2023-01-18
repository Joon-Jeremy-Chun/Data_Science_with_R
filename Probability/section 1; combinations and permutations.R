#Objectives; To know how to use:
#'paste' joins two strings and inserts a space in between.
#'expand.grid' gives the combinations of 2 vectors or lists.
#'permutations(n,r)' from the gtools package lists the different ways that r items can be selected from a set of n options when order matters.
#'combinations(n,r)' from the gtools package lists the different ways that r items can be selected from a set of n options when order does not matter.

library(gtools)

# joining strings with paste
number1 <- "Three"
suit1 <- "Hearts"
paste(number1, suit1)
#Outcome:"Three Hearts"

number2 <- c("Three", "Two")
suit2 <- c("diamonds")
paste(number2, suit2)
#Outcome:[1] "Three diamonds" "Two diamonds" 

# joining vectors element-wise with paste
paste(letters[1:5], as.character(1:5))
#Outcome:[1] "a 1" "b 2" "c 3" "d 4" "e 5"

# generating combinations of 2 vectors with expand.grid
expand.grid(number2, suit2)
#Var1     Var2
#1 Three diamonds
#2   Two diamonds

expand.grid(pants = c("blue", "black"), shirt = c("white", "grey", "plaid"))
#Outcome:
#pants shirt
#1  blue white
#2 black white
#3  blue  grey
#4 black  grey
#5  blue plaid
#6 black plaid


#Code: Generating a deck of cards
suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck
#Outcome:52cards, respectively <- vector form
deck <- paste(deck$number, deck$suit)
deck
#Outcome:52cards, respectively. there is some difference <- joining vectors element-wise

# probability of drawing a king
kings <- paste("King", suits)
mean(deck %in% kings)
#Outcome:[1] 0.07692308
4/52
#Outcome:[1] 0.07692308


#Permutations and Combinations
permutations(5,2)    # ways to choose 2 numbers in order from 1:5
#Outcome:
#       [,1] [,2]
#  [1,]    1    2
#  [2,]    1    3
#  [3,]    1    4
#  [4,]    1    5
#  [5,]    2    1
#  [6,]    2    3
#  [7,]    2    4
#  [8,]    2    5
#  [9,]    3    1
# [10,]    3    2
# [11,]    3    4
# [12,]    3    5
# [13,]    4    1
# [14,]    4    2
# [15,]    4    3
# [16,]    4    5
# [17,]    5    1
# [18,]    5    2
# [19,]    5    3
# [20,]    5    4

#generate all possible phone numbers
all_phone_numbers <- permutations(10, 7, v = 0:9)
n <- nrow(all_phone_numbers)
index <- sample(n, 5)
all_phone_numbers[index,]
#Outcome:
#      [,1] [,2] [,3] [,4] [,5] [,6] [,7]
# [1,]    6    7    0    4    5    2    8
# [2,]    2    1    5    6    7    0    3
# [3,]    2    5    6    1    4    8    7
# [4,]    7    3    4    0    8    1    9
# [5,]    7    5    6    9    4    2    8

permutations(3,2)    # order matters
combinations(3,2)    # order does not matter
     # [,1] [,2]
# [1,]    1    2
# [2,]    1    3
# [3,]    2    3


#Code: Probability of drawing a second king given that one king is drawn
hands <- permutations(52,2, v = deck)
hands
#Outcome: all the possibility (of permutation) cases 52*51 of the deck
#checking
length(hands)
#Outcome: 52*51 cases with each two cards. so the elements of list = 52*51  *2 = 5304

first_card <- hands[,1]
length(first_card)
#Outcome: record the first card of each permutations so 52*51  *1 = 2652
second_card <- hands[,2]
length(second_card)
#Outcome: record the first card of each permutations so 52*51  *1 = 2652

sum(first_card %in% kings & second_card %in% kings) / sum(first_card %in% kings)
#Outcome: [1] 0.05882353

a <- 3/51
#Outcome: [1] 0.05882353
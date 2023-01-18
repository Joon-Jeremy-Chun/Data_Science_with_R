#'paste' joins two strings and inserts a space in between.
#'expand.grid' gives the combinations of 2 vectors or lists.

library(gtools)

suits <- c("Diamonds", "Clubs", "Hearts", "Spades")
numbers <- c("Ace", "Deuce", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King")
deck <- expand.grid(number = numbers, suit = suits)
deck
# number     suit
# 1     Ace Diamonds
# 2   Deuce Diamonds
# 3   Three Diamonds
# 4    Four Diamonds
# 5    Five Diamonds
# 6     Six Diamonds
# 7   Seven Diamonds
# 8   Eight Diamonds
# 9    Nine Diamonds
# 10    Ten Diamonds
# 11   Jack Diamonds
# 12  Queen Diamonds
# 13   King Diamonds
# 14    Ace    Clubs
# 15  Deuce    Clubs
# 16  Three    Clubs
# 17   Four    Clubs
# 18   Five    Clubs
# 19    Six    Clubs
# 20  Seven    Clubs
# 21  Eight    Clubs
# 22   Nine    Clubs
# 23    Ten    Clubs
# 24   Jack    Clubs
# 25  Queen    Clubs
# 26   King    Clubs
# 27    Ace   Hearts
# 28  Deuce   Hearts
# 29  Three   Hearts
# 30   Four   Hearts
# 31   Five   Hearts
# 32    Six   Hearts
# 33  Seven   Hearts
# 34  Eight   Hearts
# 35   Nine   Hearts
# 36    Ten   Hearts
# 37   Jack   Hearts
# 38  Queen   Hearts
# 39   King   Hearts
# 40    Ace   Spades
# 41  Deuce   Spades
# 42  Three   Spades
# 43   Four   Spades
# 44   Five   Spades
# 45    Six   Spades
# 46  Seven   Spades
# 47  Eight   Spades
# 48   Nine   Spades
# 49    Ten   Spades
# 50   Jack   Spades
# 51  Queen   Spades
# 52   King   Spades

deck <- paste(deck$number, deck$suit)
deck
# [1] "Ace Diamonds"   "Deuce Diamonds" "Three Diamonds" "Four Diamonds"  "Five Diamonds" 
# [6] "Six Diamonds"   "Seven Diamonds" "Eight Diamonds" "Nine Diamonds"  "Ten Diamonds"  
# [11] "Jack Diamonds"  "Queen Diamonds" "King Diamonds"  "Ace Clubs"      "Deuce Clubs"   
# [16] "Three Clubs"    "Four Clubs"     "Five Clubs"     "Six Clubs"      "Seven Clubs"   
# [21] "Eight Clubs"    "Nine Clubs"     "Ten Clubs"      "Jack Clubs"     "Queen Clubs"   
# [26] "King Clubs"     "Ace Hearts"     "Deuce Hearts"   "Three Hearts"   "Four Hearts"   
# [31] "Five Hearts"    "Six Hearts"     "Seven Hearts"   "Eight Hearts"   "Nine Hearts"   
# [36] "Ten Hearts"     "Jack Hearts"    "Queen Hearts"   "King Hearts"    "Ace Spades"    
# [41] "Deuce Spades"   "Three Spades"   "Four Spades"    "Five Spades"    "Six Spades"    
# [46] "Seven Spades"   "Eight Spades"   "Nine Spades"    "Ten Spades"     "Jack Spades"   
# [51] "Queen Spades"   "King Spades"   

# probability of drawing a king
kings <- paste("King", suits)
mean(deck %in% kings)
#Outcome:[1] 0.07692308
x <- 4/52
x
#Outcome:[1] 0.07692308


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
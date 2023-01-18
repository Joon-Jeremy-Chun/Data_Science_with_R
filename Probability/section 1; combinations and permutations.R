#Objectives; To know how to use:
#'paste' joins two strings and inserts a space in between.
#'expand.grid' gives the combinations of 2 vectors or lists.
#'permutations(n,r)' from the gtools package lists the different ways that r items can be selected from a set of n options when order matters.
#'combinations(n,r)' from the gtools package lists the different ways that r items can be selected from a set of n options when order does not matter.


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


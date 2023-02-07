#objectives;
#how to use pipe '%>%' operator. it can help to reduce unnecessary variables


16 %>% sqrt()
#Error in 16 %>% sqrt() : could not find function "%>%"

#The pipe is an operator in 'dplyr' library
#Sending the result of one function to another using what is called 'the pipe operator' 
library(dplyr)
16 %>% sqrt()
#[1] 4

16 %>% sqrt() %>% log2()
#[1] 2
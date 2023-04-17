#Objectives, note from the text book
#Unlike the join functions, the binding functions do not try to match by a variable, but rather just combine datasets.
#The bind_cols() function binds two objects by making them columns in 'a tibble'. The R-base function cbind() binds columns but makes a data frame or matrix instead.
#The bind_rows() function is similar but binds rows instead of columns. The R-base function rbind() binds rows but makes a data frame or matrix instead.
library(tidyverse)
library(dslabs)
data(murders)

#import US election results data
data("polls_us_election_2016")
#join the murders table and US election results table
tab <- left_join(murders, results_us_election_2016, by = "state")


bind_cols(a = 1:3, b = 4:5) # must be the same dimension (or numbers)
# Error in `bind_cols()`:
#   ! Can't recycle `a` (size 3) to match `b` (size 2).

bind_cols(a = 1:3, b = 4:6)
# # A tibble: 3 × 2
#       a     b
#   <int> <int>
#      1     4
#      2     5
#      3     6

tab1 <- tab[, 1:3]
tab2 <- tab[, 4:6]
tab3 <- tab[, 7:9]
new_tab <- bind_cols(tab1, tab2, tab3)
head(new_tab)
# state abb region population total electoral_votes clinton trump others
# 1    Alabama  AL  South    4779736   135               9    34.4  62.1    3.6
# 2     Alaska  AK   West     710231    19               3    36.6  51.3   12.2
# 3    Arizona  AZ   West    6392017   232              11    45.1  48.7    6.2
# 4   Arkansas  AR  South    2915918    93               6    33.7  60.6    5.8
# 5 California  CA   West   37253956  1257              55    61.7  31.6    6.7
# 6   Colorado  CO   West    5029196    65               9    48.2  43.3    8.6



tab4 <- tab[1:2,]
tab5 <- tab[3:4,]
bind_rows(tab4, tab5)
# state abb region population total electoral_votes clinton trump others
# 1  Alabama  AL  South    4779736   135               9    34.4  62.1    3.6
# 2   Alaska  AK   West     710231    19               3    36.6  51.3   12.2
# 3  Arizona  AZ   West    6392017   232              11    45.1  48.7    6.2
# 4 Arkansas  AR  South    2915918    93               6    33.7  60.6    5.8
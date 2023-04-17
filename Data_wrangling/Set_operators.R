#Objectives, note from the textbook
#By default, the set operators in R-base work on vectors. If tidyverse/dplyr are loaded, they also work on data frames.
#You can take intersections of vectors using intersect(). This returns the elements common to both sets.
#You can take the union of vectors using union(). This returns the elements that are in either set.
#The set difference between a first and second argument can be obtained with setdiff(). Not that this function is not symmetric.
#The function set_equal() tells us if two sets are the same, regardless of the order of elements.

library(tidyverse)
library(dslabs)
data(murders)

#import US election results data
data("polls_us_election_2016")
#join the murders table and US election results table
tab <- left_join(murders, results_us_election_2016, by = "state")


#intersect vectors or data frames
intersect(1:10, 6:15)
#[1]  6  7  8  9 10
intersect(6:15, 1:10)
#[1]  6  7  8  9 10
intersect(c("a","b","c"), c("b","c","d"))
#[1] "b" "c"
tab1 <- tab[1:5,]
tab2 <- tab[3:7,]
intersect(tab1, tab2)
# state abb region population total electoral_votes clinton trump others
# 1    Arizona  AZ   West    6392017   232              11    45.1  48.7    6.2
# 2   Arkansas  AR  South    2915918    93               6    33.7  60.6    5.8
# 3 California  CA   West   37253956  1257              55    61.7  31.6    6.7

#perform a union of vectors or data frames
union(1:10, 6:15)
#[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15
union(c("a","b","c"), c("b","c","d"))
#[1] "a" "b" "c" "d"
union(tab1, tab2)
# state abb    region population total electoral_votes clinton trump others
# 1     Alabama  AL     South    4779736   135               9    34.4  62.1    3.6
# 2      Alaska  AK      West     710231    19               3    36.6  51.3   12.2
# 3     Arizona  AZ      West    6392017   232              11    45.1  48.7    6.2
# 4    Arkansas  AR     South    2915918    93               6    33.7  60.6    5.8
# 5  California  CA      West   37253956  1257              55    61.7  31.6    6.7
# 6    Colorado  CO      West    5029196    65               9    48.2  43.3    8.6
# 7 Connecticut  CT Northeast    3574097    97               7    54.6  40.9    4.5

#set difference of vectors or data frames
setdiff(1:10, 6:15)
#[1] 1 2 3 4 5
setdiff(6:15, 1:10)
#[1] 11 12 13 14 15
setdiff(tab1, tab2)
# state abb region population total electoral_votes clinton trump others
# 1 Alabama  AL  South    4779736   135               9    34.4  62.1    3.6
# 2  Alaska  AK   West     710231    19               3    36.6  51.3   12.2
setdiff(tab2, tab1)
# state abb    region population total electoral_votes clinton trump others
# 1    Colorado  CO      West    5029196    65               9    48.2  43.3    8.6
# 2 Connecticut  CT Northeast    3574097    97               7    54.6  40.9    4.5

#setequal determines whether sets have the same elements, regardless of order
setequal(1:5, 1:6)
#[1] FALSE
setequal(1:5, 5:1)
#[1] TRUE
setequal(tab1, tab2)
#[1] FALSE
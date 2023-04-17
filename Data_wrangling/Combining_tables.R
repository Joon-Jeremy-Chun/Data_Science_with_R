#Objectives, note from the textbook
#The join functions in the 'dplyr' package combine two tables such that matching rows are together.
#left_join() only keeps rows that have information in the 'first' table.
#right_join() only keeps rows that have information in the 'second' table.
#inner_join() only keeps rows that have information in both tables.
#full_join() keeps all rows from both tables.
#semi_join() keeps the part of the first table for which we have information in the second.
#anti_join() keeps the elements of the first table for which there is no information in the second.

#import US murders data
library(tidyverse)
library(ggrepel)
library(dslabs)
ds_theme_set()
data(murders)
head(murders)

#import US election results data
data("polls_us_election_2016")
head(results_us_election_2016)
identical(results_us_election_2016$state, murders$state)
#[1] FALSE

#join the murders table and US election results table
tab <- left_join(murders, results_us_election_2016, by = "state")
head(tab)

#plot electoral votes versus population
tab %>% ggplot(aes(population/10^6, electoral_votes, label = abb)) +
  geom_point() +
  geom_text_repel() + 
  scale_x_continuous(trans = "log2") +
  scale_y_continuous(trans = "log2") +
  geom_smooth(method = "lm", se = FALSE)

#make two smaller tables to demonstrate joins
tab1 <- slice(murders, 1:6) %>% select(state, population)
tab1
# state population
# 1    Alabama    4779736
# 2     Alaska     710231
# 3    Arizona    6392017
# 4   Arkansas    2915918
# 5 California   37253956
# 6   Colorado    5029196
tab2 <- slice(results_us_election_2016, c(1:3, 5, 7:8)) %>% select(state, electoral_votes)
tab2
# state electoral_votes
# 1 California              55
# 2      Texas              38
# 3    Florida              29
# 4   Illinois              20
# 5       Ohio              18
# 6    Georgia              16

left_join(tab1, tab2)
# Joining, by = "state"
# state population electoral_votes
# 1    Alabama    4779736              NA
# 2     Alaska     710231              NA
# 3    Arizona    6392017              NA
# 4   Arkansas    2915918              NA
# 5 California   37253956              55
# 6   Colorado    5029196              NA

tab1 %>% left_join(tab2)
# same outcome from above one

tab1 %>% right_join(tab2)
# Joining, by = "state"
# state population electoral_votes
# 1 California   37253956              55
# 2      Texas         NA              38
# 3    Florida         NA              29
# 4   Illinois         NA              20
# 5       Ohio         NA              18
# 6    Georgia         NA              16

inner_join(tab1, tab2)
# Joining, by = "state"
# state population electoral_votes
# 1 California   37253956              55

semi_join(tab1, tab2)
# Joining, by = "state"
# state population
# 1 California   37253956

anti_join(tab1, tab2)
# Joining, by = "state"
# state population
# 1  Alabama    4779736
# 2   Alaska     710231
# 3  Arizona    6392017
# 4 Arkansas    2915918
# 5 Colorado    5029196

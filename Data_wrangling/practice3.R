library(tidyverse)
library(dslabs)
data(murders)

#import US election results data
data("polls_us_election_2016")
#join the murders table and US election results table
tab <- left_join(murders, results_us_election_2016, by = "state")
tab1 <- slice(tab, c(1:3,8:9)) %>% select(state, population)
tab2 <- slice(tab, c(1:3,5:7)) %>% select(state, electoral_votes)

dat <- left_join(tab1, tab2, by = "state")
dat <- semi_join(tab1, tab2, by = "state")

#
#
#install.packages("Lahman")
library(Lahman)

top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()
People %>% as_tibble()
#
top_names <- top %>% left_join(People) %>% select(playerID, nameFirst, nameLast, HR)

#
Salaries %>% as_tibble()

top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)

#
AwardsPlayers %>% as_tibble()

top_awards <- AwardsPlayers %>% filter(yearID == 2016) %>%
  right_join(top) %>%
  select(playerID, HR, awardID)
#
top_awards2 <- AwardsPlayers %>% filter(yearID == 2016) %>%
  select(playerID, awardID) %>% pivot_wider(names_from = playerID, values_from = awardID)

length(top_awards2)
#[1] 47

# top$playerID
# top_awards$playerID
# setdiff(top_awards$playerID, top$playerID)
# length(setdiff(top$playerID, top_awards$playerID))


library(Lahman)
library(tidyverse)
library(dslabs)
ds_theme_set()

?Teams
#Correlation coefficient between number of runs per game and number of at bate per game?
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(AB_per_game = AB / G, R_per_game = R / G) %>%
  summarize(cor(AB_per_game, R_per_game))

#Correlation coefficient between win rate(number of wins per game) and number of errors per game?
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(W_per_game = W / G, E_per_game = E / G) %>%
  summarize(cor(W_per_game, E_per_game))

#Correlation coefficient between double per game and triples per game?
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(X2B_per_game = X2B / G, X3B_per_game = X3B / G) %>%
  summarize(cor(X2B_per_game, X3B_per_game))

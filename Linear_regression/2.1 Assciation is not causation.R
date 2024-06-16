#From textbook summary
#Association is not causation
#Although it may appear that BB cause runs, it is actually the HR that cause most of these runs. We say that BB are confounded with HR.
#Regression can help us account for confounding.

# find regression line for predicting runs from BBs (not shown in video)
library(tidyverse)
library(Lahman)
get_slope <- function(x, y) cor(x, y) * sd(y) / sd(x)

bb_slope <- Teams %>% 
  filter(yearID %in% 1961:2001 ) %>% 
  mutate(BB_per_game = BB/G, R_per_game = R/G) %>% 
  summarize(slope = get_slope(BB_per_game, R_per_game))

bb_slope 
#outcome:
#      slope
#1 0.7353288
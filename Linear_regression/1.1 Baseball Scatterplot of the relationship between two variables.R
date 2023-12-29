library(Lahman)
library(tidyverse)
library(dslabs)
ds_theme_set()

# A data frame with 2985 observations on the following 48 variables.
?Teams

#Scatterplot of the relationship between HRs and runs
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(HR_per_game = HR / G, R_per_game = R / G) %>%
  ggplot(aes(HR_per_game, R_per_game)) + geom_point(alpha = 0.5)

#Scatterplot of the relationship between stolen bases and runs
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(SB_per_game = SB / G, R_per_game = R / G) %>%
  ggplot(aes(SB_per_game, R_per_game)) + geom_point(alpha = 0.5)

#Scatterplot of the relationship between bases on balls and runs
Teams %>% filter(yearID %in% 1961:2001) %>% mutate(BB_per_game = BB / G, R_per_game = R / G) %>%
  ggplot(aes(BB_per_game, R_per_game)) + geom_point(alpha = 0.5)

#Scatterplot of the relationship brtween bases on at-bats and runs
Teams %>% filter(yearID %in% 1961:2001 ) %>% mutate(AB_per_game = AB/G, R_per_game = R/G) %>%
  ggplot(aes(AB_per_game, R_per_game)) + geom_point(alpha = 0.5)

#Scatterplot of triples per game vs doubles per game
Teams %>% filter(yearID %in% 1961:2001 ) %>% mutate(X2B_per_game = X2B/G, X3B_per_game = X3B/G) %>%
  ggplot(aes(X2B_per_game, X3B_per_game)) + geom_point(alpha = 0.5)

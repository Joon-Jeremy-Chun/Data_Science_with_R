#Practice3
library(Lahman)
library(tidyverse)
library(dplyr)
library(ggplot2)
options(digits = 3)

bat_02 <- Batting %>% filter(yearID == 2002) %>%
  mutate(pa = AB + BB, singles = (H - X2B - X3B - HR)/pa, bb = BB/pa) %>%
  filter(pa >= 100) %>%
  select(playerID, singles, bb)

bat_01 <- Batting %>% filter(yearID %in% 1999:2001 ) %>%
  mutate(pa = AB + BB, singles = (H - X2B - X3B - HR)/pa, bb = BB/pa) %>%
  filter(pa >= 100) %>%
  select(playerID, singles, bb)

mean_bat02 <- bat_02 %>% group_by(playerID) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

mean_bat01 <- bat_01 %>% group_by(playerID) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

mean_singles_bat01 <- bat_01 %>% group_by(playerID) %>%
  summarise(across(everything(), mean, na.rm = TRUE)) %>%
  filter(singles > 0.2)

mean_bb_bat01 <- bat_01 %>% group_by(playerID) %>%
  summarise(across(everything(), mean, na.rm = TRUE)) %>%
  filter(bb > 0.2)

joined_data <- inner_join(mean_bat01, mean_bat02, by = "playerID")
correlation_singles <- cor(joined_data$singles.x, joined_data$singles.y)
correlation_bb <- cor(joined_data$bb.x, joined_data$bb.y)
#Practice4

library(tidyverse)
library(HistData)
library(dplyr)
library(broom)
data("GaltonFamilies")
set.seed(1, sample.kind = "Rounding") 
galton <- GaltonFamilies %>%
  group_by(family, gender) %>%
  sample_n(1) %>%
  ungroup() %>% 
  gather(parent, parentHeight, father:mother) %>%
  mutate(child = ifelse(gender == "female", "daughter", "son")) %>%
  unite(pair, c("parent", "child"))

galton

summary <- galton %>% group_by(pair) %>%
  summarise(count = n())

correlation <- galton %>% group_by(pair) %>%
  summarise(correlation = cor(parentHeight, childHeight))

fit <- galton %>% group_by(pair) %>%
  summarise(tidy(lm(parentHeight ~ childHeight), conf.int = TRUE ))


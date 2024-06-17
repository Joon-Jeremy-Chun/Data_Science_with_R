#Stratification and Multivariate Regression
#A first approach to check confounding is to keep HRs fixed at a certain value and then examine the relationship between BB and runs.
#The slopes of BB after stratifying on HR are reduced, but they are not 0, which indicates that BB are helpful for producing runs, just not as much as previously thought.

# stratify HR per game to nearest 10, filter out strata with few points
dat <- Teams %>% filter(yearID %in% 1961:2001) %>%
  mutate(HR_strata = round(HR/G, 1), 
         BB_per_game = BB / G,
         R_per_game = R / G) %>%
  filter(HR_strata >= 0.4 & HR_strata <=1.2)

# scatterplot for each HR stratum
dat %>% 
  ggplot(aes(BB_per_game, R_per_game)) +  
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  facet_wrap( ~ HR_strata)

# calculate slope of regression line after stratifying by HR
dat %>%  
  group_by(HR_strata) %>%
  summarize(slope = cor(BB_per_game, R_per_game)*sd(R_per_game)/sd(BB_per_game))

#Outcome:
# A tibble: 9 × 2
# HR_strata slope
# <dbl> <dbl>
#   1       0.4 0.734
# 2       0.5 0.566
# 3       0.6 0.412
# 4       0.7 0.285
# 5       0.8 0.365
# 6       0.9 0.261
# 7       1   0.512
# 8       1.1 0.454
# 9       1.2 0.440

# stratify by BB
dat <- Teams %>% filter(yearID %in% 1961:2001) %>%
  mutate(BB_strata = round(BB/G, 1), 
         HR_per_game = HR / G,
         R_per_game = R / G) %>%
  filter(BB_strata >= 2.8 & BB_strata <=3.9) 

# scatterplot for each BB stratum
dat %>% ggplot(aes(HR_per_game, R_per_game)) +  
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  facet_wrap( ~ BB_strata)

# slope of regression line after stratifying by BB
dat %>%  
  group_by(BB_strata) %>%
  summarize(slope = cor(HR_per_game, R_per_game)*sd(R_per_game)/sd(HR_per_game)) 

#Outcome:
# # A tibble: 12 × 2
# BB_strata slope
# <dbl> <dbl>
#   1       2.8  1.52
# 2       2.9  1.57
# 3       3    1.52
# 4       3.1  1.49
# 5       3.2  1.58
# 6       3.3  1.56
# 7       3.4  1.48
# 8       3.5  1.63
# 9       3.6  1.83
# 10       3.7  1.45
# 11       3.8  1.70
# 12       3.9  1.30
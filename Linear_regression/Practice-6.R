#practice6

library(tidyverse)
library(broom)
library(Lahman)
Teams_small <- Teams %>% 
  filter(yearID %in% 1961:2001) %>% 
  mutate(avg_attendance = attendance/G, runs_per_game = R/G, homeruns_per_game = HR/G)

att_model_R <- lm(avg_attendance ~ runs_per_game, data = Teams_small)

att_summary_R <- tidy(att_model_R, conf.int = TRUE)

att_model_HR <- lm(avg_attendance ~ homeruns_per_game, data = Teams_small)

att_summary_HR <- tidy(att_model_HR, conf.int = TRUE)

att_model_W <- lm(avg_attendance ~ W, data = Teams_small)

att_summary_W <- tidy(att_model_W, conf.int = TRUE)


year_attendance_model <- lm(avg_attendance ~ yearID, data = Teams_small)

year_attendance_summary <- tidy(year_attendance_model, conf.int = TRUE)

corr_R_W <- cor(Teams_small$runs_per_game, Teams_small$W)
corr_HR_W <- cor(Teams_small$homeruns_per_game, Teams_small$W)

Teams_small <- Teams_small %>% mutate( W_round10 = round( W/10 )) %>%
  filter(W_round10 >= 5 & W_round10 <= 10)

count <- Teams_small %>% group_by(W_round10) %>% summarise(count =n())
count

regLine_r <- Teams_small %>%
  group_by(W_round10) %>%
  do(tidy(lm(avg_attendance ~ runs_per_game, data = .), conf.int = TRUE)) %>%
  ungroup() %>%
    select(W_round10, estimate, std.error, conf.low, conf.high, p.value)

regLine_hr <- Teams_small %>%
  group_by(W_round10) %>%
  do(tidy(lm(avg_attendance ~ homeruns_per_game, data = .), conf.int = TRUE)) %>%
  ungroup() %>%
  select(W_round10, estimate, std.error, conf.low, conf.high, p.value)

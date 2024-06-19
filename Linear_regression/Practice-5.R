#practice5
library(tidyverse)
library(Lahman)
library(broom)

team_1971 <- Teams %>%
  filter(yearID == 1971)

model <- lm(R ~ BB + HR, data = team_1971)

model_s <- tidy(model)

# Filter the Teams data for the years 1961 to 2018
teams_filtered <- Teams %>%
  filter(yearID >= 1961 & yearID <= 2018)

# Fit linear models for each year and extract summaries
results <- teams_filtered %>%
  group_by(yearID) %>%
  do(tidy(lm(R ~ BB + HR, data = .), conf.int = TRUE)) %>%
  ungroup() %>%
  filter(term == "BB") %>%
  select(yearID, estimate, std.error, conf.low, conf.high, p.value)

# Print the results summary
print(results)

# Create a scatterplot of the estimate for the effect of BB on runs over time
ggplot(results, aes(x = yearID, y = estimate)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Effect of BB on Runs Over Time (1961-2018)",
       x = "Year",
       y = "Estimate for Effect of BB on Runs") +
  theme_minimal()

#
year_effect_model <- lm(estimate ~ yearID, data = results)

year_effect_summary <- tidy(year_effect_model, conf.int = TRUE)

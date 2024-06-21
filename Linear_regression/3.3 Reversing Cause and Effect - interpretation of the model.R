#Another way association can be confused with causation is when the cause and effect are reversed.
#As discussed in the video, in the Galton data, when father and son were reversed in the regression, the model was technically correct.
#The estimates and p-values were obtained correctly as well. What was incorrect was the interpretation of the model.

# cause and effect reversal using son heights to predict father heights
library(HistData)
data("GaltonFamilies")
set.seed(1983)
galton_heights <- GaltonFamilies %>%
  filter(gender == "male") %>%
  group_by(family) %>%
  sample_n(1) %>%
  ungroup() %>%
  select(father, childHeight) %>%
  rename(son = childHeight)

galton_heights %>% summarize(tidy(lm(father ~ son)))

# # A tibble: 2 × 5
# term        estimate std.error statistic  p.value
# <chr>          <dbl>     <dbl>     <dbl>    <dbl>
#   1 (Intercept)   40.9      4.40        9.29 5.47e-17
# 2 son            0.407    0.0636      6.40 1.36e- 9

#predict fathers height by son's but it does not mean that son cause their father heights even p.value were obtained correctly.
#Measurement Error Models
#Up to now, all our linear regression examples have been applied to two or more random variables. We assume the pairs are bivariate normal and use this to motivate a linear model.
#Another use for linear regression is with measurement error models, where it is common to have a non-random covariate (such as time). Randomness is introduced from measurement error rather than sampling or natural variability.

library(dslabs)
falling_object <- rfalling_object()

#The code to draw the trajectory of the ball:
falling_object %>%
  ggplot(aes(time, observed_distance)) +
  geom_point() +
  ylab("Distance in meters") +
  xlab("Time in seconds")

#The code to use the lm() function to estimate the coefficients:
fit <- falling_object %>%
  mutate(time_sq = time^2) %>%
  lm(observed_distance~time+time_sq, data=.)

tidy(fit)
#> # A tibble: 3 x 5
#>   term        estimate std.error statistic  p.value
#>   <chr>          <dbl>     <dbl>     <dbl>    <dbl>
#> 1 (Intercept)    56.9      0.580     98.0  1.56e-17
#> 2 time           -1.04     0.829     -1.25 2.36e- 1
#> 3 time_sq        -4.73     0.246    -19.2  8.17e-10

#The code to check if the estimated parabola fits the data:
augment(fit) %>%
  ggplot() +
  geom_point(aes(time, observed_distance)) +
  geom_line(aes(time, .fitted), col = "blue")

#The code to see the summary statistic of the regression:
tidy(fit, conf.int = TRUE)
# # A tibble: 3 × 7
# term        estimate std.error statistic  p.value conf.low conf.high
# <chr>          <dbl>     <dbl>     <dbl>    <dbl>    <dbl>     <dbl>
#   1 (Intercept)    56.7      1.03     55.2   8.47e-15    54.5      59.0 
# 2 time           -1.09     1.47     -0.741 4.74e- 1    -4.32      2.14
# 3 time_sq        -4.62     0.436   -10.6   4.11e- 7    -5.58     -3.66
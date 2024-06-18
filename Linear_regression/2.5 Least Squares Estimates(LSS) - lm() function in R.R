#When calling the lm() function, the variable that we want to predict is put to the left of the ~ symbol, and the variables that we use to predict is put to the right of the ~ symbol. The intercept is added automatically.
#LSEs are random variables.
#Because they are derived from the samples, LSE are random variables.
#(beta_0) and (beta_1) appear to be normally distributed because the central limit theorem plays a role.
#The t-statistic depends on the assumption that (e error) follows a normal distribution.
library(gridExtra)
library(HistData)
library(tidyverse)
data("GaltonFamilies")
set.seed(1983)

galton_heights <- GaltonFamilies %>%
  filter(gender == "male") %>%
  group_by(family) %>%
  sample_n(1) %>%
  ungroup() %>%
  select(father, childHeight) %>%
  rename(son = childHeight)


# fit regression line to predict son's height from father's height
fit <- lm(son ~ father, data = galton_heights)
fit

#Outcome:
# Call:
#   lm(formula = son ~ father, data = galton_heights)
# 
# Coefficients:
#   (Intercept)       father  
# 37.2876       0.4614  


# summary statistics
summary(fit)

#Outcome:
# Call:
#   lm(formula = son ~ father, data = galton_heights)
# 
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -9.3543 -1.5657 -0.0078  1.7263  9.4150 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 37.28761    4.98618   7.478 3.37e-12 ***
#   father       0.46139    0.07211   6.398 1.36e-09 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 2.45 on 177 degrees of freedom
# Multiple R-squared:  0.1878,	Adjusted R-squared:  0.1833 
# F-statistic: 40.94 on 1 and 177 DF,  p-value: 1.36e-09


# Monte Carlo simulation
B <- 1000
N <- 50
lse <- replicate(B, {
  sample_n(galton_heights, N, replace = TRUE) %>% 
    lm(son ~ father, data = .) %>% 
    .$coef 
})
lse <- data.frame(beta_0 = lse[1,], beta_1 = lse[2,]) 

# Plot the distribution of beta_0 and beta_1

p1 <- lse %>% ggplot(aes(beta_0)) + geom_histogram(binwidth = 5, color = "black") 
p2 <- lse %>% ggplot(aes(beta_1)) + geom_histogram(binwidth = 0.1, color = "black") 
grid.arrange(p1, p2, ncol = 2)

# summary statistics
sample_n(galton_heights, N, replace = TRUE) %>% 
  lm(son ~ father, data = .) %>% 
  summary %>%
  .$coef

#Output:
# Estimate Std. Error  t value     Pr(>|t|)
# (Intercept) 19.2791952 11.6564590 1.653950 0.1046637693
# father       0.7198756  0.1693834 4.249977 0.0000979167

lse %>% summarize(se_0 = sd(beta_0), se_1 = sd(beta_1))

#Output:
# se_0      se_1
# 1 8.83591 0.1278812

lse %>% summarize(cor(beta_0, beta_1))

B <- 1000
N <- 50
lse <- replicate(B, {
  sample_n(galton_heights, N, replace = TRUE) %>%
    mutate(father = father - mean(father)) %>%
    lm(son ~ father, data = .) %>% .$coef 
})

cor(lse[1,], lse[2,]) 

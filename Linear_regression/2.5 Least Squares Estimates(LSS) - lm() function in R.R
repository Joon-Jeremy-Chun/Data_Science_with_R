#When calling the lm() function, the variable that we want to predict is put to the left of the ~ symbol, and the variables that we use to predict is put to the right of the ~ symbol. The intercept is added automatically.
#LSEs are random variables.

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
#Objectives,note from text book
#The pivot_wider() function converts tidy data into wide data, which can be a useful intermediate step in data tidying.
#The data frame to be reshaped is the first argument in pivot_wider().
#The argument names_from tells pivot_wider() which variable will be used for the column names and the argument values_from tells pivot_wider() which variable to use to fill in the values.


library(tidyverse)
library(dslabs)
path <- system.file("extdata", package="dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)

tidy_data <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)

new_tidy_data <- wide_data %>%
  pivot_longer(-country, names_to = "year", values_to = "fertility")

#convert the tidy data to wide data
new_wide_data <- new_tidy_data %>%
  pivot_wider(names_from = year, values_from = fertility)
select(new_wide_data, country, '1960':'1967')

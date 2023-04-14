#note - from textbook
#in tidy data, each row represent an observation and each column represents a different variable.
#in wide data, each row includes several observations and one of the variables is stored in the header.

library(tidyverse)
library(dslabs)
data(gapminder)

#create and inspect a tidy data frame
tidy_data <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)
head(tidy_data)

#plotting tidy data is simple
tidy_data %>%
  ggplot(aes(year, fertility, color = country)) + geom_point()

#import and inspect example of original Gapminder data in wide format
path <- system.file("extdata", package = "dslabs")
list.files(path)
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)
select(wide_data, country, '1960':'1967')
#output: a tibble:2X9
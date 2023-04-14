#Objectives nots from textbook
#After importing data, a common next step is to reshape the data into a form useful for the rest of the analysis by tidying it. The tidyr package includes several useful functions for tidying data.
#The pivot_longer() function converts wide data into tidy data.
#The first argument of pivot_longer() is the data frame to be reshaped. The second argument specifies the columns containing the values to be moved into a single column.
#The now column of values is called value by default and the column containing the original names of those columns is called 'name' by default.
#The values_to and names_to arguments can be used to change the default names of these columns.

library(tidyverse)
library(dslabs)
path <- system.file("extdata", package="dslabs")
filename <- file.path(path, "fertility-two-countries-example.csv")
wide_data <- read_csv(filename)

tidy_data <- gapminder %>%
  filter(country %in% c("South Korea", "Germany")) %>%
  select(country, year, fertility)

#snippet of wide data
wide_data %>% select(country, '1960':'1965')

#move the value in the columns 1960 through 2015 into 'a single column'
wide_data %>% pivot_longer('1960':'2015')
dat1 <- wide_data %>% pivot_longer(-country)
# output: a tibble: 112X3

#another way to do this - only country isn't being pivoted
wide_data %>% pivot_longer(-country)
dat2 <- wide_data %>% pivot_longer(-country)

#change the default column names
new_tidy_data <- wide_data %>%
  pivot_longer(-country, names_to = "year", values_to = "fertility")
head(new_tidy_data)

#compare the class from our original tidy data (year is an integer) and in the new version (year is a character)
class(tidy_data$year)
#[1] "integer"
class(new_tidy_data$year)
#[1] "character"

#use the name_transform argument to change the class of the year values to numeric
new_tidy_data <- wide_data %>%
  pivot_longer(-country, names_to = "year", values_to = "fertility", names_transform = list(year=as.numeric))

class(new_tidy_data$year)
#[1] "numeric"

#plot the data as before
new_tidy_data %>% ggplot(aes(year, fertility, color = country)) + geom_point()

#Objectives, note from the textbook
#The separate() function splits one column into two or more columns at 'a specified character' that separates the variables.
#The separate() function takes three arguments (apart from the data): (1)the name of the column to be separate, (2)the names to be used for the new columns, (3)and the character that separates the variables.
#When there is an extra separation, you can use extra = "merge" to merge the last two variables.
#The unite() function joins two columns into one.

library(tidyverse)
library(dslabs)

#import data
path <- system.file("extdata", package = "dslabs")
fname <- "life-expectancy-and-fertility-two-countries-example.csv"
filename <- file.path(path, fname)

raw_dat <- read_csv(filename)
select(raw_dat, 1:4)
select(raw_dat, 0:4)

#pivot all columns except country
dat <- raw_dat %>% pivot_longer(-country)
head(dat)
dat$name[1:5]

#separate on underscores
dat1 <- dat %>% separate(name, c("year", "name"), sep = "_")

#separate on underscores (the default), convert years to numeric
dat2 <- dat %>% separate(name, c("year", "name"), convert = TRUE)
#Output: xxxx_life_expectancy -> separate the first '_' ; XXXX and 'life', not 'life_expectancy'

#split on all underscores, pad empty cells with NA
dat3 <- dat %>% separate(name, c("year", "name1", "name2"), fill = "right", convert = TRUE)
#Output: (name1-'fertility' and name2 -NA)and (name1-'life' and name2-'expectancy')

#split on first underscore but keep life_expectancy merged
dat4 <- dat %>% separate(name, c("year", "name"), sep = "_", extra = "merge", convert = TRUE)
#Output: xxxx_life_expectancy -> separate the first '_' ; XXXX and 'life_expectancy'

#separate then create a new column for each variable using pivot_wider
dat5 <- dat %>% separate(name, c("year", "name"), sep = "_", extra = "merge", convert = TRUE) %>% pivot_wider()
head(dat5)
#Outcome: columns -> country, year, fertility, life_expectancy

#
#
#if we had used this non-optimal approach to separate
data_1 <- dat %>%
  separate(name, c("year", "name_1", "name_2"), fill = 'right', convert = TRUE)
#output: same results with dat3

#we could unite the second and third columns using unite()
data_2 <- dat %>%
  separate(name, c("year", "name_1", "name_2"), fill = 'right', convert = TRUE) %>%
  unite(variable_name, name_1, name_2, sep = "_")
head(data_2)
#1 Germany  1960 fertility_NA     2.41
#2 Germany  1960 life_expectancy 69.3 

#spread the columns
data_3 <- dat %>%
  separate(name, c("year", "name_1", "name_2"), fill = 'right', convert = TRUE) %>%
  unite(name, name_1, name_2, sep = "_") %>%
  spread(name, value) %>%
  rename(fertility = fertility_NA)
head(data_3)
#outcome: we got same result with dat5
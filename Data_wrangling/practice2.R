library(tidyverse)
library(dslabs)

#path <- system.file("extdata", package="dslabs")
#filename <- file.path(path, "times.csv")
#d<- read_csv(filename)

head(co2)
co2
dat <- co2

#
#
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- pivot_longer(co2_wide, -year, names_to = "month", values_to = "co2")
#
co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

#
#
data(admissions)
dat <- admissions %>% select(-applicants)
#
dat_tidy <- pivot_wider(dat, names_from = gender, values_from = admitted)
#
#
tmp <- admissions %>%
  pivot_longer(cols = c(admitted, applicants), names_to = "key", values_to = "value")
tmp

#
tmp2 <- unite(tmp, column_name, c(key, gender))


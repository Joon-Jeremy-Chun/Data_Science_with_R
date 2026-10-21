# Explicit dependencies for an independent R session (2026 maintenance).
library(tidyverse)
library(dslabs)


schedule <- data.frame( day = c("Monday","Tuesday"),
                        staff = c("Mandy, Chris and Laura","Steve, Ruth and Fran"))
str_split(schedule$staff, ", | and ")
str_split(schedule$staff, "\\s?(,|and)\\s?")
str_split(schedule$staff, ",\\s|\\sand\\s")

tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ")) %>%
  unnest(cols = staff)

data(gapminder)

dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(recode(country, 
                "Central African Republic" = "CAR", 
                "Congo, Dem. Rep." = "DRC",
                "Equatorial Guinea" = "Eq. Guinea"))

try({ # Deliberately invalid unnamed recode example; the named form below is correct.
  dat <- gapminder %>% filter(region == "Middle Africa") %>%
    mutate(country_short = recode(country,
      c("Central African Republic", "Congo, Dem. Rep.", "Equatorial Guinea"),
      c("CAR", "DRC", "Eq. Guinea")))
})

dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(country_short = recode(country, 
                                "Central African Republic" = "CAR", 
                                "Congo, Dem. Rep." = "DRC",
                                "Equatorial Guinea" = "Eq. Guinea"))


schedule <- data.frame( day = c("Monday","Tuesday"),
                        staff = c("Mandy, Chris and Laura","Steve, Ruth and Fran"))
str_split(schedule$staff, ", | and ")
str_split(schedule$staff, "\\s?(,|and)\\s?")
str_split(schedule$staff, ",\\s|\\sand\\s")

tidy <- schedule %>% 
  mutate(staff = str_split(staff, ", | and ", simplify = TRUE)) %>% 
  unnest()

data(gapminder)

dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(recode(country, 
                "Central African Republic" = "CAR", 
                "Congo, Dem. Rep." = "DRC",
                "Equatorial Guinea" = "Eq. Guinea"))

dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(country_short = recode(country, 
                                c("Central African Republic", "Congo, Dem. Rep.", "Equatorial Guinea"),
                                c("CAR", "DRC", "Eq. Guinea")))

dat <- gapminder %>% filter(region == "Middle Africa") %>% 
  mutate(country_short = recode(country, 
                                "Central African Republic" = "CAR", 
                                "Congo, Dem. Rep." = "DRC",
                                "Equatorial Guinea" = "Eq. Guinea"))


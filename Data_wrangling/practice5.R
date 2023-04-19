animals <- c("cat", "puppy", "MoosE", "MONKEY")
pattern <- "[a-z]"
str_detect(animals, pattern)

k <- c("70"  ,     "5 ft"  ,   "4'11"  ,   ""    ,     "."   ,    "Six feet")
pattern <- "\\d|ft"
str_view_all(k, pattern)

converted <- problems %>% 
  str_replace("feet|foot|ft", "'") %>% 
  str_replace("inches|in|''|\"", "") %>% 
  str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2")

pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
index <- str_detect(converted, pattern)
converted[!index]

t <- "19"
str_detect(t, "193+")
str_detect(t, "[193+]")

j <- "19.5"
str_detect(j, "^1\\d*$")
str_detect(j, "1\\d*")
str_detect(j, "^1\\d+\\.\\d?$")
str_detect(j, "[1-9]*\\.5")

library(rvest)
library(tidyverse)
library(stringr)
url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
tab <- read_html(url) %>% html_nodes("table")
polls <- tab[[6]] %>% html_table(fill = TRUE)

names(polls) <- c("dates", "remain", "leave", "undecided", "lead", "samplesize", "pollster", "poll_type", "notes")
polls <- polls[str_detect(polls$remain, "%"), -9]
nrow(polls)

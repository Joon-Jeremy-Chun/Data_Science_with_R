#Objectives, notes from the textbook
#The main types of string processing tasks are detecting, locating, extracting and replacing elements of strings.
#The 'stringr' package from the 'tidyverse' includes a variety of string processing functions that begin with str_ and take the string as the first argument, which makes them compatible with the pipe.

url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167"
murders_raw <- read_html(url) %>%
  html_nodes("table") %>%
  html_table() %>%
  .[[1]] %>%
  setNames(c("state", "population", "total", "murder_rate"))

#direct conversion to mumeric fails because of commas
murders_raw$population[1:3]
#[1] "4,853,875" "737,709"   "6,817,565"

as.numeric(murders_raw$population[1:3])
#Error: (converted from warning) NAs introduced by coercion

#
#
#Use the str_datect() function to determine whether a string contains a certain pattern.
#Use the str_replace_all() function to replace all instances of one pattern with another pattern. To remove a pattern, replace with the empty string("").
#The parse_number() function removes punctuation from strings and converts them to numeric.
#mutate_at() performs the same transformation on the specified column numbers.

#(creating a function to) detect whether there are commas
commas <- function(x) any(str_detect(x, ","))
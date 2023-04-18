#Objectives, notes from the textbook
#The most common tacks in string processing include:
#-extracting numbers from strings
#-removing unwanted characters from text
#-finding and replacing characters
#-extracting specific parts of strings
#-converting free form text to more uniform formats
#-splitting strings into multiple values
#The 'stringr' package in the 'tidyverse' contains string processing functions that follow a similar naming format (str_functionname) and are compatible with the pipe.

#read in raw murders data from Wikipedia
url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167"
# murders_raw <- read_html(url) %>%
#   html_nodes("table") %>%
#   html_table() %>%
#   .[[1]]
# class(murders_raw)
#[1] "tbl_df"     "tbl"        "data.frame"
murders_raw <- read_html(url) %>%
  html_nodes("table") %>%
  html_table() %>%
  .[[1]] %>%
  setNames(c("state", "population", "total", "murder_rate"))

head(murders_raw)
class(murders_raw$population)
#[1] "character"
class(murders_raw$murder_rate)
#[1] "numeric"
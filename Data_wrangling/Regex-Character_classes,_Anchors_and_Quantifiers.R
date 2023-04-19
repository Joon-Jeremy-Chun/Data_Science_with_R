#Objectives, notes from textbook
#A regular expression (regex) is a way to describe a specific pattern of characters of text. A set of rules has been designed to do this specifically and efficiently.
#stringr functions can take a regex as a pattern.
#str_detect() indicates whether a pattern is present in a string.
#The main difference between a regex and a regular string is that a regex can include special characters.
#The | symbol inside a regex means "or".
#Use '\\d' to represent digits. The backlash is used to distinguish it from the character 'd'. In R, you must use two backslashes for digits in regular expressions; in some other languages, you will only use one backslash for regex special characters.
#str_view() highlights the first occurrence of a pattern, and the str_view_all() function highlights all occurrences of the pattern.

library(tidyverse)
library(dslabs)
library(rvest)


url <- "https://en.wikipedia.org/w/index.php?title=Gun_violence_in_the_United_States_by_state&direction=prev&oldid=810166167"
murders_raw <- read_html(url) %>%
  html_nodes("table") %>%
  html_table() %>%
  .[[1]] %>%
  setNames(c("state", "population", "total", "murder_rate"))

data("reported_heights")

#detect whether a comma is present
pattern <- ","
str_detect("2,3", pattern)
#[1] TRUE
str_detect(murders_raw$total, pattern)
# [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [28] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE

# show the subset of strings including "cm"
str_subset(reported_heights$height, "cm")
#[1] "165cm"  "170 cm"

# use the "or" symbol inside a regex (|)
yes <- c("180 cm", "70 inches")
no <- c("180", "70''")
s <- c(yes, no)
s
#[1] "180 cm"    "70 inches" "180"       "70''"
str_detect(s, "cm") | str_detect(s, "inches")
#[1]  TRUE  TRUE FALSE FALSE
str_detect(s, "cm|inches")
#[1]  TRUE  TRUE FALSE FALSE

pattern <- "\\d"
# highlight the first occurrence of a pattern
str_view(s, pattern)
# [1] │ <1><8><0> cm
# [2] │ <7><0> inches
# [3] │ <1><8><0>
# [4] │ <7><0>''
# highlight all instances of a pattern
str_view_all(s, pattern)
# [1] │ <1><8><0> cm
# [2] │ <7><0> inches
# [3] │ <1><8><0>
# [4] │ <7><0>''

#
#
#Define strings to test your regular expressions, including some elements that match and some that do not. This allows you to check for the two types of errors: failing to match and matching incorrectly.
#Square brackets define character classes: groups of characters that count as matching the pattern. You can use ranges to define character classes, such as [0-9] for digits and [a-zA-Z] for all letters.
#Anchors define patterns that must start or end at specific places. ^ and $ represent the beginning and the end of the string respectively.
#Curly braces are quantifiers that state how many times a certain character can be repeated in the pattern. \\d{1,2} matches exactly 1 or 2 consecutive digits.

yes <- c("5", "6", "5'10", "5 feet", "4'11")
no <- c("", ".", "Five", "six")
s <- c(yes, no)
pattern <- "\\d"

# [56] means 5 or 6
str_view(s, "[56]")
# [1] │ <5>
# [2] │ <6>
# [3] │ <5>'10
# [4] │ <5> feet

# [4-7] means 4, 5, 6 or 7
yes <- as.character(4:7)
no <- as.character(1:3)
s <- c(yes, no)
str_view(s, "[4-7]")
# [1] │ <4>
# [2] │ <5>
# [3] │ <6>
# [4] │ <7>
str_detect(s, "[4-7]")
#[1]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALS

# ^ means start of string, $ means end of string
pattern <- "^\\d$"  #It does mean that one digit and it has to be start and end with. (Even no space)
yes <- c("1", "5", "9")
no <- c("12", "1c", " 1", "a4", "b", "1b3")
s <- c(yes, no)
str_view(s, pattern)
# [1] │ <1>
# [2] │ <5>
# [3] │ <9>

# curly braces define quantifiers: 1 or 2 digits 
pattern <- "^\\d{1,2}$"  #It does mean that one digit and has to be start and end with. (Even no space)
yes <- c("1", "5", "9")
no <- c("12", "1c", " 1", "a4", "b", "1b3")
str_view(c(yes,no), pattern)
# [1] │ <1>
# [2] │ <5>
# [3] │ <9>
# [4] │ <12> #notice that, now, "12" has been counted

pattern <-  "^\\d[a-z]\\d$|^\\d{1,2}$"
yes <- c("1", "5", "9")
no <- c("12", "1c", " 1", "a4", "b", "1b3")
str_view(c(yes,no), pattern)
# [1] │ <1>
# [2] │ <5>
# [3] │ <9>
# [4] │ <12>
# [9] │ <1b3>

# combining character class, anchors and quantifier
pattern <- "^[4-7]'\\d{1,2}\"$"
yes <- c("5'7\"", "6'2\"",  "5'12\"")
no <- c("6,2\"", "6.2\"","I am 5'11\"", "3'2\"", "64")
str_detect(yes, pattern)
#[1] TRUE TRUE TRUE
str_detect(no, pattern)
#[1] FALSE FALSE FALSE FALSE FALSE
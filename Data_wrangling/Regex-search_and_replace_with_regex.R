#Objectives, notes from the textbook
#str_replace() replaces the first instance of the detected pattern with a specified string.
#Spaces are characters and R does not ignore them. Spaces are specified by the special character \\s.
#Additional quantifiers include *, + and ?. * means 0 or more instances of the previous character. ? means 0 or 1 instances. + means 1 or more instances.
#Before removing characters from strings with functions like str_replace() and str_replace_all(), consider whether that replacement would have unintended effects.

library(tidyverse)
library(dslabs)
data("reported_heights")

not_inches <- function(x, smallest = 50, tallest =84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

problems <- reported_heights %>% filter(not_inches(height)) %>% .$height


# number of entries matching our desired pattern
pattern <- "^[4-7]'\\d{1,2}\"$"
sum(str_detect(problems, pattern))
#[1] 14

# inspect examples of entries with problems
problems[c(2, 10, 11, 12, 15)] %>% str_view(pattern)
str_subset(problems, "inches")
#[1] "5 feet and 8.11 inches" "Five foot eight inches" "5 feet 7inches"         "5ft 9 inches"           "5 ft 9 inches"          "5 feet 6 inches" 
str_subset(problems, "''")
#[1] "5'9''"   "5'10''"  "5'10''"  "5'3''"   "5'7''"   "5'6''"   "5'7.5''" "5'7.5''" "5'10''"  "5'11''"  "5'10''"  "5'5''"  

# replace or remove feet/inches words before matching
pattern <- "^[4-7]'\\d{1,2}$"
problems %>% 
  str_replace("feet|ft|foot", "'") %>% # replace feet, ft, foot with ' 
  str_replace("inches|in|''|\"", "") %>% # remove all inches symbols
  str_detect(pattern) %>% 
  sum()
#[1] 48

# R does not ignore whitespace
identical("Hi", "Hi ")
#[1] FALSE

# \\s represents whitespace
pattern_2 <- "^[4-7]'\\s\\d{1,2}\"$"
str_subset(problems, pattern_2)
#[1] "5' 4\""  "5' 11\"" "5' 7\"" 

# * means 0 or more instances of a character
yes <- c("AB", "A1B", "A11B", "A111B", "A1111B")
no <- c("A2B", "A21B")
str_detect(yes, "A1*B")
str_detect(no, "A1*B")

# test how *, ? and + differ
data.frame(string = c("AB", "A1B", "A11B", "A111B", "A1111B"),
           none_or_more = str_detect(yes, "A1*B"),
           nore_or_once = str_detect(yes, "A1?B"),
           once_or_more = str_detect(yes, "A1+B"))
# string none_or_more nore_or_once once_or_more
# 1     AB         TRUE         TRUE        FALSE
# 2    A1B         TRUE         TRUE         TRUE
# 3   A11B         TRUE        FALSE         TRUE
# 4  A111B         TRUE        FALSE         TRUE
# 5 A1111B         TRUE        FALSE         TRUE

# update pattern by adding optional spaces before and after feet symbol
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
problems %>% 
  str_replace("feet|ft|foot", "'") %>% # replace feet, ft, foot with ' 
  str_replace("inches|in|''|\"", "") %>% # remove all inches symbols
  str_detect(pattern) %>% 
  sum()
#[1] 53
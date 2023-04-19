#Objectives, notes from the textbook
#In the raw heights data, many students did not report their height as the number of inches as requested. There are many entries with real height information but in the wrong format, which we can extract with string processing.
#When there are both text and numeric entries in a column, the column will be a character vector. Converting this column to numeric will result in NAs for some entries.
#To correct problematic entries, look for patterns that are shared across large numbers of entries, then define rules that identify those patterns and use these rules to write string processing tasks.
#Use suppressWarning() to hide warning messages for a function.
library(tidyverse)
library(dslabs)
data("reported_heights")
class(reported_heights$height)
#[1] "character"

#convert to numeric, inspect, count NAs
X <- as.numeric(reported_heights$height)
head(X)
#[1] 75 70 68 74 61 65
sum(is.na(X))
#[1] 81

#keep only entries that result in NAs
reported_heights %>% mutate(new_height = as.numeric(height)) %>%
  filter(is.na(new_height)) %>% 
  head(10)
# time_stamp    sex                 height new_height
# 1  2014-09-02 15:16:28   Male                  5' 4"         NA
# 2  2014-09-02 15:16:37 Female                  165cm         NA
# 3  2014-09-02 15:16:52   Male                    5'7         NA
# 4  2014-09-02 15:16:56   Male                  >9000         NA
# 5  2014-09-02 15:16:56   Male                   5'7"         NA
# 6  2014-09-02 15:17:09 Female                   5'3"         NA
# 7  2014-09-02 15:18:00   Male 5 feet and 8.11 inches         NA
# 8  2014-09-02 15:19:48   Male                   5'11         NA
# 9  2014-09-04 00:46:45   Male                  5'9''         NA
# 10 2014-09-04 10:29:44   Male                 5'10''         NA

#calculate cutoffs that cover 99.999% of human population
#Check the male and female M and SD
alpha <- 1/10^6
qnorm(1-alpha/2, 69.1, 2.9)
#[1] 83.28575
qnorm(alpha/2, 63.7,2.7)
#[1] 50.49258

#keep only entries that either result in NAs or are outside the plausible range of heights
not_inches <- function(x, smallest = 50, tallest =84){
  inches <- suppressWarnings(as.numeric(X))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

#number of problematic entries
problems <- reported_heights %>% filter(not_inches(height)) %>% .$height
problems[1:10]
#[1] "6"      "5' 4\"" "5.3"    "165cm"  "511"    "6"      "2"      "5'7"    ">9000"  "5'7\"" 
length(problems)
#[1] 292

#
#10 examples of x'y or x'y" or x'y\"
pattern <- "^\\d\\s*'\\s*\\d{1,2}\\.*\\d*'*\"*$"
str_subset(problems, pattern) %>% head(n=10) %>% cat

# 10 examples of x.y or x,y
pattern <- "^[4-6]\\s*[\\.|,]\\s*([0-9]|10|11)$"
str_subset(problems, pattern) %>% head(n=10) %>% cat
#5.3 5.5 6.5 5.8 5.6 5,3 5.9 6,8 5.5 6.2

# 10 examples of entries in cm rather than inches
ind <- which(between(suppressWarnings(as.numeric(problems))/2.54, 54, 81) )
ind <- ind[!is.na(ind)]
problems[ind] %>% head(n=10) %>% cat
#150 175 177 178 163 175 178 165 165 180
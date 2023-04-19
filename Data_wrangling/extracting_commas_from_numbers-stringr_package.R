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
murders_raw %>% summarize_all(funs(commas))

#replace commas with the empty string and convert to mumeric
murders_raw$population
# [1] "4,853,875"  "737,709"    "6,817,565"  "2,977,853"  "38,993,940" "5,448,819"  "3,584,730"  "944,076"   
# [9] "670,377"    "20,244,914" "10,199,398" "1,425,157"  "1,652,828"  "12,839,047" "6,612,768"  "3,121,997" 
# [17] "2,906,721"  "4,424,611"  "4,668,960"  "1,329,453"  "5,994,983"  "6,784,240"  "9,917,715"  "5,482,435" 
# [25] "2,989,390"  "6,076,204"  "1,032,073"  "1,893,765"  "2,883,758"  "1,330,111"  "8,935,421"  "2,080,328" 
# [33] "19,747,183" "10,035,186" "756,835"    "11,605,090" "3,907,414"  "4,024,634"  "12,791,904" "1,055,607" 
# [41] "4,894,834"  "857,919"    "6,595,056"  "27,429,639" "2,990,632"  "626,088"    "8,367,587"  "7,160,290" 
# [49] "1,841,053"  "5,767,891"  "586,107"   
test_1 <- str_replace_all(murders_raw$population, ",","")
test_1
# [1] "4853875"  "737709"   "6817565"  "2977853"  "38993940" "5448819"  "3584730"  "944076"   "670377"   "20244914"
# [11] "10199398" "1425157"  "1652828"  "12839047" "6612768"  "3121997"  "2906721"  "4424611"  "4668960"  "1329453" 
# [21] "5994983"  "6784240"  "9917715"  "5482435"  "2989390"  "6076204"  "1032073"  "1893765"  "2883758"  "1330111" 
# [31] "8935421"  "2080328"  "19747183" "10035186" "756835"   "11605090" "3907414"  "4024634"  "12791904" "1055607" 
# [41] "4894834"  "857919"   "6595056"  "27429639" "2990632"  "626088"   "8367587"  "7160290"  "1841053"  "5767891" 
# [51] "586107"  
test_1 <- as.numeric(test_1)
test_1
# [1]  4853875   737709  6817565  2977853 38993940  5448819  3584730   944076   670377 20244914 10199398  1425157
# [13]  1652828 12839047  6612768  3121997  2906721  4424611  4668960  1329453  5994983  6784240  9917715  5482435
# [25]  2989390  6076204  1032073  1893765  2883758  1330111  8935421  2080328 19747183 10035186   756835 11605090
# [37]  3907414  4024634 12791904  1055607  4894834   857919  6595056 27429639  2990632   626088  8367587  7160290
# [49]  1841053  5767891   586107

#parse_number also removes commas and converts to numeric
test_2 <- parse_number(murders_raw$population)
identical(test_1, test_2)
#[1] TRUE

murders_new <- murders_raw %>% mutate_at(2:3, parse_number)
murders_new %>% head
# state      population total murder_rate
# <chr>           <dbl> <dbl>       <dbl>
#   1 Alabama       4853875   348         7.2
# 2 Alaska         737709    59         8  
# 3 Arizona       6817565   309         4.5
# 4 Arkansas      2977853   181         6.1
# 5 California   38993940  1861         4.8
# 6 Colorado      5448819   176         3.2
#Objectives, notes from the textbooks
#Dates are a separate data type in R. The 'tidyverse' includes functionality for dealing with dates through the 'lubridate' package.
#Extract the year, month and day from a date object with the year(), month() and day() functions.
#Parsers convert strings into dates with the standard YYYY-MM-DD format(ISO 8601 format).
#Use the parser with the name corresponding to the string format of year, month and day (ymd(), ydm(), myd(), mdy(), dmy(), dym()).
#Get the current time with the Sys.time() function. Use the now() function instead to specify a time zone.
#You can extract values from time objects with the hour(), minute() and second() functions.
#Parsers convert strings into times (for example, hms()). Parsers can also create conbined date-time objects (for example, mdy_hms()).

library(tidyverse)
library(dslabs)
data("polls_us_election_2016")
polls_us_election_2016$startdate %>% head
#[1] "2016-11-03" "2016-11-01" "2016-11-02" "2016-11-04" "2016-11-03" "2016-11-03"
class(polls_us_election_2016$startdate)
#[1] "Date"
as.numeric(polls_us_election_2016$startdate) %>% head
#[1] 17108 17106 17107 17109 17108 17108

#ggplot is aware of dates
polls_us_election_2016 %>% filter(pollster == "Ipsos" & state =="U.S.") %>%
  ggplot(aes(startdate, rawpoll_trump)) +
  geom_line()

#lubridate: the tidyverse date package
library(lubridate)

#select some random dates from polls
set.seed(2)
dates <- sample(polls_us_election_2016$startdate, 10) %>% sort
dates
# [1] "2016-01-19" "2016-08-06" "2016-08-26" "2016-09-09" "2016-09-14" "2016-09-16" "2016-09-29" "2016-10-04"
# [9] "2016-10-12" "2016-10-23"

#extract month, day, year from date strings
data.frame(date = dates,
           month = month(dates),
           day = day(dates),
           year = year(dates))
# date month day year
# 1  2016-01-19     1  19 2016
# 2  2016-08-06     8   6 2016
# 3  2016-08-26     8  26 2016
# 4  2016-09-09     9   9 2016
# 5  2016-09-14     9  14 2016
# 6  2016-09-16     9  16 2016
# 7  2016-09-29     9  29 2016
# 8  2016-10-04    10   4 2016
# 9  2016-10-12    10  12 2016
# 10 2016-10-23    10  23 2016

#extract month label
month(dates, label = TRUE)
# [1] 1  8  8  9  9  9  9  10 10 10
# Levels: 1 < 2 < 3 < 4 < 5 < 6 < 7 < 8 < 9 < 10 < 11 < 12

#ymd works on mixed date styles
x <- c(20090101, "2009-01-02", "2009 01 03", "2009-1-4", "2009-1, 5", "Created on 2009 1 6", "200901 !!! 07")
ymd(x)
#[1] "2009-01-01" "2009-01-02" "2009-01-03" "2009-01-04" "2009-01-05" "2009-01-06" "2009-01-07"

#different parsers extract year, month and day in different orders
y <- "09/01/02" #default for this is ymd
ymd(y) 
#[1] "2009-01-02"
mdy(y)
#[1] "2002-09-01"
ydm(y)
myd(y)
dmy(y)
dym(y)

#recall current time in your time zone
now()
#[1] "2023-04-19 16:30:21 KST"
now("GMT") # current time in GMT
#[1] "2023-04-19 07:30:41 GMT"
now() %>% hour()    # current hour
#[1] 16
now() %>% minute()    # current minute
#[1] 31
now() %>% second()    # current second
#[1] 19.23956

#parse time
z <- ("12:34:56")
hms(z)
#[1] "12H 34M 56S"

z2 <- "Nov/2/2012 12:34:56"
mdy_hms(z2)
#[1] "2012-02-20 12:34:56 UTC"
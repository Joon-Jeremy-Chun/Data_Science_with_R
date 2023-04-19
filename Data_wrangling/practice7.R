library(dslabs)
library(lubridate)
options(digits = 3)    # 3 significant digits

data(brexit_polls)
#
x <- month(brexit_polls$startdate, label = TRUE)
x
sum(x == 4)
#
sum(round_date(brexit_polls$enddate, unit = "week") == "2016-06-12")
#
y <- table(weekdays(brexit_polls$enddate))

#
#
data(movielens)
class(movielens$timestamp)
z <- as_datetime(movielens$timestamp)
class(z)
#
a <- data.frame(year = year(z))
table(a)
#
b <- data.frame(hours = hour(z))
table(b)


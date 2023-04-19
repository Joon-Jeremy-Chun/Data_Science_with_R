#Objectives, notes from the textbook
#The extract() function behaves similarly to the separate() function but allows extraction of groups from regular expressions.

# first example - normally formatted heights
s <- c("5'10", "6'1")
tab <- data.frame(x = s)

# the separate and extract functions behave similarly
tab %>% separate(x, c("feet", "inches"), sep = "'")
# feet inches
# 1    5     10
# 2    6      1
tab %>% extract(x, c("feet", "inches"), regex = "(\\d)'(\\d{1,2})")
# feet inches
# 1    5     10
# 2    6      1

# second example - some heights with unusual formats
s <- c("5'10", "6'1\"","5'8inches")
tab <- data.frame(x = s)

# separate fails because it leaves in extra characters, but extract keeps only the digits because of regex groups
tab %>% separate(x, c("feet","inches"), sep = "'", fill = "right")
# feet  inches
# 1    5      10
# 2    6      1"
# 3    5 8inches
tab %>% extract(x, c("feet", "inches"), regex = "(\\d)'(\\d{1,2})")
# feet inches
# 1    5     10
# 2    6      1
# 3    5      8
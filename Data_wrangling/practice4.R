#Load the Major League Baseball payrolls in to R:
#https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm
library(tidyverse)
library(dslabs)
library(rvest)
library(data.table)
url <- "https://web.archive.org/web/20181024132313/http://www.stevetheump.com/Payrolls.htm"
h <- read_html(url)

nodes <- html_nodes(h, "table")

#example
html_text(nodes[8])

#If the content of this object is an html table, we can use the html_table() function to convert it to a data frame:
html_table(nodes[[8]])
class(html_table(nodes[[8]]))

tab1 <- html_table(nodes[1])
tab1
tab2 <- html_table(nodes[2])
tab2
tab3 <- html_table(nodes[3])
tab3
tab4 <- html_table(nodes[4])
tab4

sapply(nodes[1:4], html_table)
sapply(nodes[19:21], html_table)

#
tab_1 <- html_table(nodes[[10]])
class(tab_1)
tab_2 <- html_table(nodes[[19]])
#remove the first row
tab_1 <- tab_1[-1,2:4] 
tab_2 <- tab_2[-1,]

# colnames(tab_1)[1] = "Team" ....
# or
setnames(tab_1, old = c('X2','X3','X4'), new = c("Team", "Payroll", "Average"))
setnames(tab_2, old = c('X1','X2','X3'), new = c("Team", "Payroll", "Average"))

tab_f <- full_join(tab_1, tab_2, by = "Team")

#
#

url <- "https://en.wikipedia.org/w/index.php?title=Opinion_polling_for_the_United_Kingdom_European_Union_membership_referendum&oldid=896735054"
h <- read_html(url)
tab <- html_nodes(h, "table")
#length(tab)

#tab_1 <- html_table(tab[[1]], fill=TRUE)
sapply(tab[0:10], html_table, fill=TRUE)

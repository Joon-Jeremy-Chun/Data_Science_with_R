library(stringr)

fn <- system.file("extdata", "RD-Mortality-Report_2015-18-180531.pdf", package="dslabs")
system("cmd.exe", input = paste("start", fn))

#install.packages("pdftools")
library(pdftools)
txt <- pdf_text(fn)
txt

x <- str_split(txt[[9]], "\n")
x
length(x)

s <- x[[1]]
class(s)
length(s)

s[1]
s1 <- str_trim(s)
s1[1]
s <- s1

header_index <- str_which(s, "2015")[1]
header_index

tmp <- str_split(s[header_index], "\\s+", simplify = TRUE)
tmp
month <- tmp[1]
header <- tmp[-1]
header[3]

s
tail_index  <- str_which(s, "Total")
tail_index

n <- str_count(s, "\\d+")
sum(n == 1)

out <- c(1:header_index, which(n==1), tail_index:length(s))
s <- s[-out]
length(s)
st <- s
stt <- str_remove_all(st, "[^\\d\\s]")
stt
s <- stt

s <- str_split_fixed(s, "\\s+", n = 6)[,1:5]
s
class(s)
n2017f <- s[20:30,4]
mean(as.numeric(n2017f))

tab <- s %>% 
  as_data_frame() %>% 
  setNames(c("day", header)) %>%
  mutate_all(as.numeric)
mean(tab$"2015")

tab

tab <- tab %>% gather(year, deaths, -day) %>%
  mutate(deaths = as.numeric(deaths))
tab

tab %>% filter(year < 2018) %>% 
  ggplot(aes(day, deaths, color = year)) +
  geom_line() +
  geom_vline(xintercept = 20) +
  geom_point()

#Objectives-from the text book
#readr is the tidyverse library that includes functions for reading data stored in text file spreadsheets into R. Functions in the package include read_csv(), read_tsv(), read_delim() and more. These differ by the delimiter they use to split columns.

library(dslabs)
library(tidyverse) #includes readr
library(readxl)

#inspect the first 3 lines
read_lines("murders.csv", n_max = 3)

#
filename <- "murders.csv"
path <- system.file("extdata", package = "dslabs")
fullpath <- file.path(path, filename)

#read file in csv format
dat <- read_csv(filename)

#read using full path
dat <- read_csv(fullpath)
head(dat)

#Ex):
path <- system.file("extdata", package = "dslabs")
files <- list.files(path)
files

filename2 <- "HRlist2.txt"

dat2 = read.table(file.path(path, filename2))
dat2


#R-base import functions (read.csv(), read.table(), read.delim()) generate data frames rather than tibbles.
dat3 <- read.csv(filename)
class(dat3$abb)
#[1] "character"
class(dat3$region)
#[1] "character"
library(dslabs)

getwd()
#setwd()
filename <- "murders.csv"
path <- system.file("extdata", package = "dslabs")

#1
file.copy(file.path(path, "murders.csv"), getwd())
#[1] TRUE
#copy in the current folder

#2
#setwd("C:/XXX.../data")
file.copy(file.path(path, filename), getwd())
#[1] TRUE
#copy in the current folder .../data
list.files()
#[1] "murders.csv"

#3
file.copy(file.path(path, "murders.csv"), file.path(getwd(), "data"))
#[1] TRUE
#copy in the data folder where sub of current one

#4
file.location <- file.path(system.file("extdata", package = "dslabs"), "murders.csv")
file.destination <- file.path(getwd(), "data")
file.copy(file.location, file.destination)
#[1] TRUE
#copy in that file in the assign path

#
#

path
list.files(path)
file.copy(file.path(path, "HRlist2.txt"), file.path(getwd(), "data"))

dat2 <- read_delim(file.path(path, "HRlist2.txt"))
dat3 <- read.csv(file.path(path, "HRlist2.txt"))
dat4 <- read_csv(file.path(path, "HRlist2.txt"))
dat5 <- read_csv(file.path(path, "HRlist2.txt"), col_name = TRUE)

#
#

url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"
dat1 <- read_table(url)
dat2 <- read_csv(url)
dat3 <- read_csv2(url)
dat4 <- read_tsv(url)

dat2 <- read_csv(url, col_names = FALSE)

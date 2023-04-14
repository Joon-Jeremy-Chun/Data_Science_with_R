library(dslabs)

getwd()
#setwd()
filename <- "murders.csv"
path <- system.file("extdata", package = "dslabs")

#1
file.copy(file.path(path, "murders.csv"), getwd())
#[1] FALSE

#2
#setwd("C:/XXX.../data")
file.copy(file.path(path, filename), getwd())
#[1] TRUE
list.files()
#[1] "murders.csv"

#3
file.copy(file.path(path, "murders.csv"), file.path(getwd(), "data"))
#[1] TRUE

#4
file.location <- file.path(system.file("extdata", package = "dslabs"), "murders.csv")
file.destination <- file.path(getwd(), "data")
file.copy(file.location, file.destination)
#[1] FALSE
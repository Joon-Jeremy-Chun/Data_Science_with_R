# To see working directory
getwd()

# change your working directory
setwd()

# set path to the location for raw data files in the dslabs package and list files

system.file("extdata", package = "dslabs")

path <- system.file("extdata", package = "dslabs") # assign the location in 'the path'

#see the list of files
list.files(path)


#generate a full path to a file
filename <- "murders.csv"
fullpath <- file.path(path, filename)
fullpath

# copy file from dslabs package to your working directory
file.copy(fullpath, getwd())

# check
file.exists(filename)
#[1] TRUE
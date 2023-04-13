# To see working directory
getwd()

# change your working directory
setwd()

# set path to the location for raw data files in the dslabs package and list files

system.file("extdata", package = "dslabs")

path <- system.file("extdata", package = "dslabs") # assign the location in 'the path'

#see the list of files
list.files(path)



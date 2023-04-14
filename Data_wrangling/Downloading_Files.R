#Objectives - textbook
#The read_csv() function and other import functions can read a URL directly.
#If you want to have a local copy of the file, you can use download.file().
#tempdir() creates a directory with a name that is very unlikely not to be unique.
#tempfile() creates a character string that is likely to be a unique filename.

#assign the web address to 'url'
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"
dat <- read_csv(url)

tempfile()
#[1] "C:\\Users\\xxx\\xxx\\Local\\Temp\\RtmpSkoMDI\\file507011b31986"
tempfile()
#[1] "C:\\Users\\xxx\\xxx\\Local\\Temp\\RtmpSkoMDI\\file5070110ab3"

#in order to save and remove
tmp_filename <- tempfile()
download.file(url, tmp_filename)
dat <- read.csv(tmp_filename)
file.remove(tmp_filename)
#[1] TRUE
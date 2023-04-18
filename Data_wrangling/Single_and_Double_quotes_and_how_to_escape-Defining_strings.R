#Objectives, notes from the textbook
#Define a string by surrounding text with either single quotes or double quotes.
#To include a single quote inside a string, use double quotes on the outside. To include a double quote inside a string, use single quotes on the outside.
#The cat() function displays a string as it is represented inside R.
#To include a double quote inside of a string surrounded by double quotes, use the backslash(\) to escape the double quote. Escape a single quote to include it inside of a string defined by single quotes.

#Examples
s1 <- "Hello!"
s2 <- "Hello!"
s3 <- `Hello!`
#Error: object 'Hello!' not found

#s4 <- "10"" #this will gives error
s5 <- '10"'
#store the value as "10\""
cat(s5)
#10"

s6 <- "10'"
cat(s6)
#10'

#to include both single and double quotes in string, escape with \
#s7 <- '5'10"' #error
#s8 <- "5'10"" #error
s9 <- '5\'10"'
cat(s9)
#5'10"
s10 <- "5'10\""
cat(s10)
#5'10"
#Objectives, note from the textbook
#The join functions in the 'dplyr' package combine two tables such that matching rows are together.
#left_join() only keeps rows that have information in the 'first' table.
#right_join() only keeps rows that have information in the 'second' table.
#inner_join() only keeps rows that have information in both tables.
#full_join() keeps all rows from both tables.
#semi_join() keeps the part of the first table for which we have information in the second.
#anti_join() keeps the elements of the first table for which there is no information in the second.

library(tidyverse)
library(ggrepel)
library(dslabs)
ds_theme_set()
data(murders)
head(murders)

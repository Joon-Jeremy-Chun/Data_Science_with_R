#Plots in ggplot2 consist of 3 main components:
#Data: The dataset being summarized
#Geometry: The type of plot (scatterplot, boxplot, barplot, histogram, qqplot, smooth density, etc.)
#Aesthetic mapping: Variables mapped to visual cues, such as x-axis and y-axis values and color

#There are additional components:
#Scale
#Labels, Title, Legend
#Theme/Style

#Three commands that associate a dataset x with a ggplot

#ggplot(data = x)
#ggplot(x)
#x %>% ggplot()

library(tidyverse)
library(dslabs)
data(murders)

ggplot(data = murders) #associate a dataset with a ggplot

murders %>% ggplot()

p <- ggplot(data = murders)
class(p)
print(p)

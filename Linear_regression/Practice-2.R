#Practice2
set.seed(1989, sample.kind="Rounding") #if you are using R 3.6 or later
library(HistData)
data("GaltonFamilies")
options(digits = 3)    # report 3 significant digits

female_heights <- GaltonFamilies %>%     
  filter(gender == "female") %>%     
  group_by(family) %>%     
  sample_n(1) %>%     
  ungroup() %>%     
  select(mother, childHeight) %>%     
  rename(daughter = childHeight)

#linMD <- lm(daughter ~ mother, data = female_heights)
linMD <- lm(mother ~ daughter, data = female_heights)
linMD
predict(linMD)[1]
female_heights$mother[1]

#Objectives;
#How to use the functions 'summarize()', 'group_by()', and 'arrange()'-sorting.
#How to use the 'quantile()' function
#How to use the 'dot' operator

library(dplyr)
library(dslabs)


# practice with 'heights data'
data(heights)

#looks thought the first 5 data
heights %>% head(5)
#    sex height
# 1 Male     75
# 2 Male     70
# 3 Male     68
# 4 Male     74
# 5 Male     61

#finding mean and sd 
heights %>% summarize(average = mean(height), standard_deviation = sd(height))
#    average standard_deviation
# 1 68.32301           4.078617

#finding mean and sd of Female
heights %>% filter(sex == "Female") %>% summarize(average = mean(height), standard_deviation = sd(height))
#    average standard_deviation
# 1 64.93942           3.760656


#usage of quantile function
heights %>%
  filter(sex == "Female") %>%
  summarize(minimum = min(height), median = median(height), maximum = max(height))
#   minimum   median maximum
# 1      51 64.98031      79

heights %>%
  filter(sex == "Female") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))
#      range
# 1 51.00000
# 2 64.98031
# 3 79.00000


#Group then summarize with 'group_by()'
heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))
#    sex    average standard_deviation
#    <fct>    <dbl>              <dbl>
# 1 Female    64.9               3.76
# 2 Male      69.3               3.61

heights %>%
  group_by(sex) %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))
# sex    range
# <fct>  <dbl>
#   1 Female  51  
# 2 Female  65.0
# 3 Female  79  
# 4 Male    50  
# 5 Male    69  
# 6 Male    82.7


#Sorting data frames
data(murders)
#defaults; ascending order
murders %>%
  arrange(population) %>%
  head(10)
#                   state abb        region population total
# 1               Wyoming  WY          West     563626     5
# 2  District of Columbia  DC         South     601723    99
# 3               Vermont  VT     Northeast     625741     2
# 4          North Dakota  ND North Central     672591     4
# 5                Alaska  AK          West     710231    19
# 6          South Dakota  SD North Central     814180     8
# 7              Delaware  DE         South     897934    38
# 8               Montana  MT          West     989415    12
# 9          Rhode Island  RI     Northeast    1052567    16
# 10        New Hampshire  NH     Northeast    1316470     5

#'desc()'
murders %>%
  arrange(desc(population)) %>%
  head(10)
#             state abb        region population total
# 1      California  CA          West   37253956  1257
# 2           Texas  TX         South   25145561   805
# 3         Florida  FL         South   19687653   669
# 4        New York  NY     Northeast   19378102   517
# 5        Illinois  IL North Central   12830632   364
# 6    Pennsylvania  PA     Northeast   12702379   457
# 7            Ohio  OH North Central   11536504   310
# 8         Georgia  GA         South    9920000   376
# 9        Michigan  MI North Central    9883640   413
# 10 North Carolina  NC         South    9535483   286


#Nested sorting
murders %>%
  arrange(region, population) %>%
  head(10)
#                   state abb    region population total
# 1               Vermont  VT Northeast     625741     2
# 2          Rhode Island  RI Northeast    1052567    16
# 3         New Hampshire  NH Northeast    1316470     5
# 4                 Maine  ME Northeast    1328361    11
# 5           Connecticut  CT Northeast    3574097    97
# 6         Massachusetts  MA Northeast    6547629   118
# 7            New Jersey  NJ Northeast    8791894   246
# 8          Pennsylvania  PA Northeast   12702379   457
# 9              New York  NY Northeast   19378102   517
# 10 District of Columbia  DC     South     601723    99

#The top n
murders %>% top_n(10, population)
#             state abb        region population total
# 1      California  CA          West   37253956  1257
# 2         Florida  FL         South   19687653   669
# 3         Georgia  GA         South    9920000   376
# 4        Illinois  IL North Central   12830632   364
# 5        Michigan  MI North Central    9883640   413
# 6        New York  NY     Northeast   19378102   517
# 7  North Carolina  NC         South    9535483   286
# 8            Ohio  OH North Central   11536504   310
# 9    Pennsylvania  PA     Northeast   12702379   457
# 10          Texas  TX         South   25145561   805


#The dot operator
#The pipe operator does not keep naming new objects. So, we can use dot operator
Y <- murders %>%
  filter(region == 'West') %>%
  mutate(rate = total / population * 10^5)
print(Y)
#         state abb region population total      rate
# 1      Alaska  AK   West     710231    19 2.6751860
# 2     Arizona  AZ   West    6392017   232 3.6295273
# 3  California  CA   West   37253956  1257 3.3741383
# 4    Colorado  CO   West    5029196    65 1.2924531
# 5      Hawaii  HI   West    1360301     7 0.5145920
# 6       Idaho  ID   West    1567582    12 0.7655102
# 7     Montana  MT   West     989415    12 1.2128379
# 8      Nevada  NV   West    2700551    84 3.1104763
# 9  New Mexico  NM   West    2059179    67 3.2537239
# 10     Oregon  OR   West    3831074    36 0.9396843
# 11       Utah  UT   West    2763885    22 0.7959810
# 12 Washington  WA   West    6724540    93 1.3829942
# 13    Wyoming  WY   West     563626     5 0.8871131


X  <- murders %>%
  filter(region == 'West') %>%
  mutate(rate = total / population * 10^5) %>%
  .$rate
print(X)
# [1] 2.6751860 3.6295273 3.3741383 1.2924531 0.5145920 0.7655102 1.2128379 3.1104763 3.2537239 0.9396843
# [11] 0.7959810 1.3829942 0.8871131
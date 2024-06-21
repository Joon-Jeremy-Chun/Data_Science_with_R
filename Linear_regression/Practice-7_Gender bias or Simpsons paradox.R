#For this set of exercises, we examine the data from a 2014 PNAS paper that analyzed success rates from funding agencies in the Netherlands External link and concluded:

#"our results reveal gender bias favoring male applicants over female applicants in the prioritization of their "quality of researcher" (but not "quality of proposal") evaluations and success rates, as well as in the language used in instructional and evaluation materials."

#A response was published a few months later titled No evidence that gender contributes to personal research funding success in The Netherlands: A reaction to Van der Lee and Ellemers External link, which concluded:

#However, the overall gender effect borders on statistical significance, despite the large sample. Moreover, their conclusion could be a prime example of Simpson’s paradox; if a higher percentage of women apply for grants in more competitive scientific disciplines (i.e., with low application success rates for both men and women), then an analysis across all disciplines could incorrectly show "evidence" of gender inequality. 

library(dslabs)
library(broom)
library(tidyr)
library(ggplot2)
data("research_funding_rates")
research_funding_rates

#Construct a two-by-two table of gender (men/women) by award status (awarded/not) using the total numbers across all disciplines.
total_men <- sum(research_funding_rates$applications_men)
total_women <- sum(research_funding_rates$applications_women)
men_awarded <- sum(research_funding_rates$awards_men)
women_awarded <- sum(research_funding_rates$awards_women)
not_aw_men <- total_men - men_awarded
not_aw_women <- total_women - women_awarded

totals <- research_funding_rates %>% select(-discipline) %>% summarize_all(sum) %>%
  summarize(men_awarded = awards_men,
            not_aw_man = applications_men - awards_men,
            women_awarded = awards_women,
            not_aw_women = applications_women - awards_women)

two_by_two <- data.frame(awarded = c("no", "yes"), 
                         men = c(totals$not_aw_man, totals$men_awarded),
                         women = c(totals$not_aw_women, totals$women_awarded))
per_aw_man <- men_awarded / total_men
per_aw_woman <- women_awarded / total_women

two_by_two %>% mutate(men = round(men/sum(men)*100, 1), women = round(women/sum(women)*100, 1))

#Run a chi-squared test External link on the two-by-two table to determine whether the difference in the two funding awarded rates is significant.

two_by_two <- matrix(c(men_awarded, not_aw_men, women_awarded, not_aw_women),
                     nrow = 2,
                     byrow = TRUE,
                     dimnames = list(c("Men", "Women"), c("Awarded", "Not Awarded")))

# Perform the chi-squared test
chi_test <- chisq.test(two_by_two)


chi_test_tidy <- tidy(chi_test)
#p.value 0.0509

#There may be an association between gender and funding. But can we infer causation here? Is gender bias causing this observed difference?

dat <- research_funding_rates %>% 
  mutate(discipline = reorder(discipline, success_rates_total)) %>%
  rename(success_total = success_rates_total,
         success_men = success_rates_men,
         success_women = success_rates_women) %>%
  pivot_longer(-discipline) %>%
  separate(name, c("type", "gender")) %>%
  pivot_wider(names_from = type, values_from = value) %>%
  filter(gender != "total")
dat

ggplot(dat, aes(x = discipline, y = success, color = gender, size = applications)) +
  geom_point() +
  labs(title = "Success Rates by Discipline and Gender",
       x = "Discipline",
       y = "Success Rate",
       color = "Gender",
       size = "Number of Applications") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# Regression, uncertainty and interpretation

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Progress from association and least squares to uncertainty, selection and causal interpretation.

## Suggested reading order

1. Read 1.1–1.7: baseball, family-height correlation, stratification and conditional regression.
2. Read 2.1–2.7: association, multivariable models, least squares and broom summaries; 2.6 now contains its own setup.
3. Inspect the 2.8 roster optimization as a separate application; 2.9–2.10 address regression to the mean and measurement error.
4. Finish 3.1–3.5: selection/spurious correlation, outliers, reversed interpretation, new confounding and Simpson examples; use Practice-1–7 for exercises.

## Data and prerequisites

HistData GaltonFamilies, Lahman baseball tables, dslabs falling-object/research-funding data and explicitly synthetic new references.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [1.1 Baseball Scatterplot of the relationship between two variables.R](1.1%20Baseball%20Scatterplot%20of%20the%20relationship%20between%20two%20variables.R) | A data frame with 2985 observations on the following 48 variables. | [Source inspected](1.1%20Baseball%20Scatterplot%20of%20the%20relationship%20between%20two%20variables.R) |
| [1.2 Correlation-father and son heights.R](1.2%20Correlation-father%20and%20son%20heights.R) | the data set | [Source inspected](1.2%20Correlation-father%20and%20son%20heights.R) |
| [1.3 Correlation-Baseball game.R](1.3%20Correlation-Baseball%20game.R) | Correlation coefficient between number of runs per game and number of at bate per game? | [Source inspected](1.3%20Correlation-Baseball%20game.R) |
| [1.4 Stratification and Variance Explained.R](1.4%20Stratification%20and%20Variance%20Explained.R) | Note from the textbook: | [Source inspected](1.4%20Stratification%20and%20Variance%20Explained.R) |
| [1.5 Bivariate Normal Distribution.R](1.5%20Bivariate%20Normal%20Distribution.R) | Note from the textbook: | [Source inspected](1.5%20Bivariate%20Normal%20Distribution.R) |
| [1.6 Two different regressionlines depending on Exxpectation....R](1.6%20Two%20different%20regressionlines%20depending%20on%20Exxpectation....R) | Note from the textbook: | [Source inspected](1.6%20Two%20different%20regressionlines%20depending%20on%20Exxpectation....R) |
| [1.7 Exercise with mother and daughter heights.R](1.7%20Exercise%20with%20mother%20and%20daughter%20heights.R) | means and standard deviations | [Source inspected](1.7%20Exercise%20with%20mother%20and%20daughter%20heights.R) |
| [2.1 Assciation is not causation.R](2.1%20Assciation%20is%20not%20causation.R) | From textbook summary | [Source inspected](2.1%20Assciation%20is%20not%20causation.R) |
| [2.10 Measurement Error Models - linear Regression - Parabola Eq.R](2.10%20Measurement%20Error%20Models%20-%20linear%20Regression%20-%20Parabola%20Eq.R) | Measurement Error Models | [Repaired / reference](2.10%20Measurement%20Error%20Models%20-%20linear%20Regression%20-%20Parabola%20Eq.R) |
| [2.2 Stratification and Multivariate regression.R](2.2%20Stratification%20and%20Multivariate%20regression.R) | Stratification and Multivariate Regression | [Repaired / reference](2.2%20Stratification%20and%20Multivariate%20regression.R) |
| [2.3 Linear Model explanaion.R](2.3%20Linear%20Model%20explanaion.R) | Linear Models | [Conceptual notes](2.3%20Linear%20Model%20explanaion.R) |
| [2.4 Least Squares Estimates-example function.R](2.4%20Least%20Squares%20Estimates-example%20function.R) | Least Squares Estimates (LSE) | [Repaired / reference](2.4%20Least%20Squares%20Estimates-example%20function.R) |
| [2.5 Least Squares Estimates(LSS) - lm() function in R.R](2.5%20Least%20Squares%20Estimates%28LSS%29%20-%20lm%28%29%20function%20in%20R.R) | When calling the lm() function, the variable that we want to predict is put to the left of the ~ symbol, and t | [Source inspected](2.5%20Least%20Squares%20Estimates%28LSS%29%20-%20lm%28%29%20function%20in%20R.R) |
| [2.6 Predicted Variables are Random Variables.R](2.6%20Predicted%20Variables%20are%20Random%20Variables.R) | Predicted Variables are Random Variables | [Repaired / reference](2.6%20Predicted%20Variables%20are%20Random%20Variables.R) |
| [2.7 Advanced dplyr-summarize with functions and broom.R](2.7%20Advanced%20dplyr-summarize%20with%20functions%20and%20broom.R) | key points from the textbook | [Source inspected](2.7%20Advanced%20dplyr-summarize%20with%20functions%20and%20broom.R) |
| [2.8 LP linear programming application - building a better offensive metric for baseball.R](2.8%20LP%20linear%20programming%20application%20-%20building%20a%20better%20offensive%20metric%20for%20baseball.R) | linear regression with two variables | [Repaired / reference](../docs/cases/baseball-roster/README.md) |
| [2.9 Regression Fallacy - sophomore slump.R](2.9%20Regression%20Fallacy%20-%20sophomore%20slump.R) | Regression can bring about errors in reasoning, especially when interpreting individual observations. | [Repaired / reference](2.9%20Regression%20Fallacy%20-%20sophomore%20slump.R) |
| [3.1 Correlation is Not Causation-Spurious Correlation.R](3.1%20Correlation%20is%20Not%20Causation-Spurious%20Correlation.R) | Summary from the text book | [Repaired / reference](3.1%20Correlation%20is%20Not%20Causation-Spurious%20Correlation.R) |
| [3.2 How to deal with Outliers - Spearman correlation.R](3.2%20How%20to%20deal%20with%20Outliers%20-%20Spearman%20correlation.R) | Correlations can be caused by outliers. | [Repaired / reference](3.2%20How%20to%20deal%20with%20Outliers%20-%20Spearman%20correlation.R) |
| [3.3 Reversing Cause and Effect - interpretation of the model.R](3.3%20Reversing%20Cause%20and%20Effect%20-%20interpretation%20of%20the%20model.R) | Another way association can be confused with causation is when the cause and effect are reversed. | [Repaired / reference](3.3%20Reversing%20Cause%20and%20Effect%20-%20interpretation%20of%20the%20model.R) |
| [3.4 Confounders - if changes in Z causes changes in both X and Y.R](3.4%20Confounders%20-%20if%20changes%20in%20Z%20causes%20changes%20in%20both%20X%20and%20Y.R) | New 2026 reference completing an empty lesson. Synthetic association is not causation. | [Repaired / reference](../docs/cases/confounding/README.md) |
| [3.5 Simpson's Paradox.R](3.5%20Simpson%27s%20Paradox.R) | New 2026 reference completing a placeholder; invented counts, no clinical interpretation. | [Repaired / reference](../docs/cases/simpson/README.md) |
| [Practice-1.R](Practice-1.R) | Practice-1 | [Repaired / reference](Practice-1.R) |
| [Practice-2.R](Practice-2.R) | linMD <- lm(daughter ~ mother, data = female_heights) | [Repaired / reference](Practice-2.R) |
| [Practice-3.R](Practice-3.R) | Practice-3 | [Source inspected](Practice-3.R) |
| [Practice-4.R](Practice-4.R) | Practice-4 | [Source inspected](Practice-4.R) |
| [Practice-5.R](Practice-5.R) | Filter the Teams data for the years 1961 to 2018 | [Source inspected](Practice-5.R) |
| [Practice-6.R](Practice-6.R) | Practice-6 | [Source inspected](Practice-6.R) |
| [Practice-7_Gender bias or Simpsons paradox.R](Practice-7_Gender%20bias%20or%20Simpsons%20paradox.R) | For this set of exercises, we examine the data from a 2014 PNAS paper that analyzed success rates from funding | [Repaired / reference](Practice-7_Gender%20bias%20or%20Simpsons%20paradox.R) |

## Results and limitations

Observational coefficients and funding differences do not establish causal effects or discrimination. Baseball roster costs are historical exercise inputs, not current player valuations. The p-hacking example creates 25 million rows and is excluded from routine execution.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.

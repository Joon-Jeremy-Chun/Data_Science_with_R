# Visualization and distribution checks

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Understand what axes, scales and quantiles mean before adding plot decoration.

## Suggested reading order

1. Read data types/density notes and calculate height summaries.
2. Read the grammar-of-graphics introduction, then add mappings, labels and customizations.
3. Compare empirical and normal quantiles in the QQ lesson; inspect the original R Markdown example separately.

## Data and prerequisites

dslabs heights and murders; built-in cars/pressure appear in the R Markdown template.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [section 1; data types, smooth density plots.R](section%201%3B%20data%20types%2C%20smooth%20density%20plots.R) | Types of data | [Source inspected](section%201%3B%20data%20types%2C%20smooth%20density%20plots.R) |
| [section 2; customizing plots.R](section%202%3B%20customizing%20plots.R) | In ggplot2, graphs are created by adding layers to the ggplot object: | [Source inspected](section%202%3B%20customizing%20plots.R) |
| [section 2; intro Grammar of Graphics plots(ggplots2).R](section%202%3B%20intro%20Grammar%20of%20Graphics%20plots%28ggplots2%29.R) | Plots in ggplot2 consist of 3 main components: | [Source inspected](section%202%3B%20intro%20Grammar%20of%20Graphics%20plots%28ggplots2%29.R) |
| [section 2; Quantile-Quantile Plots(QQ-plots).R](section%202%3B%20Quantile-Quantile%20Plots%28QQ-plots%29.R) | Objectives: To understand how to use Quantile-Quantile Plots(QQ-plots) | [Source inspected](section%202%3B%20Quantile-Quantile%20Plots%28QQ-plots%29.R) |

## Results and limitations

Sample standard deviation and the population-style divisor differ in the notes. A QQ plot is a diagnostic, not proof of normality. One R Markdown file records author Joon Jeremy Chun and date 2023-01-10; that date does not establish the period of the entire repository.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.

The [original R Markdown example](section%201-graphing%20examples.Rmd) records its own author/date; rendering requires rmarkdown/knitr and a suitable Pandoc installation.

# Data import, reshaping and text

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Trace how raw files and messy strings become typed, joined and tidy tables.

## Suggested reading order

1. Start with Data_import and Read_data, using resolved dslabs package paths.
2. Read Tidy_data, pivot_longer/pivot_wider, separate/unite, joins, binding and set operations.
3. Continue through reported heights, regex and dates. Treat web scraping/PDF extraction as source-specific exercises.
4. Use the new offline text counter before considering external tidytext sentiment lexicons.

## Data and prerequisites

dslabs package datasets/extdata, existing local examples under data/, historical Wikipedia/Wayback/recipe URLs, and a packaged mortality-report PDF.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [Binding.R](Binding.R) | Objectives, note from the text book | [Repaired / reference](Binding.R) |
| [Combining_tables.R](Combining_tables.R) | Objectives, note from the textbook | [Source inspected](Combining_tables.R) |
| [CSS_selectors.R](CSS_selectors.R) | CSS selectors exercise | [Source inspected](CSS_selectors.R) |
| [Data_import.R](Data_import.R) | To see working directory | [Source inspected](Data_import.R) |
| [Dates_and Times.R](Dates_and%20Times.R) | Objectives, notes from the textbooks | [Source inspected](Dates_and%20Times.R) |
| [Downloading_Files.R](Downloading_Files.R) | Objectives - textbook | [Repaired / reference](Downloading_Files.R) |
| [extracting_commas_from_numbers-stringr_package.R](extracting_commas_from_numbers-stringr_package.R) | Objectives, notes from the textbook | [Repaired / reference](extracting_commas_from_numbers-stringr_package.R) |
| [practice1.R](practice1.R) | setwd() | [Repaired / reference](practice1.R) |
| [practice2.R](practice2.R) | path <- system.file("extdata", package="dslabs") | [Source inspected](practice2.R) |
| [practice3.R](practice3.R) | import US election results data | [Source inspected](practice3.R) |
| [practice4.R](practice4.R) | Load the Major League Baseball payrolls in to R: | [Source inspected](practice4.R) |
| [practice5.R](practice5.R) | practice5 | [Repaired / reference](practice5.R) |
| [practice6.R](practice6.R) | practice6 | [Repaired / reference](practice6.R) |
| [practice7.R](practice7.R) | practice7 | [Repaired / reference](practice7.R) |
| [practice8.R](practice8.R) | Optional manual preview: utils::browseURL(fn) | [Repaired / reference](practice8.R) |
| [Read_data-readr_and_readxl_Packages.R](Read_data-readr_and_readxl_Packages.R) | Objectives-from the text book | [Repaired / reference](Read_data-readr_and_readxl_Packages.R) |
| [Regex-Character_classes,_Anchors_and_Quantifiers.R](Regex-Character_classes%2C_Anchors_and_Quantifiers.R) | Objectives, notes from textbook | [Source inspected](Regex-Character_classes%2C_Anchors_and_Quantifiers.R) |
| [Regex-search_and_replace_with_regex.R](Regex-search_and_replace_with_regex.R) | Objectives, notes from the textbook | [Source inspected](Regex-search_and_replace_with_regex.R) |
| [Reported_heights-case_study_2.R](Reported_heights-case_study_2.R) | Objectives, notes from the textbook | [Source inspected](../docs/cases/reported-heights/README.md) |
| [Reshaping_data-pivot_longer.R](Reshaping_data-pivot_longer.R) | Objectives, notes from the textbook | [Source inspected](Reshaping_data-pivot_longer.R) |
| [Reshaping_data-pivot_wider.R](Reshaping_data-pivot_wider.R) | Objectives,note from the text book | [Source inspected](Reshaping_data-pivot_wider.R) |
| [Reshaping_data-separate_and_unite.R](Reshaping_data-separate_and_unite.R) | Objectives, note from the textbook | [Source inspected](Reshaping_data-separate_and_unite.R) |
| [Separate_with_Regex.R](Separate_with_Regex.R) | Objectives, notes from the textbook | [Repaired / reference](Separate_with_Regex.R) |
| [Set_operators.R](Set_operators.R) | Objectives, note from the textbook | [Source inspected](Set_operators.R) |
| [Single_and_Double_quotes_and_how_to_escape-Defining_strings.R](Single_and_Double_quotes_and_how_to_escape-Defining_strings.R) | Objectives, notes from the textbook | [Repaired / reference](Single_and_Double_quotes_and_how_to_escape-Defining_strings.R) |
| [String_parsing.R](String_parsing.R) | Objectives, notes from the textbook | [Repaired / reference](String_parsing.R) |
| [Text_mining.R](Text_mining.R) | Objectives, notes from the textbook. | [Repaired / reference](../docs/cases/text-mining/README.md) |
| [Tidy_data.R](Tidy_data.R) | note - from the textbook | [Source inspected](Tidy_data.R) |
| [Web_scraping.R](Web_scraping.R) | Objectives, notes from the textbook | [Source inspected](Web_scraping.R) |

## Results and limitations

External DOM selectors, table indices, remote availability and PDF line positions are unverified today. Import/download exercises may copy/remove temporary files or call the network. Preserve their intent and inspect effects before execution.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.

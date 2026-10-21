# R programming foundations

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Move from types and vector indexing to explicit transformations, grouped summaries and reusable functions.

## Suggested reading order

1. Start with section 1 (types and the dslabs murders table), then section 2 (vectors, sort/order/rank, missing values).
2. Read the section 3 indexing/wrangling/plots examples before the section 2.5 pipe and summaries.
3. Finish with section 4 conditionals, loops and functions, then section 3.5 for the older do() bridge.

## Data and prerequisites

Examples use dslabs murders, heights and na_example plus embedded vectors. The vector-coercion lesson deliberately demonstrates conversion warnings, including 0.5L becoming a numeric value.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [section 1; R Basics, Functions, Data types.R](section%201%3B%20R%20Basics%2C%20Functions%2C%20Data%20types.R) | Objectives: To understand data types | [Source inspected](section%201%3B%20R%20Basics%2C%20Functions%2C%20Data%20types.R) |
| [section 2.5; summarizing data.R](section%202.5%3B%20summarizing%20data.R) | Objectives; | [Source inspected](section%202.5%3B%20summarizing%20data.R) |
| [section 2.5; the pipe.R](section%202.5%3B%20the%20pipe.R) | objectives; | [Source inspected](section%202.5%3B%20the%20pipe.R) |
| [section 2; sort, order, rank, max, which.max, data.frame, in.na.R](section%202%3B%20sort%2C%20order%2C%20rank%2C%20max%2C%20which.max%2C%20data.frame%2C%20in.na.R) | Objectives: To know operation of 'sort' and 'order' | [Source inspected](section%202%3B%20sort%2C%20order%2C%20rank%2C%20max%2C%20which.max%2C%20data.frame%2C%20in.na.R) |
| [section 2; vectors, names, sequences, subsetting, coercion.R](section%202%3B%20vectors%2C%20names%2C%20sequences%2C%20subsetting%2C%20coercion.R) | Objectives: To understand vectors | [Source inspected](section%202%3B%20vectors%2C%20names%2C%20sequences%2C%20subsetting%2C%20coercion.R) |
| [section 3.5; do function-a bridge R and tidyverse.R](section%203.5%3B%20do%20function-a%20bridge%20R%20and%20tidyverse.R) | Introduction to DATA SCIENCE, Rafael A., p.70 | [Source inspected](section%203.5%3B%20do%20function-a%20bridge%20R%20and%20tidyverse.R) |
| [section 3; data wrangling, creating data frames.R](section%203%3B%20data%20wrangling%2C%20creating%20data%20frames.R) | Objectives: data wrangling, creating data frames; use the 'data.frame()' function | [Repaired / reference](section%203%3B%20data%20wrangling%2C%20creating%20data%20frames.R) |
| [section 3; indexing, data wrangling, plots.R](section%203%3B%20indexing%2C%20data%20wrangling%2C%20plots.R) | Objectives: To find states that have a lower murder rate. | [Source inspected](section%203%3B%20indexing%2C%20data%20wrangling%2C%20plots.R) |
| [section 3; plots, boxplots.R](section%203%3B%20plots%2C%20boxplots.R) | Objectives; To know how to create plots, histogram, and boxplots | [Source inspected](section%203%3B%20plots%2C%20boxplots.R) |
| [section 4; conditionals.R](section%204%3B%20conditionals.R) | Objectives: To understand following function; 'if-else statement', 'ifelse()', 'any()', and 'all()' | [Source inspected](section%204%3B%20conditionals.R) |
| [section 4; for Loops.R](section%204%3B%20for%20Loops.R) | Objectives: To know about 'for loops.' | [Repaired / reference](section%204%3B%20for%20Loops.R) |
| [section 4; functions.R](section%204%3B%20functions.R) | Objectives: How to create functions? The R function, called 'function()' use for defining a bew function. | [Source inspected](section%204%3B%20functions.R) |

## Results and limitations

Rates are counts per 100,000 people, not current public-safety estimates. Some functions (do(), top_n()) are older teaching APIs. The installation cell was replaced with explicit preparation.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.

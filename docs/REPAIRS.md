# Repair record

Maintenance date: 2026-10-20. The archive originally contained 98 R files including packages.R. It now contains 99 archive R files: 98 lessons and the package helper. Six prior blank/comment-only placeholders were completed, and one separate Iris companion was added. Forty R paths were changed.

The original introduction file in Machine_learning was not edited: the original worktree contains owner changes there. Existing data/project files and numeric comments remain preserved. New reference assumptions and figures are explicitly labeled.

| Source | Reviewed repair |
|---|---|
| [Data_wrangling/Binding.R](../Data_wrangling/Binding.R) | Catch the explicitly demonstrated unequal-length binding error so the valid later examples can run. |
| [Data_wrangling/Downloading_Files.R](../Data_wrangling/Downloading_Files.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Data_wrangling/Read_data-readr_and_readxl_Packages.R](../Data_wrangling/Read_data-readr_and_readxl_Packages.R) | Read the packaged dataset by its resolved path rather than an assumed copied working-directory file. |
| [Data_wrangling/Separate_with_Regex.R](../Data_wrangling/Separate_with_Regex.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Data_wrangling/Single_and_Double_quotes_and_how_to_escape-Defining_strings.R](../Data_wrangling/Single_and_Double_quotes_and_how_to_escape-Defining_strings.R) | Retain the backtick/name error as a caught demonstration rather than aborting the script. |
| [Data_wrangling/String_parsing.R](../Data_wrangling/String_parsing.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Data_wrangling/Text_mining.R](../Data_wrangling/Text_mining.R) | Expand comment-only text-mining notes with a minimal base-R offline token counter; keep sentiment analysis as a separate prerequisite, not a claimed implemented result. |
| [Data_wrangling/extracting_commas_from_numbers-stringr_package.R](../Data_wrangling/extracting_commas_from_numbers-stringr_package.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Data_wrangling/practice1.R](../Data_wrangling/practice1.R) | Use the actual readr col_names keyword; declare readr. Local copies and network imports remain explicit lesson effects. |
| [Data_wrangling/practice5.R](../Data_wrangling/practice5.R) | Create the reported-height problems vector and declare packages before the regex examples; external scraping remains separately required. |
| [Data_wrangling/practice6.R](../Data_wrangling/practice6.R) | Use list-column tokenization with explicit unnest(cols=staff); catch the invalid recode attempt and retain the correct named mapping. |
| [Data_wrangling/practice7.R](../Data_wrangling/practice7.R) | Count April using numeric month values rather than comparing month labels with 4. |
| [Data_wrangling/practice8.R](../Data_wrangling/practice8.R) | Declare the plotting/wrangling dependencies and remove automatic Windows PDF-viewer launch; parsing remains an archive-layout exercise. |
| [Linear_regression/2.10 Measurement Error Models - linear Regression - Parabola Eq.R](../Linear_regression/2.10%20Measurement%20Error%20Models%20-%20linear%20Regression%20-%20Parabola%20Eq.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/2.2 Stratification and Multivariate regression.R](../Linear_regression/2.2%20Stratification%20and%20Multivariate%20regression.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/2.4 Least Squares Estimates-example function.R](../Linear_regression/2.4%20Least%20Squares%20Estimates-example%20function.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/2.6 Predicted Variables are Random Variables.R](../Linear_regression/2.6%20Predicted%20Variables%20are%20Random%20Variables.R) | Load the Galton/father-son setup and explicit packages before the lesson; preserve historical calculations. |
| [Linear_regression/2.8 LP linear programming application - building a better offensive metric for baseball.R](../Linear_regression/2.8%20LP%20linear%20programming%20application%20-%20building%20a%20better%20offensive%20metric%20for%20baseball.R) | Align the acast constraint columns with player/objective/salary order, require unique player IDs, use binary selection and check solver success before reading the roster. |
| [Linear_regression/2.9 Regression Fallacy - sophomore slump.R](../Linear_regression/2.9%20Regression%20Fallacy%20-%20sophomore%20slump.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/3.1 Correlation is Not Causation-Spurious Correlation.R](../Linear_regression/3.1%20Correlation%20is%20Not%20Causation-Spurious%20Correlation.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/3.2 How to deal with Outliers - Spearman correlation.R](../Linear_regression/3.2%20How%20to%20deal%20with%20Outliers%20-%20Spearman%20correlation.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/3.3 Reversing Cause and Effect - interpretation of the model.R](../Linear_regression/3.3%20Reversing%20Cause%20and%20Effect%20-%20interpretation%20of%20the%20model.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/3.4 Confounders - if changes in Z causes changes in both X and Y.R](../Linear_regression/3.4%20Confounders%20-%20if%20changes%20in%20Z%20causes%20changes%20in%20both%20X%20and%20Y.R) | Complete an empty confounding lesson with a seeded common-cause simulation and marginal/adjusted regressions; explicitly synthetic. |
| [Linear_regression/3.5 Simpson's Paradox.R](../Linear_regression/3.5%20Simpson%27s%20Paradox.R) | Complete a placeholder with a strict Simpson reversal: A has a higher rate in both strata and a lower pooled rate due to different mixture weights. |
| [Linear_regression/Practice-1.R](../Linear_regression/Practice-1.R) | Load the Galton/father-son setup and explicit packages before the lesson; preserve historical calculations. |
| [Linear_regression/Practice-2.R](../Linear_regression/Practice-2.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Linear_regression/Practice-7_Gender bias or Simpsons paradox.R](../Linear_regression/Practice-7_Gender%20bias%20or%20Simpsons%20paradox.R) | Declare packages used before their first call; do not rely on a previous interactive session. |
| [Machine_learning/2.1 Offline classification reference.R](../Machine_learning/2.1%20Offline%20classification%20reference.R) | Add a separate offline stratified Iris k-NN companion with training-only scaling; preserve the introduction file and its pre-existing owner edits. |
| [Probability/section 1; discrete probability.R](../Probability/section%201%3B%20discrete%20probability.R) | Keep the intended oversampling error visible without stopping the later replacement examples. |
| [Probability/section 3-roulette practice.R](../Probability/section%203-roulette%20practice.R) | Correct the losing-pocket count in the variance check and reset the wheel before the separate 18/18/2 casino example. |
| [Probability/section 4; case study-the interest rates.R](../Probability/section%204%3B%20case%20study-the%20interest%20rates.R) | Map the actually scaled million-dollar variable and use a matching bin width/axis label; this is a hypothetical independent-default simulation. |
| [Probability/section 4; independence and dependence of sample-the big short.R](../Probability/section%204%3B%20independence%20and%20dependence%20of%20sample-the%20big%20short.R) | Complete the empty dependence lesson with an explicit beta-binomial common-factor model; same marginal default probability, larger variance for positive rho. |
| [Productivity_tools-github/R_code_notes.R](../Productivity_tools-github/R_code_notes.R) | Complete the practice placeholder with read-only environment reporting and manual Git-review notes; no automatic Git writes. |
| [R_Basics/section 3; data wrangling, creating data frames.R](../R_Basics/section%203%3B%20data%20wrangling%2C%20creating%20data%20frames.R) | Remove automatic package installation from a data-wrangling lesson; dependency installation is explicit. |
| [R_Basics/section 4; for Loops.R](../R_Basics/section%204%3B%20for%20Loops.R) | Validate nonnegative integer limits and sum seq_len(n), including n=0; use the square-sum plot domain consistently. |
| [packages.R](../packages.R) | Replace automatic installation/global update with a dry-run helper and explicit --install; install only missing declared dependencies, never update the entire environment. |
| [useful_math-statistics_codes/Monte Carlo simulation-Blackjack_probability.R](../useful_math-statistics_codes/Monte%20Carlo%20simulation-Blackjack_probability.R) | Complete the empty natural-blackjack simulation and compare with the unordered-hand probability 64/choose(52,2); not full-game strategy or payout analysis. |
| [useful_math-statistics_codes/Sum_of _integers.R](../useful_math-statistics_codes/Sum_of%20_integers.R) | Validate nonnegative integer limits and sum seq_len(n), including n=0; use the square-sum plot domain consistently. |
| [useful_math-statistics_codes/The birthday problem-duplicated birthdays in a group.R](../useful_math-statistics_codes/The%20birthday%20problem-duplicated%20birthdays%20in%20a%20group.R) | Handle group sizes 0 and greater than 365 in the exact formula, validate integer n, and do not overwrite the function with its result vector. |
| [useful_math-statistics_codes/basic random sampling.R](../useful_math-statistics_codes/basic%20random%20sampling.R) | Keep the intended oversampling error visible without stopping the later replacement examples. |

## Verification progression

Initial R 4.2.2 parse: all 98 original archive R files parsed; the 0.5L type demonstration produced a known warning. Initial selected execution: 82 files attempted, 65 completed and 17 stopped. Missing packages/setup, assumed local copied files and uncaught pedagogical error examples accounted for those stops.

After repair, the reusable offline runner attempted 85 files and all completed. It excludes 14 scripts with active network/install/copy effects or large simulations. Some successful files are conceptual notes; this count is not a count of 85 validated scientific experiments.

The separate 12-case suite checks confounding, strict Simpson reversal, beta-binomial means/variances and its independent limit, blackjack exact probability, birthday/sum boundaries, tokenization, Iris split/scaling, shuffled roster alignment, plot units and the package-helper default.

Warnings from packages built under R 4.2.3, older sampling/API demonstrations and caught intentional-error examples are recorded as interpretation context, not silently removed.

## Remaining boundaries

- Live HTML selectors/table indices, remote archive availability and a fresh clean package installation remain unverified.
- Large simulations were not executed at their full original scale. Formula-level checks do not validate a real financial/policy application.
- R Markdown/Pandoc rendering and original course completion/individual contribution are unverified.
- Older APIs and illustrative numeric comments remain where the revised scripts run; broad modernization was not imposed.

## Primary references

- [R package installation](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/install.packages.html).
- [R binomial distribution](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/Binomial.html).
- [dslabs](https://cran.r-project.org/package=dslabs) and the [original textbook](https://rafalab.dfci.harvard.edu/dsbook/).

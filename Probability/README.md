# Probability and simulation

[← Portfolio](../README.md) · [Full source catalog](../docs/SOURCE_CATALOG.md)

Connect sample spaces, exact probabilities, simulation uncertainty and dependence assumptions.

## Suggested reading order

1. Start with discrete probability, combinations/permutations, birthday and Monty Hall examples.
2. Read empirical/continuous/theoretical distribution examples and the random-seed note.
3. Study roulette sums and normal approximations before the independent loan-loss example and new dependence reference.

## Data and prerequisites

Mostly embedded random experiments; height distribution lessons use dslabs heights. Loan/roulette amounts are hypothetical teaching parameters.

## Lesson index

| Source | Focus / opening note | State |
|---|---|---|
| [section 1; combinations and permutations.R](section%201%3B%20combinations%20and%20permutations.R) | Objectives; To know how to use: | [Source inspected](section%201%3B%20combinations%20and%20permutations.R) |
| [section 1; discrete probability.R](section%201%3B%20discrete%20probability.R) | Objectives and note; | [Repaired / reference](section%201%3B%20discrete%20probability.R) |
| [section 1; enough number of simulations-Monty Carlo replicates.R](section%201%3B%20enough%20number%20of%20simulations-Monty%20Carlo%20replicates.R) | This code runs Monte Carlo simulations to estimate the probability of shared birthdays using several B values  | [Source inspected](section%201%3B%20enough%20number%20of%20simulations-Monty%20Carlo%20replicates.R) |
| [section 1; the birthday problem.R](section%201%3B%20the%20birthday%20problem.R) | checking for duplicated birthdays in one 50 person group | [Source inspected](section%201%3B%20the%20birthday%20problem.R) |
| [section 1; the monty hall problem.R](section%201%3B%20the%20monty%20hall%20problem.R) | Monte Carlo simulations can be used to simulate random outcomes, which makes them useful when exploring ambigu | [Source inspected](section%201%3B%20the%20monty%20hall%20problem.R) |
| [section 2.5; distributions vs probability distributions.R](section%202.5%3B%20distributions%20vs%20probability%20distributions.R) | From text book, p.245 | [Source inspected](section%202.5%3B%20distributions%20vs%20probability%20distributions.R) |
| [section 2; continuous probability.R](section%202%3B%20continuous%20probability.R) | Objectives: | [Source inspected](section%202%3B%20continuous%20probability.R) |
| [section 2; theoretical distribution.R](section%202%3B%20theoretical%20distribution.R) | Objectives; | [Source inspected](section%202%3B%20theoretical%20distribution.R) |
| [section 3-a practice script.R](section%203-a%20practice%20script.R) | There are 44 questions of five multiple chose. one mark for correct and -0.25 for incorrect marks. | [Source inspected](section%203-a%20practice%20script.R) |
| [section 3-roulette practice.R](section%203-roulette%20practice.R) | --roulette practice | [Repaired / reference](section%203-roulette%20practice.R) |
| [section 3; sampling models-a roulette wheel_ex.R](section%203%3B%20sampling%20models-a%20roulette%20wheel_ex.R) | Objectives; | [Source inspected](section%203%3B%20sampling%20models-a%20roulette%20wheel_ex.R) |
| [section 4; case study-the interest rates.R](section%204%3B%20case%20study-the%20interest%20rates.R) | Objectives; | [Repaired / reference](section%204%3B%20case%20study-the%20interest%20rates.R) |
| [section 4; independence and dependence of sample-the big short.R](section%204%3B%20independence%20and%20dependence%20of%20sample-the%20big%20short.R) | New 2026 reference: hypothetical correlated defaults, not financial calibration. | [Repaired / reference](../docs/cases/dependent-defaults/README.md) |
| [Setting the random seed.R](Setting%20the%20random%20seed.R) | sampling with R (or other statistics programs) will generate the random numbers. | [Source inspected](Setting%20the%20random%20seed.R) |

## Results and limitations

A large number of replications does not repair a wrong sampling model. Historical set.seed(...,sample.kind="Rounding") calls intentionally reproduce older sampling and emit warnings. Million-group/large replication exercises are excluded from routine smoke checks.

Read [repair evidence](../docs/REPAIRS.md) and [reproduction/side effects](../docs/REPRODUCIBILITY.md). Historical numeric comments are preserved; a successful smoke run does not validate every statistical interpretation.

## Credits

The repository identifies HarvardX/Harvard data-science learning material, and several source notes cite Rafael A. Irizarry’s textbook. Treat this as coursework and study notes. Exact completion dates, credentials and personal/team contribution are unverified unless a specific source states them.

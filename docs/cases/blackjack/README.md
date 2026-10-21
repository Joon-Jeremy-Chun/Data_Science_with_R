# Natural blackjack: simulation and an exact answer

[← Portfolio](../../../README.md) · [Open source](../../../useful_math-statistics_codes/Monte%20Carlo%20simulation-Blackjack_probability.R) · [Collection](../../../useful_math-statistics_codes/README.md)

> Evidence type: new 2026 reference implementation.

## Question

Use a finite sample space to validate a Monte Carlo estimate.

## Data and assumptions

One 52-card deck with four aces and 16 ten-valued cards. Each two-card hand is drawn without replacement; independent replications reset the deck.

## Method

natural_blackjack() flags either ordering of ace/ten and compares the estimate with 4*16/choose(52,2)=32/663≈0.04826546. It also returns the theoretical Bernoulli Monte Carlo standard error.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

A 30,000-hand seeded check requires agreement within five Monte Carlo standard errors.

## Run from the repository root

```bash
Rscript --vanilla "useful_math-statistics_codes/Monte Carlo simulation-Blackjack_probability.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

The calculation excludes further draws, dealers, payout rules, splits and betting decisions. It is a probability exercise, not a full blackjack simulator.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

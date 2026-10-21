# Regression scores and a constrained baseball roster

[← Portfolio](../../../README.md) · [Open source](../../../Linear_regression/2.8%20LP%20linear%20programming%20application%20-%20building%20a%20better%20offensive%20metric%20for%20baseball.R) · [Collection](../../../Linear_regression/README.md)

> Evidence type: historical lesson with separately documented maintenance.

## Question

Follow a team-level regression into an illustrative player-scoring and budget-constrained selection problem.

## Data and assumptions

Lahman team observations from 1961–2001 train run-per-game models. Player batting from 1999–2001, 2002 salaries/positions and debut filters form historical candidate inputs.

## Method

The script fits a multivariable run proxy, joins player/salary/position records and solves a binary LP with one selected candidate per available position and a 50-million-dollar budget. acast sorts player columns; the repair explicitly aligns them to player/objective/salary order and checks solver status.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

A focused integration test runs the actual constraint/solver block on shuffled candidate rows and verifies invariant selected identities, position coverage and budget. The complete offline lesson also ran in the smoke check.

## Run from the repository root

```bash
Rscript --vanilla "Linear_regression/2.8 LP linear programming application - building a better offensive metric for baseball.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

The score transfers a team-level proxy to player statistics and omits many real roster constraints. The result is a historical classroom optimization example, not current baseball valuation or a validated team-performance forecast.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

# Birthday collisions and boundary-aware formulas

[← Portfolio](../../../README.md) · [Open source](../../../useful_math-statistics_codes/The%20birthday%20problem-duplicated%20birthdays%20in%20a%20group.R) · [Collection](../../../useful_math-statistics_codes/README.md)

> Evidence type: historical lesson with separately documented maintenance.

## Question

Compare simulation with the complement of all birthdays being unique.

## Data and assumptions

Uniform independent birthdays over 365 days; seeded or unseeded replications as shown in the original lesson. Leap years and seasonality are omitted.

## Method

The historical file estimates collisions for several group sizes and plots a curve. exact_prob(n) now validates nonnegative integer n, returns zero for n=0/1 and one beyond 365, and remains a callable function after its vector results are stored separately.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

The focused check verifies n=0,1,23,366 and rejects invalid negative n. The 23-person exact collision probability is about 0.5072972343.

## Run from the repository root

```bash
Rscript --vanilla "useful_math-statistics_codes/The birthday problem-duplicated birthdays in a group.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

Historical comment outputs are illustrations of earlier random draws. A Monte Carlo estimate has simulation error, and a uniform-day model is an assumption rather than an empirical birthday distribution.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

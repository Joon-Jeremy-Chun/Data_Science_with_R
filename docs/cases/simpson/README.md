# A strict Simpson reversal

[← Portfolio](../../../README.md) · [Open source](../../../Linear_regression/3.5%20Simpson%27s%20Paradox.R) · [Collection](../../../Linear_regression/README.md)

> Evidence type: new 2026 reference implementation.

## Question

Explain how pooling different mixtures can reverse a comparison that holds within every stratum.

## Data and assumptions

Invented counts: A has 9/10 and 20/100 successes in easy/hard strata; B has 80/100 and 1/10. No real treatments, patients or institutions are represented.

## Method

simpson_example() calculates stratum rates and pools success/total counts by treatment. A beats B in each stratum (90%>80%, 20%>10%), but pooled A is 29/110 and B is 81/110.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

The focused check verifies both within-stratum inequalities and the reversed pooled inequality; the figure is freshly generated from the actual reference function.

![New reference result for A strict Simpson reversal](../../../assets/results/simpson-reference.png)

*Fresh 2026 synthetic reference output from tools/render_reference_figures.R. It does not replace historical course results.*

## Run from the repository root

```bash
Rscript --vanilla "Linear_regression/3.5 Simpson's Paradox.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

The reversal comes from different stratum weights. Which comparison answers a real question depends on study design and the role of the stratifying variable.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

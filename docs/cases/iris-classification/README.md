# An offline Iris classifier in R

[← Portfolio](../../../README.md) · [Open source](../../../Machine_learning/2.1%20Offline%20classification%20reference.R) · [Collection](../../../Machine_learning/README.md)

> Evidence type: new 2026 reference implementation.

## Question

Make the feature/outcome concepts concrete while keeping test data separate from preprocessing.

## Data and assumptions

Built-in iris: 150 rows, four numeric measurements and three species. Stratified sampling assigns 35 rows per species to training (105 total), 15 to test (45 total).

## Method

iris_knn_reference() fits center/scale on training predictors, transforms test predictors with those parameters and applies class::knn with k=5 and seed 2045. It returns split indices, scaler parameters, confusion matrix and accuracy.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

The focused test checks disjoint split sizes, training means and useful test predictions. This is a new companion file; the original introduction notes are untouched.

## Run from the repository root

```bash
Rscript --vanilla "Machine_learning/2.1 Offline classification reference.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

One small holdout and one k do not establish comparative performance. No cross-validation search or broader model benchmark was conducted.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

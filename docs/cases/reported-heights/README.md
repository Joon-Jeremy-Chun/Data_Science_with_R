# Parsing inconsistent height entries

[← Portfolio](../../../README.md) · [Open source](../../../Data_wrangling/Reported_heights-case_study_2.R) · [Collection](../../../Data_wrangling/README.md)

> Evidence type: historical lesson with separately documented maintenance.

## Question

Separate malformed strings, plausible units and numeric ranges before interpreting measurements.

## Data and assumptions

dslabs reported_heights and embedded regex examples; entries are originally self-reported strings.

## Method

The not_inches predicate converts with suppressed numeric warnings and flags missing/out-of-range values. Subsequent regex examples inspect feet/inches notation, punctuation variants and possible centimeter values. Related regex/search/replace/extract files expand the same techniques.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

The offline script completes in the smoke check; numeric-conversion warnings are expected demonstrations. No cleaned authoritative height dataset is published by this maintenance.

## Run from the repository root

```bash
Rscript --vanilla "Data_wrangling/Reported_heights-case_study_2.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

Plausible range rules are heuristics and cannot prove intended units or truth. External Wikipedia table parsing in related files is excluded from current live verification.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

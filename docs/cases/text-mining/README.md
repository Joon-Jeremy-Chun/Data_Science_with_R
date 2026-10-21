# An offline token-counting reference

[← Portfolio](../../../README.md) · [Open source](../../../Data_wrangling/Text_mining.R) · [Collection](../../../Data_wrangling/README.md)

> Evidence type: new 2026 reference implementation.

## Question

Turn a comment-only text-mining note into a small inspectable operation without downloading a corpus.

## Data and assumptions

Caller-supplied character strings; the direct demo uses two newly written example sentences. Missing strings and empty tokens are excluded.

## Method

token_counts() lowercases text, splits on nonalphabetic runs, discards empty tokens and sorts a frequency table. It uses base R rather than installing tidytext.

## How to inspect it

1. Read the data construction and parameter definitions before the numerical/statistical operation.
2. Trace the function’s returned objects, then compare with the formula or evaluation target described above.
3. Read the focused-test case and the limitations before interpreting a plot or number.

## Evidence and checks

A focused test checks punctuation/case normalization, missing/empty input and exact token totals.

## Run from the repository root

```bash
Rscript --vanilla "Data_wrangling/Text_mining.R"
```

The new reference functions can also be sourced and called explicitly. Direct scripts may print tables or display plots; consult the execution matrix for older lessons.

## Limits

This is frequency counting only. Language-dependent segmentation, stemming, stop words, corpus-level TF–IDF and sentiment lexicons are not implemented by this helper. The original tidytext/sentiment notes remain conceptual.

For exact repaired paths and validation scope, see [repairs](../../REPAIRS.md) and [validation](../../VALIDATION.md).

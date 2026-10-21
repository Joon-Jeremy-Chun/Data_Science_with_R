# Reproduction and execution guide

## Inspect the environment first

The checks used an existing Windows R 4.2.2 installation and existing packages; several packages reported builds under R 4.2.3. This is not a tested clean installation or a recovered historical lockfile. See the validation record for observed versions. Rscript was found in the installed R bin directory even though it was absent from PATH.

From the repository root, using Rscript on PATH:

```bash
Rscript --vanilla packages.R
Rscript --vanilla tests/test_repairs.R
Rscript --vanilla tools/validate_r_sources.R
python tools/validate_archive.py
python tools/smoke_offline.py --rscript Rscript
```

In PowerShell, invoke an R executable path containing spaces with `&` and quotes. You can pass that executable’s path to the Python smoke runner with `--rscript`. Python document checks require IPython in addition to the standard library; there are no notebooks in this archive, but the shared validator imports its input transformer.

## Dependency preparation is explicit

`Rscript --vanilla packages.R` reports missing declared packages without installing or updating anything. Only use `Rscript --vanilla packages.R --install` when you intend to install missing dependencies into the first R library. The helper also accepts a `lib` argument when called from R. No global update.packages call remains. A clean install from current CRAN packages has not been tested.

| Area | Main packages / inputs | Effects to inspect |
|---|---|---|
| Basics / visualization | dslabs, dplyr/tidyverse; packaged murders/heights | Prints tables, plots, and intentional conversion examples. |
| Wrangling | tidyverse, dslabs, rvest/readxl/data.table/pdftools | Some scripts copy local files, download CSVs, scrape historical pages or parse packaged PDF text. |
| Regression | HistData, Lahman, tidyverse, broom/gridExtra | Bootstraps and plots; the p-hacking example constructs 25 million rows. |
| Roster optimization | Lahman, reshape2, lpSolve | Fits regressions and solves a historical binary budget/position exercise. |
| Probability / utilities | Base R, gtools, selected dslabs examples | Random simulation; some original loops are intentionally large. |
| New references | Base/recommended R; class for Iris | Guarded demos, synthetic/built-in data; no downloads or model-file writes. |
| Original R Markdown | rmarkdown, knitr, dslabs and Pandoc | Rendering creates an output document; not part of the checks performed here. |

## What the offline runner does

The Python runner conservatively excludes scripts with active URL/install/update/download/HTML/copy/remove/system calls, plus three explicitly large examples. It starts a fresh R process per selected file, catches only execution failures, skips help/View commands, sends plots to a temporary PDF, and applies a 30-second per-file limit. It is a reviewed execution selector, not a sandbox or a security guarantee. Reinspect new code before extending its scope.

Some lessons intentionally demonstrate invalid sampling/binding/quoting/recode operations. Those examples are now caught, so the remainder can execute; their underlying errors remain visible. Successful source execution does not establish that every statistical interpretation is valid.

## Data and results

Packaged datasets use their installed versions. The repository retains existing local data examples; this maintenance did not add external personal records. Historical web/PDF formats and data redistribution terms are not fully verified. Existing numeric comments describe earlier runs and were not overwritten with fresh values. New 2026 figures are generated only from explicitly synthetic reference models; their script and assumptions are linked in the provenance document.

To regenerate only those reference figures intentionally:

```bash
Rscript --vanilla tools/render_reference_figures.R assets/results
```

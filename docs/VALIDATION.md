# Validation record — 2026-10-20

- Existing R environment: R version 4.2.2 (2022-10-31 ucrt).
- Initial archive parse: 98 files, no errors; one expected 0.5L type warning.
- Initial offline execution: 82 attempted, 65 completed, 17 stopped.
- Repaired portable offline runner: 85 attempted, 85 completed, zero failures; 14 excluded.
- Focused mathematical/behavioral suite: 12 passed.
- Final R source parse includes 99 archive files plus maintenance/test scripts; no syntax errors.
- Original worktree and existing local data/notes are preserved separately.

## Observed package versions

| Package | Installed version |
|---|---|
| dslabs | 0.8.0 |
| dplyr | 1.1.4 |
| tidyverse | 2.0.0 |
| tidyr | 1.3.1 |
| ggplot2 | 3.5.1 |
| HistData | 0.9.1 |
| Lahman | 12.0.0 |
| broom | 1.0.7 |
| reshape2 | 1.4.4 |
| lpSolve | 5.6.20 |
| rvest | 1.0.4 |
| class | 7.3.22 |

Packages built under R 4.2.3 and legacy sampling/API examples emitted warnings. Deliberately invalid sampling/binding/name/recode attempts are caught teaching demonstrations. Successful smoke execution is not scientific validation of every calculation or a historical-result reproduction.

No current web scraping, dataset downloading, package installation/update, 25-million-row experiment or R Markdown/Pandoc rendering was performed. The new synthetic reference plots were generated separately from their linked source functions.

Root README and the Simpson case guide were rendered locally and visually inspected. All three new reference figures were inspected; plot margins were corrected to separate axis labels and captions.

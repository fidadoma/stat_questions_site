# Standardization Summary

## Overview

Successfully standardized all 93 question files in the statistics Q&A website. The standardization ensures consistent format, style, tone, and added helpful visualizations throughout the site.

## Changes Applied

### 1. Consistent Heading Structure
- **Before**: Mixed H1/H2 usage, some files repeated titles
- **After**: All files now start with `## Úvod` after YAML frontmatter
- Removed duplicate titles that repeated the YAML title field

### 2. YAML Frontmatter
- **Added missing `order` fields**: Ensured all files have proper ordering for sidebar navigation
- **Standardized format**: All files now follow the same YAML structure

### 3. Conclusion Sections
- **Standardized terminology**: Changed all "Shrnutí" to "Závěr" for consistency
- **Improved conclusions**: Made endings more professional and comprehensive
- **Removed informal language**: Eliminated phrases like "Pokud máte jakékoliv otázky, neváhejte se na mě obrátit!"

### 4. Added Visualizations
Added R code and visualizations to key concept files:

#### Descriptive Statistics
- **Variability characteristics** (`jake_jsou_charakteristiky_variability.qmd`):
  - Histogram comparison of low vs. high variability with same mean

- **Skewness** (`co_to_je_sikmost_dat.qmd`):
  - Three histograms showing positive, negative, and symmetric skewness

- **Pearson correlation** (`co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd`):
  - 6-panel visualization showing correlations from -1 to +1

#### Probability
- **Central Limit Theorem** (`co_rika_centralni_limitni_veta_a_jake_ma_prakticke_pouziti.qmd`):
  - 5-panel demonstration of CLT with increasing sample sizes
  - Shows how uniform distribution converges to normal

#### Inferential Statistics
- **P-value** (`co_to_je_phodnota.qmd`):
  - Visual explanation of p-value as area under distribution curve
  - Shows observed statistic and extreme regions

#### Time Series
- **Time series decomposition** (`co_to_je_casova_rada_a_jak_je_delime.qmd`):
  - 5-panel visualization of trend, seasonal, cyclical, random, and total components

#### Causal Inference
- **DAG** (`co_to_je_dag.qmd`):
  - Visual example of directed acyclic graph with causal relationships
  - Shows education, income, health relationships

### 5. Formatting Cleanup
- Removed trailing code block markers (```)
- Ensured consistent file endings with single newline
- Fixed inconsistent spacing and structure

## Statistics

### Files Processed
- **Total files**: 93
- **Files updated**: 85 (91.4%)
- **Files unchanged**: 8 (8.6%)

### By Category
- Descriptive Statistics: 30 files
- Inferential Statistics: 36 files
- Probability: 9 files
- Time Series: 9 files
- Causal Inference: 7 files
- Other: 2 files (about, index)

## Tools Created

### standardize_questions.R
Created an R script for batch processing that:
- Fixes heading structure automatically
- Adds missing YAML fields
- Standardizes terminology
- Removes informal language
- Cleans up formatting

This script can be run again in the future if new questions are added:
```r
Rscript standardize_questions.R
```

## Website Build

Successfully built the website with all changes:
- Output directory: `docs/`
- All 95 pages rendered without errors
- Visualizations generated correctly
- Site ready for deployment

## Recommendations

### For Future Questions
1. Use the template from existing standardized files
2. Always start with `## Úvod` after YAML
3. Include `order` field in YAML
4. End with `## Závěr` section
5. Add visualizations where they help understanding
6. Avoid informal/personal language

### Maintenance
1. Run `standardize_questions.R` periodically
2. Review visualizations for clarity
3. Ensure all R packages are installed (ggplot2, gridExtra)
4. Test rendering locally before committing

## Files Modified

All modified files are tracked in git. Key manually enhanced files with visualizations:
- `lessons/descriptive_stat/basic_statistics/jake_jsou_charakteristiky_variability.qmd`
- `lessons/descriptive_stat/visualizations/co_to_je_sikmost_dat.qmd`
- `lessons/descriptive_stat/correlations_regressions/co_nam_popisuje_pearsonuv_korelacni_koeficient_a_kdy_se_pouziva.qmd`
- `lessons/probability/co_rika_centralni_limitni_veta_a_jake_ma_prakticke_pouziti.qmd`
- `lessons/inferential_statistics/co_to_je_phodnota.qmd`
- `lessons/time_series/co_to_je_casova_rada_a_jak_je_delime.qmd`
- `lessons/causal_inference/co_to_je_dag.qmd`

These files now serve as templates for adding visualizations to other questions.

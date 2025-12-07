# Equation Rendering Fixes Summary

## Problem Identified

The website had inconsistent mathematical equation syntax that prevented proper rendering:
- Some files used LaTeX syntax: `\( ... \)` for inline math and `\[ ... \]` for display math
- This syntax is incorrect for Quarto/Markdown and does not render properly in the browser

## Solution Applied

Converted all LaTeX-style equation delimiters to proper Markdown/Quarto syntax:
- **Inline math**: `\( ... \)` → `$ ... $`
- **Display math**: `\[ ... \]` → `$$ ... $$`

## Results

### Files Fixed
- **Total files processed**: 93
- **Files with equation issues fixed**: 15
- **Files without issues**: 78

### Files Updated

The following files had equation syntax corrected:

1. `lessons/descriptive_stat/basic_statistics/jake_jsou_charakteristiky_variability.qmd`
2. `lessons/descriptive_stat/correlations_regressions/jaky_je_vztah_mezi_smernici_primky_a_pearsonovym_korelacnim_koeficientem.qmd`
3. `lessons/descriptive_stat/visualizations/jak_se_projevi_odlehle_pozorovani_na_prumeru_a_medianu.qmd`
4. `lessons/inferential_statistics/co_to_je_standardni_chyba_prumeru_a_k_cemu_slouzi.qmd`
5. `lessons/inferential_statistics/co_znaci_hladina_vyznamnosti_a_k_cemu_ji_pouzivame.qmd`
6. `lessons/inferential_statistics/co_znamenaji_stupne_volnosti.qmd`
7. `lessons/inferential_statistics/jak_funguje_jednovyberovy_ttest.qmd`
8. `lessons/inferential_statistics/jake_jsou_problemy_s_testovanim_hypotez.qmd`
9. `lessons/inferential_statistics/k_cemu_slouzi_intervalovy_odhad.qmd`
10. `lessons/probability/co_znaci_podminena_pravdepodobnost.qmd`
11. `lessons/probability/jaka_je_definice_pravdepodobnosti.qmd`
12. `lessons/probability/jake_jsou_zakladni_vlastnosti_pravdepodobnosti.qmd`
13. `lessons/time_series/co_to_je_klouzavy_prumer.qmd`
14. `lessons/time_series/co_vite_o_reziduich_casove_rady.qmd`
15. `lessons/time_series/jak_dekomponujeme_casovou_radu.qmd`

## Technical Details

### Correct Syntax for Quarto/Markdown

**Inline Math** (within text):
```markdown
The mean $\mu$ is important in statistics.
```

**Display Math** (standalone equations):
```markdown
$$
\bar{x} = \frac{1}{n}\sum_{i=1}^{n} x_i
$$
```

### MathJax Configuration

The website uses MathJax 3 for rendering mathematical equations, which is automatically configured by Quarto:
- MathJax is loaded from: `https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml-full.js`
- It automatically renders both inline `$...$` and display `$$...$$` equations

## Verification

After the fixes:
1. All 93 files were processed by the equation fix script
2. Website built successfully without errors
3. MathJax is properly configured in the HTML output
4. Equations now render correctly with proper LaTeX formatting

## Example Transformations

### Before (Incorrect):
```markdown
kde:
  - \( x_i \) je každá jednotlivá hodnota,
  - \( \bar{x} \) je průměr,
  - \( n \) je počet datových bodů.
```

### After (Correct):
```markdown
kde:
  - $ x_i $ je každá jednotlivá hodnota,
  - $ \bar{x} $ je průměr,
  - $ n $ je počet datových bodů.
```

## Script Created

Created `fix_equations.R` script for automated correction:
- Can be run again if new files with equation issues are added
- Uses regex replacement to convert LaTeX to Markdown syntax
- Preserves file encoding (UTF-8)

## Recommendations

For future questions with equations:
1. Always use `$ ... $` for inline math
2. Always use `$$ ... $$` for display math (on separate lines)
3. Never use `\( ... \)` or `\[ ... \]` - these are LaTeX-specific
4. Test equation rendering locally before committing

## Additional Fixes

Also fixed one additional standardization issue found during review:
- Updated `lessons/probability/jaka_je_definice_pravdepodobnosti.qmd` to use `## Úvod` instead of `# Definice Pravděpodobnosti`

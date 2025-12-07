# Organization Update Summary

## Date: 2025-12-06

## Changes Made

### 1. Created 7 New ANOVA Question Pages

All files created in `lessons/inferential_statistics/` with orders 370-430:

1. **co_to_je_f_rozdeleni_jake_ma_parametry.qmd** (order: 370)
   - F distribution definition, two parameters (df1, df2)
   - Visualization of F distribution with different degrees of freedom
   - Relationship to chi-squared and t distributions
   - Critical values and practical applications

2. **k_cemu_slouzi_anova.qmd** (order: 380)
   - Purpose of ANOVA for comparing 3+ groups
   - Between-group vs. within-group variability
   - Practical examples with diet comparison
   - Types of ANOVA (one-way, two-way, repeated measures, MANOVA)

3. **proc_se_neda_pouzit_nekolik_ttestu_namisto_anovy.qmd** (order: 390)
   - Multiple testing problem and Type I error inflation
   - Simulation demonstrating false positive rate
   - Advantages of ANOVA over multiple t-tests
   - When post-hoc tests are appropriate

4. **jake_mame_sumy_ctvercu_u_anovy.qmd** (order: 400)
   - SS_total, SS_between, SS_within decomposition
   - Visual representation of each component
   - From sums of squares to F statistic
   - Eta squared (η²) as effect size measure

5. **k_cemu_slouzi_posthoc_testy_a_kdy_je_provadime.qmd** (order: 410)
   - When to perform post-hoc tests (only if ANOVA significant)
   - Comparison of methods: Tukey HSD, Bonferroni, Holm, Scheffé, Games-Howell
   - Practical workflow with decision tree
   - Visualization of results with confidence intervals

6. **jake_ma_anova_predpoklady.qmd** (order: 420)
   - Three main assumptions: independence, normality, homogeneity of variances
   - How to test each assumption (visual and statistical methods)
   - What to do when assumptions are violated
   - Complete diagnostic plots workflow

7. **jaky_je_vztah_anovy_a_regrese.qmd** (order: 430)
   - ANOVA as regression with dummy variables
   - General Linear Model (GLM) framework
   - Demonstration of equivalence (same F, p-values, R²)
   - Relationship: F = t² for two groups
   - ANCOVA as combination of categorical and continuous predictors

### 2. Updated _quarto.yml with Comprehensive Subsections

Reorganized all major sections with logical subsections:

#### Pravděpodobnost (3 subsections, 9 files)
- **Základy pravděpodobnosti** (4 files)
  - Definice, vlastnosti, jevy, podmíněná pravděpodobnost
- **Pravděpodobnostní rozdělení** (3 files)
  - Normální rozdělení, modely, výhody modelů
- **Pokročilé koncepty** (2 files)
  - CLT, Bayesova věta

#### Časové řady (3 subsections, 9 files)
- **Základy časových řad** (4 files)
  - Definice, typy, dekompozice, rezidua, závislosti
- **Vyhlazování a predikce** (3 files)
  - Klouzavý průměr, exponenciální vyhlazování, extrapolace/interpolace
- **Modelování časových řad** (2 files)
  - ARIMA, koeficienty dynamiky

#### Inferenční statistika (8 subsections, 45 files)
- **Základy testování hypotéz** (9 files)
  - K čemu slouží, hypotézy, p-hodnota, hladina významnosti, chyby, problémy
- **Pravděpodobnostní rozdělení** (4 files)
  - t-rozdělení, stupně volnosti, χ² rozdělení, F rozdělení
- **Odhady a intervaly** (6 files)
  - Bodové/intervalové odhady, vztah k testům, SE, effect size, power
- **T-testy** (3 files)
  - Jednovýběrový, předpoklady, dvouvýběrový vs párový
- **ANOVA** (6 files) ⭐ NEW
  - K čemu slouží, proč ne více t-testů, sumy čtverců, předpoklady, post-hoc, vztah k regresi
- **Neparametrické testy** (3 files)
  - Základní testy, Wilcoxon/Mann-Whitney, nevýhody
- **Chi-kvadrát testy** (4 files)
  - Verze testů, pozorované vs očekávané, malé počty, koeficienty asociace
- **Regrese a předpoklady** (10 files)
  - Testování korelace/regrese, porovnání modelů, normalita, homoskedasticita, multikolinearita, MLE

#### Kauzální inference (2 subsections, 7 files)
- **DAG a kauzální struktury** (5 files)
  - Co je DAG, pipe, fork, collider, backdoor
- **Biasy a paradoxy** (2 files)
  - Berksonův paradox, regrese k průměru

### 3. Benefits of New Organization

1. **Improved Navigation**
   - Inferenční statistika reduced from 45 flat items → 8 organized subsections
   - Clear logical progression from basics to advanced topics
   - Easier to find specific topics

2. **Better Learning Path**
   - Students can focus on one topic area at a time
   - Prerequisites are clear (e.g., basics before ANOVA)
   - Natural progression within each section

3. **Consistency Across Site**
   - All major sections now use subsections
   - Uniform structure makes site more professional
   - Follows pattern already established in Deskriptivní statistika

4. **Reduced Cognitive Load**
   - Collapsible subsections prevent overwhelming users
   - Grouped related concepts together
   - Sidebar is more manageable

5. **Flexibility for Future Growth**
   - Easy to add new questions to appropriate subsections
   - Clear where each new topic belongs
   - Order numbers leave room for insertions (increments of 10)

## File Statistics

- **Total pages before:** 84
- **Total pages after:** 91 (+7 new ANOVA pages)
- **Inferenční statistika:** 45 pages organized into 8 subsections
- **Pravděpodobnost:** 9 pages organized into 3 subsections
- **Časové řady:** 9 pages organized into 3 subsections
- **Kauzální inference:** 7 pages organized into 2 subsections

## Next Steps for Testing

1. **Render the site:**
   ```bash
   quarto render
   ```

2. **Preview locally:**
   ```bash
   quarto preview
   ```

3. **Check for:**
   - All pages render correctly
   - Navigation sidebar shows proper hierarchy
   - Subsections collapse/expand properly
   - Search functionality still works
   - All 7 new ANOVA pages display correctly with visualizations

4. **Commit changes:**
   ```bash
   git add .
   git commit -m "Add ANOVA section and reorganize site with subsections"
   git push
   ```

## Technical Details

- **Configuration file:** `_quarto.yml`
- **YAML syntax:** Validated with `quarto check` ✓
- **New files location:** `lessons/inferential_statistics/`
- **Order numbers:** 370-430 (increments of 10 for future insertions)
- **Language:** Czech throughout
- **Style:** Consistent with existing pages (R code, visualizations, callout boxes)

## Design Principles Applied

1. **Logical grouping:** Related concepts together
2. **Progressive complexity:** Basics → Intermediate → Advanced
3. **Theory to practice:** Concepts → Applications → Diagnostics
4. **Consistency:** Same structure across all sections
5. **Scalability:** Easy to add new content

## Contact

If you need to add more questions in the future:
- Use order numbers ending in 5 (e.g., 375, 385) to insert between existing pages
- Follow the established pattern for subsections
- Maintain Czech language throughout
- Include R code examples and visualizations
- Use callout boxes for important notes

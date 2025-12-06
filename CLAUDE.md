# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Quarto-based website containing Q&A materials for a statistics course at VŠPJ (course 500138). The site presents individual questions and answers that students can read independently while studying, with deliberately redundant content to allow standalone reading of each question.

## Technology Stack

- **Quarto**: Static site generator for technical content
- **R/RStudio**: Development environment (.Rproj present)
- **Czech Language**: All content is in Czech

## Build and Preview Commands

```bash
# Render the entire site (outputs to docs/)
quarto render

# Preview the site locally with live reload
quarto preview

# Render a single file
quarto render path/to/file.qmd

# Render a specific section
quarto render lessons/descriptive_stat/
```

## Site Architecture

### Output Configuration
- **Output Directory**: `docs/` (configured in `_quarto.yml`)
- Built HTML files go to `docs/` directory, which is likely served via GitHub Pages
- The `_site/` directory is gitignored

### Content Organization

Content is organized in a hierarchical structure under `lessons/`:

```
lessons/
├── descriptive_stat/
│   ├── stat_intro/           # Statistical basics
│   ├── basic_statistics/     # Descriptive statistics
│   ├── visualizations/       # Data visualization concepts
│   ├── correlations_regressions/  # Correlation and regression
│   └── contingency_tables/   # Contingency table analysis
├── probability/              # Probability theory
├── time_series/             # Time series analysis
├── inferential_statistics/  # Inferential statistics
└── causal_inference/        # Causal inference and DAGs
```

Each `.qmd` file represents one question/answer pair, with the question typically embedded in the filename (e.g., `jaky_je_rozdil_mezi_populaci_a_vzorkem.qmd`).

### Site Configuration (_quarto.yml)

- **Website Title**: "Otázky a odpovědi ze Statistiky"
- **Sidebar**: Floating style with search, auto-generated from directory structure
- **Theme**: Cosmo
- **Rendering**: All `.qmd` files in root and `lessons/**/*.qmd`

## File Conventions

### Lesson File Structure

Each lesson file (`.qmd`) follows this YAML frontmatter pattern:

```yaml
---
title: "Descriptive Title"
order: 10                     # Controls ordering in sidebar
author: Filip Děchtěrenko
date: 2025-09-20
date-modified: last-modified
execute:
  warning: false
  message: false
  cache: false
format:
  html:
    toc: true
    code-fold: true
    code-summary: "Zobrazit kód"
    embed-resources: true
editor: source
---
```

### Content Structure
- Lesson files use standard Markdown with Quarto extensions
- R code chunks can be included with `{r}` blocks
- Images are referenced from `img/` subdirectories relative to the lesson
- Callout boxes use Quarto syntax: `::: {.callout-tip}`

### File Naming
- Files use Czech descriptive names matching the question
- Some intro files are prefixed with numbers (e.g., `1_jaky_je_rozdil_mezi_populaci_a_vzorkem.qmd`) to control ordering

## Working with Content

### Adding New Questions
1. Create a new `.qmd` file in the appropriate `lessons/` subdirectory
2. Follow the YAML frontmatter convention above
3. Use Czech language for all content
4. The sidebar will automatically include the new file based on the directory structure defined in `_quarto.yml`

### Modifying Questions
- Edit the `.qmd` files directly
- The `date-modified: last-modified` will auto-update
- Run `quarto render` or `quarto preview` to see changes

### Navigation Structure
The sidebar is auto-generated from the directory structure defined in `_quarto.yml`:
- Top-level sections correspond to major topics
- Subsections are organized by category
- Files are ordered by the `order` field in frontmatter or filename prefixes

## Git Workflow

The current git state shows:
- Many HTML files in `docs/` are marked as deleted (D) - likely being regenerated
- Several `.qmd` source files have been modified (M)
- New HTML files are untracked (??) - these are the regenerated outputs

When committing:
- Stage modified `.qmd` source files
- Stage changes in `docs/` directory (the build output)
- The `.quarto/` directory is gitignored (build cache)

## Important Notes

- **Czech Content**: All lesson content, titles, and UI text are in Czech
- **Output to docs/**: The site builds to `docs/` (not `_site/`), likely for GitHub Pages deployment
- **Redundant by Design**: Answers are intentionally redundant so each question can be read independently
- **R Code Support**: Lessons can include R code chunks that execute during rendering
- **Code Folding**: R code is hidden by default with "Zobrazit kód" (Show Code) toggles

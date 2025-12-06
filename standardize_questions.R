# Script to standardize all question files
# This script fixes common formatting issues across all .qmd files

library(stringr)

# Function to standardize a single file
standardize_file <- function(file_path) {
  cat("Processing:", file_path, "\n")

  # Read file
  content <- readLines(file_path, warn = FALSE, encoding = "UTF-8")
  content_text <- paste(content, collapse = "\n")

  # Flag to track if changes were made
  changed <- FALSE

  # Fix 1: Change first H1 heading after YAML to ## Úvod
  # Match first heading after --- block
  pattern1 <- "(---[\\s\\S]*?---\\s*\n+)(# [^\\n]+)"
  if (str_detect(content_text, pattern1)) {
    # Extract the H1 title to check if it's a duplicate of YAML title
    h1_match <- str_match(content_text, pattern1)
    if (!is.na(h1_match[1, 3])) {
      h1_text <- str_trim(str_remove(h1_match[1, 3], "^# "))

      # Common intro patterns that should become "## Úvod"
      intro_patterns <- c(
        "^Úvod",
        "^Co je",
        "^Co to je",
        "^Jak",
        "^Jaké",
        "^Kdy",
        "^Proč"
      )

      should_replace <- any(sapply(intro_patterns, function(p) str_detect(h1_text, p)))

      if (should_replace) {
        content_text <- str_replace(
          content_text,
          pattern1,
          "\\1## Úvod"
        )
        changed <- TRUE
      }
    }
  }

  # Fix 2: Ensure there's an order field in YAML (if missing, add a default)
  if (!str_detect(content_text, "order:")) {
    content_text <- str_replace(
      content_text,
      "(title: [^\\n]+\n)",
      "\\1order: 100\n"
    )
    changed <- TRUE
  }

  # Fix 3: Change "Shrnutí" to "Závěr" for consistency
  content_text <- str_replace_all(content_text, "## Shrnutí", "## Závěr")
  if (str_detect(content_text, "## Závěr") && changed == FALSE) {
    # Check if this was actually changed
    original_text <- paste(content, collapse = "\n")
    if (original_text != content_text) changed <- TRUE
  }

  # Fix 4: Remove informal endings
  informal_patterns <- c(
    "Pokud máte jakékoliv otázky[^\\n]*neváhejte[^\\n]*!",
    "Pokud si přejete další příklady[^\\n]*obrátit[^\\n]*!"
  )

  for (pattern in informal_patterns) {
    if (str_detect(content_text, pattern)) {
      content_text <- str_replace_all(content_text, pattern, "")
      changed <- TRUE
    }
  }

  # Fix 5: Remove trailing code block markers (``` at end)
  content_text <- str_replace(content_text, "```\\s*$", "")

  # Fix 6: Ensure file ends with single newline
  content_text <- str_trim(content_text)
  content_text <- paste0(content_text, "\n")

  # Write back if changed
  if (changed || content_text != paste(content, collapse = "\n")) {
    writeLines(content_text, file_path, useBytes = TRUE)
    cat("  ✓ Updated\n")
    return(TRUE)
  } else {
    cat("  - No changes needed\n")
    return(FALSE)
  }
}

# Find all .qmd files in lessons directory
qmd_files <- list.files(
  path = "lessons",
  pattern = "\\.qmd$",
  recursive = TRUE,
  full.names = TRUE
)

cat("Found", length(qmd_files), "question files\n\n")

# Process each file
results <- sapply(qmd_files, standardize_file)

# Summary
cat("\n" , "=== Summary ===\n")
cat("Total files:", length(results), "\n")
cat("Updated:", sum(results), "\n")
cat("Unchanged:", sum(!results), "\n")

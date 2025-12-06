# Script to fix equation rendering issues
# Converts LaTeX \(...\) to $...$ and \[...\] to $$...$$

# Function to fix equations in a single file
fix_equations <- function(file_path) {
  cat("Processing:", file_path, "\n")

  # Read file
  content <- readLines(file_path, warn = FALSE, encoding = "UTF-8")
  content_text <- paste(content, collapse = "\n")

  original <- content_text

  # Fix 1: Convert \( to $
  content_text <- gsub("\\\\\\(", "$", content_text, fixed = FALSE)

  # Fix 2: Convert \) to $
  content_text <- gsub("\\\\\\)", "$", content_text, fixed = FALSE)

  # Fix 3: Convert \[ to $$
  content_text <- gsub("\\\\\\[", "$$", content_text, fixed = FALSE)

  # Fix 4: Convert \] to $$
  content_text <- gsub("\\\\\\]", "$$", content_text, fixed = FALSE)

  # Check if changes were made
  if (content_text != original) {
    writeLines(content_text, file_path, useBytes = TRUE)
    cat("  ✓ Fixed equations\n")
    return(TRUE)
  } else {
    cat("  - No equation issues found\n")
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
results <- sapply(qmd_files, fix_equations)

# Summary
cat("\n", "=== Summary ===\n")
cat("Total files:", length(results), "\n")
cat("Fixed:", sum(results), "\n")
cat("No issues:", sum(!results), "\n")

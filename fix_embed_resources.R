# Script to remove embed-resources: true from all .qmd files
# This causes issues in Quarto website projects

library(stringr)

# Get all .qmd files with embed-resources
files <- list.files("lessons", pattern = "\\.qmd$", recursive = TRUE, full.names = TRUE)

fixed_count <- 0

for (file in files) {
  # Read the file
  content <- readLines(file, warn = FALSE)

  # Check if it contains embed-resources: true
  if (any(grepl("embed-resources:\\s*true", content))) {
    cat("Fixing:", file, "\n")

    # Find the line with embed-resources
    embed_line <- which(grepl("embed-resources:\\s*true", content))

    # Remove that line
    content <- content[-embed_line]

    # Write back
    writeLines(content, file)
    fixed_count <- fixed_count + 1
  }
}

cat("\nFixed", fixed_count, "files\n")

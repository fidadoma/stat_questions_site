# Post-render script to copy figure directories to docs

# Find all *_files directories in lessons
files_dirs <- list.dirs("lessons", recursive = TRUE, full.names = TRUE)
files_dirs <- files_dirs[grepl("_files$", files_dirs)]

# Copy each to corresponding location in docs
for (dir in files_dirs) {
  # Get the relative path
  rel_path <- sub("^lessons/", "", dir)
  dest_dir <- file.path("docs/lessons", rel_path)

  # Create parent directory if needed
  dest_parent <- dirname(dest_dir)
  if (!dir.exists(dest_parent)) {
    dir.create(dest_parent, recursive = TRUE)
  }

  # Copy the directory
  if (dir.exists(dir)) {
    cat("Copying:", dir, "->", dest_dir, "\n")
    # Remove existing if present
    if (dir.exists(dest_dir)) {
      unlink(dest_dir, recursive = TRUE)
    }
    file.copy(dir, dirname(dest_dir), recursive = TRUE)
  }
}

cat("\nFigure directories copied successfully!\n")

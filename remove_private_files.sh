#!/bin/bash

git ls-files -z | while IFS= read -r -d '' file; do
  if grep -q -F -x "$file" .gitignore; then
    echo "$file"
  fi
done

# Remove all files and directories listed in .gitignore from the Git index

# Make sure .gitignore exists
if [ ! -f .gitignore ]; then
  echo "❌ No .gitignore file found."
  exit 1
fi

# Read .gitignore and remove matching tracked files
echo "🔍 Removing tracked files matching .gitignore entries..."
# All files tracked by git:
# git ls-files -z  
    # -z: Outputs file names separated by a null byte (\0) instead of newlines. 

# This line reads each file safely one at a time from the null-separated output of git ls-files -z.
# while IFS= read -r -d '' file; do
    # IFS=: (Clears) Sets the Internal Field Separator to nothing, so read treats the entire line as a single field, even if it contains spaces or special characters (prevents word splitting).
    # -r: Prevents backslash escape interpretation, allowing safe parsing of file names.
    # -d '': Tells read to split on null byte (\0) instead of newline.
    # file: The variable name holding each file path.

# This checks if the current file is exactly listed in .gitignore.  This protects against partial matches or accidental removals. 
# If the file path (e.g., build/somefile.dart) exactly matches a line in .gitignore, the condition returns true.
#  if grep -q -F -x "$file" .gitignore
    # grep options:
    #  -q: Quiet — grep will return true/false but not print the match.
    #  -F: Fixed strings — treats the pattern as a literal string, not a regex.
    #  -x: Exact match of the whole line.

# This checks if the current file's directory is listed in .gitignore. The `${file%%/*}/` syntax extracts the directory part of the file path (everything before the first slash) and appends a slash to it. This is useful for ignoring all files in a directory, even if the directory itself is not explicitly listed in .gitignore.
# || grep -q -F -x "${file%%/*}/"

# If the file matches, it is removed from the Git index (staging area). This command stops tracking the file without deleting it from the working directory.
# git rm --cached "$file"



git ls-files -z | while IFS= read -r -d '' file; do
  if grep -q -F -x "$file" .gitignore || grep -q -F -x "${file%%/*}/" .gitignore; then
    git rm --cached "$file"
  fi
done

echo "Done. Run 'git commit -m \"Remove ignored files\"' to commit changes."


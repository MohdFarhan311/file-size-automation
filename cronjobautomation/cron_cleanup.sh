#!/bin/bash

# CONFIG
REPO_DIR="$HOME/file-size-automation"
SIZE_LIMIT=50M
LOG_FILE="$REPO_DIR/cron_cleanup.log"

cd "$REPO_DIR" || exit 1

echo "----------------------------" >> $LOG_FILE
echo "CRON RUN: $(date)" >> $LOG_FILE

# Find large files (>50MB)
LARGE_FILES=$(find . -type f -size +$SIZE_LIMIT ! -path "./.git/*")

if [ -n "$LARGE_FILES" ]; then
    echo "Large files found:" >> $LOG_FILE
    echo "$LARGE_FILES" >> $LOG_FILE

    # Delete large files
    echo "$LARGE_FILES" | xargs rm -f
    echo "Large files deleted" >> $LOG_FILE
else
    echo "No large files found" >> $LOG_FILE
fi

# Git operations
git add -u
git add $(find . -type f -size -$SIZE_LIMIT ! -path "./.git/*" 2>/dev/null)

if git diff --cached --quiet; then
    echo "Nothing to commit" >> $LOG_FILE
else
    git commit -m "auto: cleanup large files and commit safe files"
    git push origin main
    echo "Changes committed and pushed" >> $LOG_FILE
fi

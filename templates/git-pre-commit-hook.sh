#!/bin/bash
# Git Pre-Commit Hook for PROJECT_JOURNAL.md Maintenance
# 
# Purpose: Automatically remind to update journal before committing code changes
# Installation: Copy to .git/hooks/pre-commit and make executable
# 
# Usage:
#   cp git-pre-commit-hook.sh .git/hooks/pre-commit
#   chmod +x .git/hooks/pre-commit

# Skip if no staged changes outside docs/
CODE_CHANGED=$(git diff --cached --name-only | grep -v "^docs/" | wc -l | tr -d ' ')

if [ "$CODE_CHANGED" -gt 0 ]; then
  # Check if journal updated today
  TODAY=$(date +%Y-%m-%d)
  
  if [ -f "docs/PROJECT_JOURNAL.md" ]; then
    JOURNAL_UPDATED=$(grep "$TODAY" docs/PROJECT_JOURNAL.md 2>/dev/null | wc -l | tr -d ' ')
    
    if [ "$JOURNAL_UPDATED" -eq 0 ]; then
      echo ""
      echo "⚠️  Code changed but PROJECT_JOURNAL.md not updated today"
      echo ""
      echo "   📝 Please document your work before committing:"
      echo ""
      echo "   Option 1: Tell Warp AI agent:"
      echo "     'Update the project journal'"
      echo ""
      echo "   Option 2: Run workflow:"
      echo "     warp workflow run update_journal"
      echo ""
      echo "   Option 3: Override this check (not recommended):"
      echo "     git commit --no-verify"
      echo ""
      exit 1
    fi
  fi
fi

# All checks passed - allow commit
exit 0

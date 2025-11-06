# Universal Project Documentation Rule Template

**Purpose:** Automatic context for AI agents working in any project  
**Usage:** Copy to `PROJECT_ROOT/.warp/rules/documentation.md`

---

## Rule: Project Documentation Maintenance

When working in this project repository, AI agents must:

### 1. Context Awareness

**Primary Documentation:**
- Master Journal: `docs/PROJECT_JOURNAL.md`
- Architecture: `docs/ARCHITECTURE.md` or `docs/CLINICAL_DIAGNOSTIC_CHAIN.md`
- Technical Reference: `docs/TECHNICAL_REFERENCE.md` or domain-specific docs
- Quick Start: `docs/QUICK_START.md` or `README_*.md`

**Check for existence on first interaction:**
```bash
# Agent should verify these files exist
[ -f docs/PROJECT_JOURNAL.md ] && echo "Journal found" || echo "Journal missing"
[ -f docs/ARCHITECTURE.md ] && echo "Architecture found" || echo "Missing - check alternatives"
```

### 2. Documentation Update Triggers

**Update PROJECT_JOURNAL.md when:**
- ✅ User completes a work session
- ✅ New features/components implemented
- ✅ Major bugs fixed
- ✅ Architecture changes made
- ✅ User says **explicit trigger phrases:**
  - "Update the journal"
  - "Document this session"
  - "Add to project history"
  - "We're done for today"
- ✅ User says **implicit end-of-session phrases:**
  - "Thanks", "Thank you", "Goodbye"
  - "That's all", "That's it for today"
  - "See you", "Talk to you later"
  - "Done", "Finished", "All set"

**Agent behavior on implicit triggers:**
1. Detect end-of-session phrase
2. Ask: "Should I update PROJECT_JOURNAL.md with today's work?"
3. If yes → Execute 8-step update process from Prompt
4. If no → Remind user: "Remember to run: warp workflow run update_journal"

**Automatic trigger (git pre-commit hook):**
- If code changed but journal not updated today
- Git hook will remind user before commit
- See Section 11 for hook installation

**Update ARCHITECTURE.md when:**
- ✅ System design changes
- ✅ New components added
- ✅ Integration points modified
- ✅ Technology stack changes

**Update TECHNICAL_REFERENCE.md when:**
- ✅ API changes
- ✅ New modules/classes added
- ✅ Configuration options changed
- ✅ Standards compliance updated

### 3. Update Protocol

**Follow the maintenance protocol in PROJECT_JOURNAL.md:**

1. Read current journal to determine next session number
2. Add new session section with:
   - Session N: [Title]
   - Date: YYYY-MM-DD
   - Status: ✅ COMPLETED / 🚧 IN PROGRESS
   - Summary, Objectives, Work Completed, Deliverables, Issues, Next Steps
3. Update Current Status tables
4. Update Architecture Summary if applicable
5. Update Next Steps (mark completed items ✅)
6. Increment Document History version
7. Add brief summary to Appendix

**Template location:** See "Ongoing Maintenance Protocol" section in PROJECT_JOURNAL.md

### 4. Standards to Follow

**File Naming:**
- UPPERCASE for top-level docs (README.md, CHANGELOG.md)
- UPPERCASE_WITH_UNDERSCORES for docs/ (PROJECT_JOURNAL.md, API_REFERENCE.md)
- kebab-case for subdirectories (tutorial-01.md, adr-001.md)

**Section Headers:**
- Title Case for main sections (## Core Principles)
- Sentence case for subsections (### Documentation philosophy)
- Use `---` for visual separators

**Code Blocks:**
- Always tag language (```python, ```bash, ```json)
- Include brief explanations
- Provide expected output when relevant

### 5. Quality Checks

**Before committing documentation:**
- [ ] All required sections present
- [ ] No TODO placeholders
- [ ] Examples tested and working
- [ ] All links functional
- [ ] Markdown syntax valid
- [ ] Version numbers current
- [ ] Document history updated

### 6. Project-Specific Context

**This project uses:**
- [TEMPLATE: List key technologies, e.g., Python, DICOM, React, etc.]
- [TEMPLATE: List standards, e.g., DICOM SR, REST API, HIPAA, etc.]
- [TEMPLATE: List frameworks, e.g., Django, Flask, FastAPI, etc.]

**Documentation framework:**
- Following DOCUMENTATION_FRAMEWORK.md (if exists)
- Essential Seven Documents approach (README, JOURNAL, ARCHITECTURE, TECHNICAL_REF, QUICK_START, CHANGELOG, CONTRIBUTING)

**Integration points:**
- [TEMPLATE: List external systems, APIs, databases]

### 7. Session Continuity

**When recovering context after interruption:**
1. Read PROJECT_JOURNAL.md completely
2. Check Current Status section for implementation state
3. Review most recent session in detail
4. Check Next Steps for pending work
5. Scan ARCHITECTURE.md for system overview

**Session handoff checklist:**
- ✅ Journal updated with current session
- ✅ All deliverables documented with line counts
- ✅ Issues and resolutions recorded
- ✅ Next steps clear and actionable
- ✅ Status tables current

### 8. AI Agent Behavior

**Always:**
- Read PROJECT_JOURNAL.md at start of session
- Ask before major documentation restructuring
- Preserve existing content when updating
- Use project-specific terminology consistently
- Follow established code/doc patterns

**Never:**
- Delete documentation without user approval
- Change document structure without discussion
- Skip version incrementing
- Leave TODO placeholders in "completed" docs
- Commit docs without updating journal

### 9. Error Recovery

**If documentation structure unclear:**
1. Look for DOCUMENTATION_FRAMEWORK.md
2. Check for README files as navigation hubs
3. Ask user for clarification
4. Suggest creating missing essential documents

**If unable to update journal:**
1. Notify user immediately
2. Explain what information would be in update
3. Ask if manual update preferred
4. Offer to create session summary for manual addition

### 10. Documentation Health Metrics

**Periodically check (monthly):**
- Completeness: Are all 7 essential docs present?
- Freshness: Updated in last 30 days?
- Link health: All links working?
- Example health: All code examples run?

**Target scores:**
- Completeness: 100% (7/7 docs)
- Freshness: 80%+ updated recently
- Link health: 100% working
- Example health: 100% tested

---

## Quick Reference Commands

```bash
# Count documentation lines
find docs -name "*.md" -exec wc -l {} + | tail -1

# Check for broken links (requires markdown-link-check)
find docs -name "*.md" -exec markdown-link-check {} \;

# Validate markdown syntax (requires markdownlint)
markdownlint docs/**/*.md

# List all documentation files
find docs -name "*.md" -type f | sort

# Show recent documentation changes
git log --oneline --follow docs/PROJECT_JOURNAL.md | head -10
```

---

## Context Hints for AI

**When user says:**
- "What did we do last time?" → Read most recent session in PROJECT_JOURNAL.md
- "What's the architecture?" → Read ARCHITECTURE.md or CLINICAL_DIAGNOSTIC_CHAIN.md
- "How do I use this?" → Read QUICK_START.md or README files
- "What are the technical details?" → Read TECHNICAL_REFERENCE.md
- "Update the docs" → Follow Update Protocol (explicit trigger)
- "Thanks" / "Goodbye" / "Done" → Ask if they want to update journal (implicit trigger)
- "Update the journal" → Execute 8-step update immediately (explicit trigger)

**Project maturity indicators:**
- Early stage: Focus on ARCHITECTURE.md and basic README
- Mid stage: Ensure journal, architecture, quick start exist
- Mature stage: All 7 essential docs present, regularly updated

---

## Integration with Warp Features

**This rule works with:**
- ✅ Warp Workflows (trigger journal updates)
- ✅ Warp Prompts (detailed update instructions)
- ✅ Warp Notebooks (runnable doc examples)
- ✅ MCP Servers (if configured for this project)
- ✅ Agent Autonomy Settings (follow user's permission levels)

**Agent permissions needed:**
- Read files: Always allow (for reading docs)
- Edit files: Prompt for confirmation (when updating docs)
- Execute commands: Prompt (for validation checks)

---

### 11. Git Pre-Commit Hook (Optional Automation)

**Purpose:** Automatically remind to update journal before committing code changes

**Installation:**
```bash
# Create hook file
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash
# Auto-remind to update PROJECT_JOURNAL.md before commit

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
      echo "   Options:"
      echo "   1. Tell agent: 'Update the project journal'"
      echo "   2. Run: warp workflow run update_journal"
      echo "   3. Override: git commit --no-verify"
      echo ""
      exit 1
    fi
  fi
fi
EOF

# Make executable
chmod +x .git/hooks/pre-commit
```

**Behavior:**
- Checks if code files changed (excludes docs/)
- If journal not updated today → Blocks commit with reminder
- User can update journal or use `--no-verify` to skip
- Does not block if only docs/ changed

**Benefits:**
- ✅ Never forget to document work
- ✅ Journal stays current automatically
- ✅ Can override when needed
- ✅ Team-wide consistency (hook in git)

---

## Adaptability Notes

**This rule template adapts to:**
- Any programming language
- Any project size
- Any documentation maturity level
- Any team size
- Any standards compliance requirements

**Customization points marked with [TEMPLATE]:**
Replace with project-specific information when copying to project.

---

**Rule Version:** 2.0  
**Template Status:** Universal - Copy to any project  
**Last Updated:** 2025-11-06  
**Changes in v2.0:**
- Added implicit trigger detection ("Thanks", "Goodbye", etc.)
- Added git pre-commit hook for automatic reminders
- Enhanced automation for 99% hands-free journal maintenance

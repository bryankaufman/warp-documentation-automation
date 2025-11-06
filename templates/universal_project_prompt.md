# Universal Project Journal Update Prompt Template

**Purpose:** Detailed instructions for updating PROJECT_JOURNAL.md  
**Usage:** Copy to `PROJECT_ROOT/.warp/prompts/update_journal.md`

---

# Update Project Journal

## Instructions for Warp AI Agent

Update the project journal at `docs/PROJECT_JOURNAL.md` following the established maintenance protocol.

### Step 1: Gather Context

**Read these files first:**
1. `docs/PROJECT_JOURNAL.md` - Get current state, last session number, version
2. `docs/ARCHITECTURE.md` (or project-specific architecture doc) - Check for design changes
3. Recent git commits - `git log --oneline --since="1 day ago"`
4. Changed files - `git diff --name-only HEAD~1`

### Step 2: Determine Session Number

**Parse PROJECT_JOURNAL.md to find:**
- Last session number (e.g., "Session 3" → next is Session 4)
- Current document version
- Last update date

**If no sessions exist:** Start with Session 1

### Step 3: Create New Session Section

**Insert after the last session, before "Current Status":**

```markdown
## Session N: [Descriptive Title]

**Date:** YYYY-MM-DD  
**Status:** ✅ COMPLETED / 🚧 IN PROGRESS  
**Summary:** One-sentence overview of work completed

### Objectives

List what was planned:
- Objective 1
- Objective 2
- Objective 3

### Work Completed

Detail what was actually done:
- ✅ Task 1 (describe outcome)
- ✅ Task 2 (describe outcome)
- ⏳ Task 3 (if partially completed)

### Test Results

If tests were run:
- Test suite: [Results]
- Integration tests: [Results]
- Manual testing: [Observations]

**If no testing:** State "No testing performed in this session"

### Deliverables

Document all outputs with line counts:
- `path/to/file.py` (XXX lines) - Brief description
- `docs/NEW_DOC.md` (YYY lines) - Brief description
- Updated `existing/file.js` (+50/-20 lines) - What changed

**Calculate line counts:**
```bash
wc -l path/to/file.ext
```

### Issues and Resolutions

**Issue:** Description of problem encountered  
**Resolution:** How it was fixed

**Issue:** Another problem  
**Resolution:** Solution applied

**If no issues:** State "No significant issues encountered"

### Next Steps Identified

Based on this session's work:
1. Next task to tackle
2. Follow-up item
3. Future consideration

---
```

### Step 4: Update Current Status Section

**Locate "## Current Status" and update:**

#### Implementation Status Table

Add or update rows for new components:
```markdown
| Component | Status | Version | Lines | Tests |
|-----------|--------|---------|-------|-------|
| Stage N | ✅ PRODUCTION | 1.0 | 500 | Passing ✓ |
```

**Status options:**
- ✅ PRODUCTION - Complete and deployed
- ✅ IMPLEMENTED - Complete, testing pending
- 🚧 IN PROGRESS - Actively being worked on
- ⏸️ DEFERRED - Planned but not started
- 🚧 STUB - Placeholder for future work

#### Documentation Status Table

Update with new docs:
```markdown
| Document | Status | Lines | Purpose |
|----------|--------|-------|---------|
| NEW_DOC.md | ✅ CURRENT | 300 | New feature guide |
```

#### Standards Compliance Table

Update if compliance changes:
```markdown
| Standard | Version | Compliance | Notes |
|----------|---------|------------|-------|
| New Standard | 1.0 | ✅ Full | Newly implemented |
```

### Step 5: Update Architecture Summary (If Applicable)

**If system design changed:**

Update these subsections in "Architecture Summary":
- System Design (add new components)
- Data Flow (update flow diagrams)
- Technology Stack (add new tech)

**If no architecture changes:** Skip this step

### Step 6: Update Next Steps

**In "## Next Steps" section:**

1. **Mark completed items:**
   Change `- Task` to `- ~~Task~~ ✅ COMPLETED (Session N)`

2. **Add new tasks discovered:**
   Insert new tasks under appropriate timeframe (Immediate/Short-term/etc.)

3. **Adjust timelines:**
   Move tasks between timeframes if priorities changed

**Example:**
```markdown
### Immediate (Q1 2025)

1. ~~PACS Integration Testing~~ ✅ COMPLETED (Session 4)
2. Clinical Pilot - 5 test cases
3. **NEW:** Implement feature X (identified in Session 4)
```

### Step 7: Increment Document History

**At bottom of file, update "Document History" table:**

```markdown
| Date | Version | Changes | Author |
|------|---------|---------|--------|
| YYYY-MM-DD | X.Y | Session N added: [brief summary] | AI Assistant |
```

**Version numbering:**
- Increment minor version (1.0 → 1.1) for session additions
- Increment major version (1.9 → 2.0) for major restructuring

### Step 8: Add Session Summary to Appendix

**In "## Appendix: Session Summaries", add:**

```markdown
### Session N Conversation Summary

**Topics:**
- Topic 1
- Topic 2

**Progress:**
- Achievement 1
- Achievement 2

**Completion Criteria:**
- ✅ Criterion 1 met
- ✅ Criterion 2 met
```

---

## Quality Checklist

Before finalizing, verify:

- [ ] Session number is sequential
- [ ] Date is correct (YYYY-MM-DD format)
- [ ] All deliverables have line counts
- [ ] Status tables updated accurately
- [ ] Document history incremented
- [ ] No TODO placeholders left
- [ ] Markdown syntax valid (no broken tables)
- [ ] Next steps reflect current priorities
- [ ] Appendix summary added

---

## Example Session (Template)

```markdown
## Session 4: PACS Integration Testing

**Date:** 2025-01-15  
**Status:** ✅ COMPLETED  
**Summary:** Successfully tested DICOM SR upload to institutional PACS

### Objectives

- Test DICOMweb STOW-RS upload
- Validate SR documents with DICOM validator
- Configure authentication tokens

### Work Completed

- ✅ Configured PACS endpoint (https://pacs.hospital.org/dicomweb)
- ✅ Tested upload with 10 sample SR documents
- ✅ Validated all documents pass DICOM validator
- ✅ Set up OAuth2 authentication flow

### Test Results

- Upload success rate: 10/10 (100%)
- Validation: All documents pass DVTk validator
- Performance: Average upload time 1.2 seconds

### Deliverables

- `config/pacs_config.py` (120 lines) - PACS connection configuration
- `tests/test_pacs_upload.py` (200 lines) - Integration test suite
- `docs/PACS_DEPLOYMENT.md` (150 lines) - Deployment documentation

### Issues and Resolutions

**Issue:** OAuth2 token expiration after 1 hour  
**Resolution:** Implemented automatic token refresh with 5-minute buffer

**Issue:** Network timeout on large SR documents  
**Resolution:** Increased timeout to 30 seconds, added retry logic

### Next Steps Identified

1. Test with production clinical cases (5 patient studies)
2. Set up monitoring for failed uploads
3. Document rollback procedure for errors
```

---

## Adaptation Notes

**This prompt adapts to:**
- Projects at any maturity level
- Any documentation structure
- Any team size or workflow
- Projects with or without testing

**Customization:**
Replace references to project-specific files/paths when copying.

**Agent permissions required:**
- Read files: Always allow
- Edit files: Prompt for confirmation
- Execute commands: Prompt (for git commands, line counts)

---

## Natural Language Triggers

**Explicit triggers (immediate execution):**
- "Update the project journal"
- "Document today's work"
- "Add this session to the journal"
- "Update the docs with what we did"
- "We're done, update journal"

**Implicit triggers (asks first):**
- "Thanks", "Thank you", "Goodbye"
- "That's all", "Done", "Finished"
- "See you", "Talk to you later"

**Agent behavior:**
- **Explicit trigger** → Load this prompt immediately, execute all 8 steps
- **Implicit trigger** → Ask: "Should I update PROJECT_JOURNAL.md?" then execute if yes
- **Either way** → Show user changes and ask for approval before saving

**Automatic trigger (git hook):**
- If user tries to commit without updating journal
- Git hook blocks commit with reminder
- User can then trigger update or use `--no-verify`

---

**Prompt Version:** 2.0  
**Template Status:** Universal - Copy to any project  
**Last Updated:** 2025-11-06  
**Changes in v2.0:**
- Added implicit trigger documentation
- Added git hook integration notes
- Enhanced for 99% automatic workflow

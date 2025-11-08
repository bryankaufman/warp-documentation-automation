# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Common Commands

### Install Templates Globally
```bash
# Copy all templates to global Warp templates directory
mkdir -p ~/.warp/templates
cp templates/* ~/.warp/templates/
```

### Deploy Templates to a Test Project
```bash
# Navigate to any test project
cd /path/to/test/project

# Create Warp directory structure
mkdir -p .warp/{rules,prompts,workflows}

# Copy templates from global location
cp ~/.warp/templates/universal_project_rule.md .warp/rules/documentation.md
cp ~/.warp/templates/universal_project_prompt.md .warp/prompts/update_journal.md
cp ~/.warp/templates/universal_project_workflow.yaml .warp/workflows/update_journal.yaml

# Install git pre-commit hook (optional)
if [ -d .git ]; then
  cp ~/.warp/templates/git-pre-commit-hook.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
fi
```

### Test the Workflow System
```bash
# In a project with deployed templates, run:
warp workflow run update_journal

# This displays:
# - Current journal status
# - Last session number
# - Recent git activity
# - Instructions for triggering journal updates
```

### Test the Git Pre-Commit Hook
```bash
# In a project with the hook installed:
.git/hooks/pre-commit

# Or simulate a commit (will block if journal not updated today):
git add some_file.py
git commit -m "test"
# Expected: Hook blocks with reminder to update journal

# Override if needed:
git commit --no-verify -m "test"
```

### Validate Bash Scripts
```bash
# Validate the pre-commit hook script
shellcheck templates/git-pre-commit-hook.sh
```

### Validate Markdown Files
```bash
# Check all markdown files (requires markdownlint-cli)
markdownlint **/*.md

# Or check specific directories
markdownlint templates/*.md docs/*.md
```

### Count Documentation Lines
```bash
# Count lines in all markdown files
find . -name "*.md" -exec wc -l {} + | tail -1
```

## High-Level Architecture

### Four-Component Template System

This repository provides a **template distribution system** for automatic documentation maintenance. It does not consume its own templates—instead, templates are copied to `~/.warp/templates/` for use in other projects.

#### Component Overview

1. **Rule** (`.warp/rules/documentation.md`)
   - Auto-loads when Warp AI agent works in a project
   - Defines both explicit triggers ("Update the journal") and implicit triggers ("Thanks", "Goodbye")
   - Provides context awareness about PROJECT_JOURNAL.md structure and maintenance protocol
   - Always active—enables 99% automatic workflow

2. **Prompt** (`.warp/prompts/update_journal.md`)
   - Detailed 8-step instructions for updating PROJECT_JOURNAL.md
   - Invoked automatically when Rule detects a trigger phrase
   - Guides agent through: gather context → determine session number → create new section → update tables → increment version → add summary

3. **Workflow** (`.warp/workflows/update_journal.yaml`)
   - Status checker and reminder system
   - Shows current journal state, last session, recent commits
   - Tells user what to say to trigger the agent
   - Optional helper if implicit triggers are missed

4. **Git Hook** (`git-pre-commit-hook.sh`)
   - Final safety net—blocks commits if journal not updated today
   - Only triggers when code files (not docs/) are changed
   - Can be overridden with `--no-verify` if needed

#### Automation Flow

```
User works on project
    ↓
User says "Thanks" or "Update the journal"
    ↓
Rule recognizes trigger (implicit or explicit)
    ↓
Agent loads Prompt and follows 8-step process
    ↓
Agent shows proposed changes
    ↓
User approves → Journal automatically updated
    ↓
Git hook verifies journal current on commit
```

### Template Design Philosophy

**Universal Adaptation**: Templates work with any language, framework, or project size. They check for file existence before assuming structure and provide fallbacks for missing documentation.

**[TEMPLATE] Placeholders**: Section 6 of the Rule template contains `[TEMPLATE]` markers for project-specific customization (technologies, standards, integration points). Users replace these when deploying to their projects.

**Three-Layer Triggering**:
- **Layer 1**: Implicit detection ("Thanks" → asks to update)
- **Layer 2**: Workflow reminders (`warp workflow run update_journal`)
- **Layer 3**: Git pre-commit hook (blocks if journal stale)

**Self-Documenting**: Each template file includes deployment instructions, version history, and adaptation notes within itself.

### Repository Structure

```
templates/                              # Core template files (distributed globally)
├── universal_project_rule.md          # Rule with triggers and context awareness
├── universal_project_prompt.md        # 8-step update instructions
├── universal_project_workflow.yaml    # Status checker workflow
├── git-pre-commit-hook.sh             # Automatic commit-time reminder
├── README_TEMPLATE_DEPLOYMENT.md      # Full deployment guide
└── CHANGELOG_v2.0.md                  # Version history

docs/                                   # Repository documentation
├── QUICKSTART.md                       # 5-minute getting started guide
└── [other guides]

examples/                               # Example projects (placeholder for future)

CONTRIBUTING.md                         # Contribution guidelines
README.md                               # Main landing page
```

## Development Workflow

### Modifying Templates

When updating templates, maintain backwards compatibility:

1. **Test changes locally first**:
   ```bash
   # Create test copy
   mkdir -p ~/.warp/templates-dev
   cp templates/* ~/.warp/templates-dev/
   
   # Deploy to a test project
   cd /path/to/test/project
   cp ~/.warp/templates-dev/universal_project_rule.md .warp/rules/documentation.md
   # ... test with real usage
   ```

2. **Preserve Section 6 placeholders**: Always keep `[TEMPLATE]` markers in the Rule's Section 6 for project-specific customization.

3. **Update version numbers**: Increment in template headers and Document History tables.

4. **Test all four components together**: Ensure Rule → Prompt → Workflow → Git Hook integration still works.

### Versioning Scheme

Following the pattern in templates:

- **Minor version** (1.0 → 1.1): Adding trigger phrases, improving instructions, clarifying documentation
- **Major version** (1.9 → 2.0): Restructuring template format, changing section organization, breaking changes

### Testing Before Release

Since this repository has no automated tests, validate manually:

1. **Shellcheck validation**:
   ```bash
   shellcheck templates/git-pre-commit-hook.sh
   ```

2. **Deploy to real project and use for 1-2 sessions**:
   - Test implicit triggers ("Thanks")
   - Test explicit triggers ("Update the journal")
   - Test workflow: `warp workflow run update_journal`
   - Test git hook blocks stale commits

3. **Verify template syntax**: Check that YAML is valid, Markdown renders correctly, bash scripts have no syntax errors.

### Release Process

1. Update version numbers in all template headers
2. Update CHANGELOG_v2.0.md with changes
3. Test deployment to clean project
4. Commit and push to main
5. Create GitHub release with notes
6. Update README.md if needed

### Key Constraints

- **No breaking changes to Section 6**: Projects depend on this structure for customization
- **Maintain trigger phrase compatibility**: Projects using v2.0 triggers should continue to work
- **Preserve 8-step update process**: The Prompt's step sequence is referenced in documentation
- **Keep git hook behavior consistent**: Blocking on stale journal is core to automation


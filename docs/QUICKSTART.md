# Quick Start Guide

**Get up and running in 5 minutes**

This guide will have you documenting automatically by the end of this page.

---

## Prerequisites

Before you begin:

- ✅ [Warp Terminal](https://www.warp.dev/) installed
- ✅ Git installed (for pre-commit hook)
- ✅ A project you want to document
- ✅ 5 minutes of your time

---

## Step 1: Install Templates (1 minute)

### Option A: Clone Repository

```bash
# Clone the repo
git clone https://github.com/yourusername/warp-documentation-automation.git
cd warp-documentation-automation

# Copy templates to global location
mkdir -p ~/.warp/templates
cp templates/* ~/.warp/templates/

# Verify installation
ls ~/.warp/templates/
# You should see:
# - universal_project_rule.md
# - universal_project_prompt.md
# - universal_project_workflow.yaml
# - git-pre-commit-hook.sh
# - README_TEMPLATE_DEPLOYMENT.md
# - CHANGELOG_v2.0.md
```

### Option B: Direct Download (If you don't want to clone)

```bash
mkdir -p ~/.warp/templates
cd ~/.warp/templates

# Download each template file
curl -O https://raw.githubusercontent.com/yourusername/warp-documentation-automation/main/templates/universal_project_rule.md
curl -O https://raw.githubusercontent.com/yourusername/warp-documentation-automation/main/templates/universal_project_prompt.md
curl -O https://raw.githubusercontent.com/yourusername/warp-documentation-automation/main/templates/universal_project_workflow.yaml
curl -O https://raw.githubusercontent.com/yourusername/warp-documentation-automation/main/templates/git-pre-commit-hook.sh

chmod +x git-pre-commit-hook.sh
```

---

## Step 2: Deploy to Your Project (2 minutes)

Navigate to your project and set up the Warp structure:

```bash
# Go to your project
cd /path/to/your/project

# Create Warp directories
mkdir -p .warp/{rules,prompts,workflows}

# Copy templates
cp ~/.warp/templates/universal_project_rule.md .warp/rules/documentation.md
cp ~/.warp/templates/universal_project_prompt.md .warp/prompts/update_journal.md
cp ~/.warp/templates/universal_project_workflow.yaml .warp/workflows/update_journal.yaml

# Install git hook (optional but highly recommended)
if [ -d .git ]; then
  cp ~/.warp/templates/git-pre-commit-hook.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit
  echo "✅ Git hook installed"
else
  echo "⚠️  Not a git repo - skipping hook"
fi
```

---

## Step 3: Customize for Your Project (1 minute)

Open `.warp/rules/documentation.md` and customize **Section 6** only:

```bash
# Open in your editor
code .warp/rules/documentation.md
# or
vim .warp/rules/documentation.md
# or
open -e .warp/rules/documentation.md
```

Find **Section 6: Project-Specific Context** and replace the `[TEMPLATE]` placeholders:

```markdown
### 6. Project-Specific Context

**This project uses:**
- Python 3.9+ with FastAPI framework          # Your tech stack
- PostgreSQL 14 database                       # Your database
- Docker for containerization                  # Your tools
- pytest for testing

**Documentation framework:**
- Following DOCUMENTATION_FRAMEWORK.md
- Essential Seven Documents approach

**Integration points:**
- REST API at https://api.yourproject.com     # Your APIs
- PostgreSQL database: prod_db                 # Your databases
- Redis cache for sessions
- AWS S3 for file storage
```

**That's it!** Everything else is ready to use.

---

## Step 4: Test the System (1 minute)

### Test 1: Run the Workflow

```bash
warp workflow run update_journal
```

You should see:
- Current journal status
- Last session number (or message if journal doesn't exist)
- Recent git activity
- Instructions on what to say to the agent

### Test 2: Create Initial Journal

If `docs/PROJECT_JOURNAL.md` doesn't exist, create it:

```bash
mkdir -p docs

# Ask Warp AI agent:
# "Create a PROJECT_JOURNAL.md following the documentation framework"
```

Or copy a template:

```bash
cat > docs/PROJECT_JOURNAL.md << 'EOF'
# Project Journal

**Version:** 1.0  
**Last Updated:** $(date +%Y-%m-%d)

## Overview

[Brief project description]

## Session History

### Session 1: Initial Setup

**Date:** $(date +%Y-%m-%d)  
**Status:** ✅ COMPLETED  
**Summary:** Initial project setup and documentation framework deployment

#### Objectives
- Deploy Warp Documentation Automation templates
- Configure project-specific settings
- Establish documentation workflow

#### Work Completed
- ✅ Installed templates to `.warp/` directory
- ✅ Customized Rule Section 6 with project details
- ✅ Tested workflow execution
- ✅ Created initial PROJECT_JOURNAL.md

#### Deliverables
- `.warp/rules/documentation.md` - Project-specific rule
- `.warp/prompts/update_journal.md` - Update instructions
- `.warp/workflows/update_journal.yaml` - Status workflow
- `.git/hooks/pre-commit` - Git integration

#### Issues and Resolutions
No issues encountered.

#### Next Steps
1. Begin normal development work
2. Test implicit triggers with "Thanks" phrase
3. Verify git hook blocks commits if journal not updated

---

## Current Status

### Implementation Status

| Component | Status | Version | Notes |
|-----------|--------|---------|-------|
| Documentation System | ✅ DEPLOYED | 2.0 | Ready for use |

---

## Document History

| Date | Version | Changes | Author |
|------|---------|---------|--------|
| $(date +%Y-%m-%d) | 1.0 | Initial journal created | AI Assistant |
EOF

echo "✅ Initial journal created at docs/PROJECT_JOURNAL.md"
```

### Test 3: Try Implicit Trigger

Open Warp AI and say:

```
"Thanks, that's all for today"
```

**Expected response:**
```
"Should I update PROJECT_JOURNAL.md with today's work?"
```

Say: `"Yes"`

The agent will then update the journal automatically!

---

## Step 5: Start Using (0 minutes - Automatic!)

From now on, just work normally:

### Daily Workflow

```
1. Work on your project
2. Make changes, write code
3. At end of session, say: "Thanks" or "Goodbye"
4. Agent asks: "Should I update journal?"
5. Say: "Yes"
6. Done! Documentation updated automatically
```

### Git Integration

```bash
# Make some changes
git add .
git commit -m "Added new feature"

# If journal not updated today, git hook will block:
⚠️  Code changed but PROJECT_JOURNAL.md not updated today

   Options:
   1. Tell Warp agent: 'Update the project journal'
   2. Run: warp workflow run update_journal
   3. Override: git commit --no-verify
```

---

## What's Next?

### Explore Features

1. **Read the full deployment guide**
   ```bash
   cat ~/.warp/templates/README_TEMPLATE_DEPLOYMENT.md
   ```

2. **Check out examples**
   ```bash
   cd ~/warp-documentation-automation/examples/
   ls  # See example projects with templates deployed
   ```

3. **Learn about the framework**
   ```bash
   cat ~/.warp/templates/CHANGELOG_v2.0.md
   ```

### Customize Further

- Add more trigger phrases to Rule Section 2
- Customize the 8-step update process in Prompt
- Modify git hook behavior
- Add project-specific documentation templates

### Share Your Experience

- ⭐ Star the repo on GitHub
- 💬 Join discussions
- 📝 Share your project in the showcase
- 🐛 Report issues or suggest features

---

## Troubleshooting

### Workflow Not Found

```bash
# Verify workflow file exists
ls .warp/workflows/update_journal.yaml

# If missing, re-copy from templates
cp ~/.warp/templates/universal_project_workflow.yaml .warp/workflows/update_journal.yaml
```

### Agent Doesn't Recognize Triggers

```bash
# Verify rule file exists
ls .warp/rules/documentation.md

# Restart Warp to reload rules
# Cmd+Q then reopen

# Try explicit trigger
# Say to agent: "Update the project journal"
```

### Git Hook Not Working

```bash
# Check if hook exists and is executable
ls -l .git/hooks/pre-commit

# If not executable:
chmod +x .git/hooks/pre-commit

# Test the hook
.git/hooks/pre-commit
```

### Journal Not Updating

```bash
# Check if journal exists
ls docs/PROJECT_JOURNAL.md

# Check file permissions
chmod 644 docs/PROJECT_JOURNAL.md

# Try manual workflow
warp workflow run update_journal
```

---

## Quick Reference

### Commands

```bash
# Check workflow status
warp workflow run update_journal

# List all workflows
warp workflow list

# View rule
cat .warp/rules/documentation.md

# View prompt
cat .warp/prompts/update_journal.md

# Test git hook
.git/hooks/pre-commit
```

### Trigger Phrases

**Explicit (immediate execution):**
- "Update the project journal"
- "Document today's work"
- "Add this session to the journal"

**Implicit (asks first):**
- "Thanks", "Thank you", "Goodbye"
- "That's all", "Done", "Finished"
- "See you", "Talk to you later"

---

## Next Steps

You're all set! The system is now running.

**What happens next:**
1. You work naturally on your project
2. Say "Thanks" when done
3. Agent updates documentation automatically
4. Git hook ensures you never forget
5. Complete project history builds over time

**Advanced:**
- Deploy to multiple projects (repeat Step 2)
- Customize templates for your workflow
- Contribute improvements back to the repo
- Share your success story

---

## Need Help?

- 📚 [Full Documentation](../templates/README_TEMPLATE_DEPLOYMENT.md)
- 💬 [GitHub Discussions](https://github.com/yourusername/warp-documentation-automation/discussions)
- 🐛 [Report Issues](https://github.com/yourusername/warp-documentation-automation/issues)
- 📖 [Examples](EXAMPLES.md)

---

**Congratulations! You're now documenting automatically with 99% automation!** 🎉

Go build something awesome, and never lose context again! 🚀

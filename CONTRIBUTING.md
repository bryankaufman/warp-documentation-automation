# Contributing to Warp Documentation Automation

First off, thank you for considering contributing! 🎉

This project thrives on community contributions. Whether you're fixing a bug, adding a feature, improving documentation, or sharing your experience, we appreciate your help.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Pull Request Process](#pull-request-process)
- [Style Guidelines](#style-guidelines)
- [Community](#community)

---

## Code of Conduct

### Our Pledge

We pledge to make participation in this project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

**Examples of behavior that contributes to a positive environment:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards others

**Examples of unacceptable behavior:**
- Trolling, insulting/derogatory comments, personal attacks
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

### Enforcement

Project maintainers will remove, edit, or reject comments, commits, code, issues, and other contributions that do not align with this Code of Conduct.

---

## How Can I Contribute?

### 🐛 Reporting Bugs

Before submitting a bug report:
1. **Check existing issues** - Someone might have already reported it
2. **Use the bug report template** - Helps us understand the problem

What to include:
- Clear, descriptive title
- Steps to reproduce
- Expected vs. actual behavior
- Your environment (OS, Warp version, etc.)
- Screenshots if applicable

[Submit a bug report →](https://github.com/yourusername/warp-documentation-automation/issues/new?template=bug_report.md)

### ✨ Suggesting Features

We love new ideas! Before suggesting:
1. **Check existing feature requests**
2. **Use the feature request template**

What to include:
- Clear description of the problem you're solving
- Your proposed solution
- Any alternatives you've considered
- Examples of how it would work

[Submit a feature request →](https://github.com/yourusername/warp-documentation-automation/issues/new?template=feature_request.md)

### 📝 Improving Documentation

Documentation improvements are always welcome:
- Fix typos or unclear wording
- Add examples
- Improve installation instructions
- Write tutorials
- Translate to other languages

### 🎨 Contributing Example Projects

Share your project using these templates:
1. Create example in `examples/your-project-name/`
2. Include `.warp/` directory with deployed templates
3. Add `docs/PROJECT_JOURNAL.md` showing real usage
4. Include a `README.md` explaining your project
5. Submit a PR

### 💻 Contributing Code

We welcome:
- Bug fixes
- New features
- Performance improvements
- Test coverage improvements
- Refactoring

---

## Development Setup

### Prerequisites

- Warp Terminal installed
- Git
- Basic familiarity with Markdown
- (Optional) shellcheck for validating bash scripts

### Fork and Clone

```bash
# Fork the repo on GitHub, then:
git clone https://github.com/YOUR_USERNAME/warp-documentation-automation.git
cd warp-documentation-automation

# Add upstream remote
git remote add upstream https://github.com/yourusername/warp-documentation-automation.git
```

### Testing Your Changes

```bash
# Test templates locally
mkdir -p ~/.warp/templates-dev
cp templates/* ~/.warp/templates-dev/

# Deploy to a test project
cd /path/to/test/project
mkdir -p .warp/{rules,prompts,workflows}
cp ~/.warp/templates-dev/* .warp/

# Test the system
warp workflow run update_journal
```

### Validation

Before submitting:

```bash
# Check markdown syntax
markdownlint **/*.md

# Validate bash scripts
shellcheck templates/git-pre-commit-hook.sh

# Test git hook
cd /path/to/test/project
.git/hooks/pre-commit
```

---

## Pull Request Process

### 1. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

Branch naming:
- `feature/` - New features
- `fix/` - Bug fixes
- `docs/` - Documentation changes
- `refactor/` - Code refactoring
- `test/` - Test improvements

### 2. Make Your Changes

- Keep changes focused (one feature/fix per PR)
- Write clear, descriptive commit messages
- Test your changes thoroughly
- Update documentation if needed

### 3. Commit Your Changes

```bash
git add .
git commit -m "Brief description of changes

Detailed explanation if needed.

Fixes #issue_number"
```

Commit message guidelines:
- Use present tense ("Add feature" not "Added feature")
- Use imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit first line to 72 characters
- Reference issues and PRs

### 4. Push and Create PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub with:
- Clear title describing the change
- Description of what changed and why
- Link to related issues
- Screenshots/GIFs if applicable
- Test results

### 5. Code Review

- Be responsive to feedback
- Make requested changes
- Keep discussions focused and respectful
- Mark conversations as resolved when addressed

### 6. Merge

Once approved:
- Squash commits if needed
- Ensure CI passes
- Maintainer will merge

---

## Style Guidelines

### Markdown

- Use ATX-style headers (`#` not `===`)
- One blank line between sections
- Code blocks should specify language
- Use relative links for internal docs
- Keep lines under 120 characters when possible

Example:
```markdown
## Section Title

Description here.

### Subsection

```bash
# Code example
command here
\```
```

### Bash Scripts

- Use `#!/bin/bash` shebang
- Set `-e` flag for error handling
- Comment complex logic
- Use meaningful variable names
- Quote variables: `"$VAR"` not `$VAR`

Example:
```bash
#!/bin/bash
set -e

# Description of what script does
VARIABLE_NAME="value"

if [ "$CONDITION" ]; then
  echo "Result"
fi
```

### Template Files

- Keep Section 6 as `[TEMPLATE]` placeholders
- Maintain consistent structure across versions
- Document any breaking changes
- Update version numbers appropriately

---

## Project Structure

```
warp-documentation-automation/
├── README.md                 # Main landing page
├── LICENSE                   # MIT License
├── CONTRIBUTING.md          # This file
├── templates/               # Core templates
│   ├── universal_project_rule.md
│   ├── universal_project_prompt.md
│   ├── universal_project_workflow.yaml
│   ├── git-pre-commit-hook.sh
│   ├── README_TEMPLATE_DEPLOYMENT.md
│   └── CHANGELOG_v2.0.md
├── docs/                    # Documentation
│   ├── QUICKSTART.md
│   ├── EXAMPLES.md
│   └── TROUBLESHOOTING.md
├── examples/                # Example projects
│   ├── python-fastapi/
│   ├── typescript-react/
│   └── go-microservice/
└── .github/                 # GitHub config
    └── ISSUE_TEMPLATE/
        ├── bug_report.md
        └── feature_request.md
```

---

## Community

### Communication Channels

- 💬 **GitHub Discussions** - Questions, ideas, showcase
- 🐛 **GitHub Issues** - Bugs and feature requests
- 🐦 **Twitter** - [@WarpDev](https://twitter.com/warpdotdev) for announcements

### Recognition

Contributors are recognized in:
- README acknowledgments section
- Release notes
- Project contributors page

### Getting Help

Stuck? Need clarification?
- Check existing documentation
- Search closed issues/PRs
- Ask in Discussions
- Tag maintainers in your issue/PR

---

## Release Process

(For maintainers)

1. Update version in templates
2. Update CHANGELOG
3. Create release tag
4. Publish release notes
5. Announce on social media

---

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

## Questions?

Feel free to ask in [GitHub Discussions](https://github.com/yourusername/warp-documentation-automation/discussions) or open an issue.

Thank you for contributing! 🙌

---

**Happy contributing!** 🚀

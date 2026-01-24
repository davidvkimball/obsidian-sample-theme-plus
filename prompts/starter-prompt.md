### Obsidian Theme Starter Prompt

**Objective**: Build a production-ready Obsidian theme using the [Obsidian Sample Theme Plus](https://github.com/davidvkimball/obsidian-sample-theme-plus) template.

## Phase 1: Environment Initialization
Before any coding, establish the development environment:
1.  **Dependency Check**: Ensure `obsidian-dev-skills` is installed as a `devDependency`.
2.  **Skill Seeding**: Run `pnpm obsidian-dev-skills` to ensure `.agent/skills` and `AGENTS.md` are initialized and synchronized.
3.  **Reference Symlinking**: Run `scripts\setup-ref-links.bat` (Windows) or `scripts/setup-ref-links.sh` (POSIX) to link core Obsidian repositories (specifically `obsidian-sample-theme` and `obsidian-developer-docs`).

## Phase 2: Knowledge Loading
Explicitly read the following skills to understand project standards:
- `obsidian-theme-dev`: For CSS/SCSS patterns, Obsidian variable usage, and selector conventions.
- `obsidian-ops`: For Git safety rules, build workflows, and versioning.
- `obsidian-ref`: For UX guidelines, design standards, and manifest rules.
- `project`: For current theme architecture and repo-specific conventions.

## Phase 3: Project Specification
- **Name**: [My Theme]
- **ID**: [my-theme]
- **Description**: [Detailed description of the theme's aesthetic and goals.]
- **Author**: [Name]
- **Author URL**: [URL]
- **Funding**: [URL]

## Phase 4: Project Instructions
- [Describe your primary aesthetic goals, specific selectors to override, and functional requirements here.]

## Phase 5: Project Continuity
Before modifying code, update `.agent/skills/project/SKILL.md`:
- **Discovery Mandate**: If `.agent/skills/project/SKILL.md` is currently a template or lacks detail, your first task is to audit the codebase and document the core architecture, key files, and unique conventions before proceeding with implementation.
- Summarize the current design philosophy and theme state.
- Document any unique CSS architecture (like modular SCSS, specific variable overrides).
- Note any compatibility requirements (like Style Settings plugin integration).

## Theme Development Guidelines
- **Obsidian Variables**: Always prioritize built-in variables (like `--text-normal`, `--nav-item-weight`) over hardcoded values.
- **Style Settings**: If implementing user-configurable options, ensure `manifest.json` or `Style Settings` logic is documented in the project skill.
- **Mobile First**: Design for responsiveness; verify all layout changes for mobile and tablet breakpoints.
- **Linting**: Use `npm run lint` (Stylelint) frequently. 

## Critical Constraints
- **GIT SAFETY**: Do not perform any `git` operations (commit/push) without explicit approval.
- **VERIFICATION**: Always verify CSS selector accuracy and check both Light/Dark mode compatibility before finalizing.

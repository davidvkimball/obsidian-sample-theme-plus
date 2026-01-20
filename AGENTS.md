# AGENTS

This project uses the OpenSkills system for AI agent guidance.

<skills_system priority="1">

## Available Skills

<!-- SKILLS_TABLE_START -->
<usage>
When performing tasks, check if any of the available skills below can help you. Skills provide specialized capabilities and domain knowledge.

How to use skills:
- Invoke: Bash("npx openskills read <skill-name>")
- The skill content will load with detailed instructions and reference links.
- Each skill invocation is stateless.
</usage>

<available_skills>

<skill>
<name>project</name>
<description>Project-specific architecture, maintenance tasks, and unique conventions for this repository. Load when performing project-wide maintenance or working with the core architecture.</description>
<location>project</location>
</skill>

<skill>
<name>obsidian-dev</name>
<description>CSS/SCSS development patterns, styling conventions, and theme-specific coding rules. Load when working with theme.css, SCSS variables, or CSS selectors.</description>
<location>project</location>
</skill>

<skill>
<name>obsidian-ops</name>
<description>Operations, syncing, versioning, and release management. Load when running linting, syncing references, bumping versions, or preparing for release. Includes the "never auto-git" policy.</description>
<location>project</location>
</skill>

<skill>
<name>obsidian-ref</name>
<description>Technical references, manifest rules, CSS variables, and theme guidelines. Load when checking Obsidian CSS variables, manifest requirements, or theme standards.</description>
<location>project</location>
</skill>

</available_skills>
<!-- SKILLS_TABLE_END -->

</skills_system>

## Project Metadata
- **Project**: Obsidian Theme
- **Package Manager**: pnpm
- **Primary Commands**: `pnpm lint`, `pnpm upgrade`

## Core Policies
- **CRITICAL**: Never perform automatic git operations. AI agents must not execute `git commit`, `git push`, or any command that automatically stages or commits changes without explicit user approval for each step.

## Terminology
- Use **"properties"** (never "frontmatter" or "front-matter") when referring to YAML metadata at the top of Markdown files.
- **"Markdown"** is a proper noun and must always be capitalized.

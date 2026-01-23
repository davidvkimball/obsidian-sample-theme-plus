# Obsidian Sample Theme Plus

This is a sample theme for [Obsidian](https://obsidian.md) with AI-assisted development tools and best practices.

## What Makes This Plus Version Different?

This template includes additional tools and documentation to improve your development experience:

### AI-Assisted Development System

This template uses the OpenSkills system with centralized skills from the [obsidian-dev-skills](https://github.com/davidvkimball/obsidian-dev-skills) repository.

**Setup:**
```bash
# 1. Install dependencies (includes obsidian-dev-skills)
pnpm install

# 2. Initialize localized skill set (.agent/skills/)
pnpm obsidian-dev-skills

# 3. Align AGENTS.md with available skills
npx openskills sync

# 4. Set up reference materials (symlinks to core Obsidian repos)
.\scripts\setup-ref-links.bat  # Windows
# or
bash scripts/setup-ref-links.sh  # macOS/Linux
```

**What's included:**
- **`AGENTS.md`** - OpenSkills entry point for AI agent guidance
- **`.agent/skills/` folder** - Symlinks to centralized skills repository
- **Theme development skills** - CSS/SCSS patterns, Obsidian variables, responsive design
- **Operations skills** - Build, release, and maintenance workflows
- **Technical references** - API docs, manifest rules, file formats
- **Project-specific skills** - Your custom patterns and conventions

**Benefits:**
- Single source of truth for development knowledge
- Automatic updates when skills are improved
- Consistent guidance across all your projects
- Specialized knowledge for plugin vs theme development

### Reference Materials System (`.ref` folder)

- **Symlinks to Obsidian repositories** - Easy access to API docs, sample code, and examples
- **Centralized storage** - All projects share the same reference repos (no duplication)
- **6 core Obsidian projects** - API definitions, documentation, sample plugins, sample themes
- **Project-specific references** - Add your own plugin/theme references as needed

### Stylelint CSS Linting

- **Pre-configured by default** - Stylelint is set up and ready to use (requires `npm install`)
- **Browser compatibility checking** - Validates CSS against Obsidian's browser targets (Chrome and iOS)
- **Automatic migration** - Setup script available for adding Stylelint to existing themes
- **Catches common issues** - Invalid CSS properties, unsupported features, and more

**See also:** [obsidian-sample-plugin-plus](https://github.com/davidvkimball/obsidian-sample-plugin-plus) - The companion plugin template with similar enhancements.

## Recommended Tools and Plugins for Theme Development

These tools and plugins can significantly improve your theme development workflow:

### Theme Design Utilities

**[Theme Design Utilities](https://github.com/chrisgrieser/obsidian-theme-design-utilities)** - A comprehensive collection of utilities for Obsidian theme designers:
- Mobile emulation mode for testing mobile layouts
- Cycle between Source Mode, Live Preview, and Reading Mode
- Cycle through installed themes for quick comparison
- Light/dark mode toggle
- Red outlines for debugging CSS layout issues
- CSS feature compatibility checker

### MySnippets Plugin

**[MySnippets](https://github.com/chetachiezikeuzor/MySnippets-Plugin)** - Manage CSS snippets directly within Obsidian. Perfect for testing theme changes without leaving your editor.

### Theme Picker Plugin

**[Theme Picker](https://github.com/trey-sedate/obsidian-theme-picker)** - Quickly switch between installed themes without opening settings. Great for comparing your theme with others during development.

### Theme Hot Reload Plugin

**[Theme Hot Reload](https://github.com/mProjectsCode/obsidian-theme-hot-reload-plugin)** - Automatically reload your theme when CSS files change. Dramatically speeds up development by eliminating manual reloads.

## Quick Start

### For New Themes (Using This as a Template)

1. **Use this template** - Click "Use this template" on GitHub or clone this repo
2. **Install dependencies**: `pnpm install` (includes Stylelint and development skills)
3. **Initialize skills**: 
   - Run `pnpm obsidian-dev-skills` to seed the `.agent/skills/` folder.
   - Run `npx openskills sync` to update `AGENTS.md`.
4. **Optional: Setup reference materials** (recommended):
   - **Windows**: `scripts\setup-ref-links.bat`
   - **macOS/Linux**: `./scripts/setup-ref-links.sh`
4. **Start developing**: Edit `theme.css` to customize your theme
5. **Optional: Check CSS quality**: Run `npm run lint` to validate your CSS

### For Existing Themes (Upgrading to This System)

1. **Copy these folders/files to your theme**:
   - `AGENTS.md` → Your theme root
  - `.agent/` folder → Your theme root
   - `scripts/` folder → Your theme root

2. **Initialize skills**: 
   - Run `pnpm obsidian-dev-skills` to seed the `.agent/skills/` folder.
   - Run `npx openskills sync` to update `AGENTS.md`.

3. **Setup reference materials**:
   - **Windows**: `scripts\setup-ref-links.bat`
   - **macOS/Linux**: `./scripts/setup-ref-links.sh`
   - This creates symlinks to Obsidian reference repos in `.ref/` folder

3. **Setup Stylelint** (recommended):
   ```bash
   node scripts/setup-stylelint.mjs
   npm install
   npm run lint
   ```
   
   **What the setup script does automatically:**
   - Updates `package.json` with Stylelint dependencies and lint scripts (if package.json exists)
   - Creates/updates `.stylelintrc.json` (Stylelint configuration)
   - Creates `.stylelintignore` (files to exclude from linting)
   - Creates `scripts/lint-wrapper.mjs` (adds helpful success messages)
   
   **Note:** Themes don't require `package.json` - you can edit `theme.css` directly. The setup script will create `package.json` if it doesn't exist, but it's only needed for linting.

## First Time Publishing a Theme?

1. Choose **Use this template** to create a copy of this repository
2. Clone your new repository to your computer
3. Inside `manifest.json`, change the "name" field to your theme name
4. Add your name to the "author" field in `manifest.json`
5. Edit `theme.css` to add your styles

## How to Use

### Basic Development

- Clone this repo
- Edit `theme.css` to customize your theme's appearance
- Test your theme by copying `theme.css` and `manifest.json` to your vault's `.obsidian/themes/your-theme-name/` folder
- Reload Obsidian to see your changes

### Using the AI System

- **Bootstrapping with AI**: Before providing instructions to your AI agent, visit the `prompts/` folder. Copy the `starter-prompt.md`, fill in your project details, and provide it to your agent to perfectly initialize the development environment.
- **Initialize Skills**: Run `pnpm obsidian-dev-skills` to populate or update the `.agent/skills/` folder with the latest localized knowledge.
- **Sync Agents**: Run `npx openskills sync` to reflect any skill changes in `AGENTS.md`.
- Read `AGENTS.md` for project-specific instructions
- Use `npx openskills read <skill-name>` to load specialized knowledge
- Check `.agent/skills/*/references/` for deep technical guides

### Using Reference Materials

- Access Obsidian API: `.ref/obsidian-api/obsidian.d.ts`
- View sample theme code: `.ref/obsidian-sample-theme/`
- View sample plugin code: `.ref/obsidian-sample-plugin/`

## Adding your theme to the Theme Gallery

1. Include a screenshot thumbnail (16:9 aspect ratio, recommended size 512x288)
2. Submit a Pull Request to [`obsidianmd/obsidian-releases`](https://github.com/obsidianmd/obsidian-releases#community-theme)

## Releasing Versions

1. From your theme's repository, click on "Releases"
2. Click **Draft a new Release**
3. Fill out the Release information:
   - **Choose a Tag**: Create a new tag with your version number
   - **Release Title**: The version number
   - **Description**: What changed (optional)
   - **Files**: Upload `manifest.json` and `theme.css`
4. Click "Publish Release"
5. Update `versions.json` if needed (maps theme version → minimum Obsidian version)

> **Tip:** You can simplify the version bump process by running `npm version patch`, `npm version minor` or `npm version major` after updating `minAppVersion` manually in `manifest.json`.

## Troubleshooting

### Upgrade Issues

If you're upgrading an existing theme and encounter issues:

1. **Stylelint errors after setup**: Run `npm install` to ensure all dependencies are installed (if using package.json)
2. **Package.json conflicts**: Don't copy `package.json` from the template - the setup script will create/update it with only the necessary additions

### Reference folder not working

If `.ref` folder is empty or symlinks are broken:
1. Re-run the appropriate setup script (`.bat` for Windows, `.sh` for macOS/Linux)
2. Check that the central location exists: `../.ref/obsidian-dev/`

**Windows symlink issues:**
- Run PowerShell/CMD as Administrator, or
- Enable Developer Mode: Settings → Privacy & Security → For developers → Developer Mode

### Theme not appearing in Obsidian

1. Make sure `manifest.json` and `theme.css` are in `.obsidian/themes/your-theme-name/`
2. Verify `manifest.json` has the correct `name` field
3. Reload Obsidian (Settings → Appearance → Themes)
4. Check that `theme.css` contains valid CSS

## Manually Installing the Theme

- Copy over `theme.css` and `manifest.json` to your vault `VaultFolder/.obsidian/themes/your-theme-name/`
- Reload Obsidian and enable the theme in Settings → Appearance → Themes

## Funding URL

You can include funding URLs in your `manifest.json` file:

```json
{
    "fundingUrl": "https://buymeacoffee.com"
}
```

Or for multiple URLs:

```json
{
    "fundingUrl": {
        "Buy Me a Coffee": "https://buymeacoffee.com",
        "GitHub Sponsor": "https://github.com/sponsors"
    }
}
```

## API Documentation

See https://github.com/obsidianmd/obsidian-api

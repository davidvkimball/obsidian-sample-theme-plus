#!/bin/bash

# Setup skills symlinks for Obsidian Theme Project
# This script creates symlinks to the obsidian-dev-skills repository

set -e

SKILLS_REPO_PATH="${1:-"../.ref/obsidian-dev-skills"}"

echo "Setting up skills symlinks for theme project..."

# Check if skills repo exists
if [ ! -d "$SKILLS_REPO_PATH" ]; then
    echo "Skills repository not found at: $SKILLS_REPO_PATH"
    echo "Please run setup-ref-links script first to set up the .ref folder."
    exit 1
fi

SKILLS_DIR=".agent/skills"

# Create skills directory if it doesn't exist
mkdir -p "$SKILLS_DIR"

# Theme project: map obsidian-dev to obsidian-dev-themes
create_symlink() {
    local target_skill="$1"
    local source_skill="$2"

    target_path="$SKILLS_DIR/$target_skill"
    source_path="$SKILLS_REPO_PATH/$source_skill"

    # Remove existing symlink/directory if it exists
    if [ -L "$target_path" ] || [ -d "$target_path" ]; then
        rm -rf "$target_path"
    fi

    # Create symlink
    echo "Creating symlink: $target_skill -> $source_skill"
    
    # Convert source_path to absolute path for reliability
    if command -v realpath >/dev/null 2>&1; then
        abs_source_path=$(realpath "$source_path")
    else
        # Fallback for environments without realpath
        abs_source_path=$(cd "$(dirname "$source_path")" && pwd)/$(basename "$source_path")
    fi

    ln -s "$abs_source_path" "$target_path"
}

create_symlink "obsidian-dev" "obsidian-dev-themes"
create_symlink "obsidian-ops" "obsidian-ops"
create_symlink "obsidian-ref" "obsidian-ref"

echo "Theme skills setup complete!"
echo "The following skills are now available:"
echo "  - obsidian-dev (theme development)"
echo "  - obsidian-ops (operations & workflows)"
echo "  - obsidian-ref (technical references)"
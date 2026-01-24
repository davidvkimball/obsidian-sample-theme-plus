# Setup skills symlinks for Obsidian Theme Project
# This script creates symlinks to the obsidian-dev-skills repository

param(
    [string]$SkillsRepoPath = "$PSScriptRoot\..\..\.ref\obsidian-dev-skills"
)

$ErrorActionPreference = "Stop"

Write-Host "Setting up skills symlinks for theme project..." -ForegroundColor Cyan

# Check if skills repo exists
if (-not (Test-Path $SkillsRepoPath)) {
    Write-Host "Skills repository not found at: $SkillsRepoPath" -ForegroundColor Red
    Write-Host "Please run setup-ref-links script first to set up the .ref folder." -ForegroundColor Yellow
    exit 1
}

$skillsDir = "$PSScriptRoot\..\.agent\skills"

# Create skills directory if it doesn't exist
if (-not (Test-Path $skillsDir)) {
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

# Theme project: use obsidian-dev-themes
$skillMappings = @{
    "obsidian-dev" = "obsidian-dev-themes"
    "obsidian-ops" = "obsidian-ops"
    "obsidian-ref" = "obsidian-ref"
}

foreach ($targetSkill in $skillMappings.Keys) {
    $sourceSkill = $skillMappings[$targetSkill]
    $targetPath = Join-Path $skillsDir $targetSkill
    $sourcePath = Join-Path $SkillsRepoPath $sourceSkill

    # Remove existing symlink/directory if it exists
    if (Test-Path $targetPath) {
        $item = Get-Item $targetPath
        if ($item.LinkType -eq "Junction" -or $item.LinkType -eq "SymbolicLink") {
            Remove-Item $targetPath -Force
        } else {
            Remove-Item $targetPath -Recurse -Force
        }
    }

    # Create symlink
    if (-not (Test-Path $sourcePath)) {
        Write-Host "Warning: Source skill not found at $sourcePath. Skipping $targetSkill." -ForegroundColor Yellow
        continue
    }

    Write-Host "Creating symlink: $targetSkill -> $sourceSkill" -ForegroundColor Green
    cmd /c mklink /J "$targetPath" "$sourcePath" | Out-Null
    
    if ($LASTEXITCODE -ne 0) {
        Write-Error "Failed to create symlink for $targetSkill. mklink exited with code $LASTEXITCODE."
    }
}

Write-Host "Theme skills setup complete!" -ForegroundColor Cyan
Write-Host "The following skills are now available:" -ForegroundColor Gray
Write-Host "  - obsidian-dev (theme development)" -ForegroundColor Gray
Write-Host "  - obsidian-ops (operations & workflows)" -ForegroundColor Gray
Write-Host "  - obsidian-ref (technical references)" -ForegroundColor Gray
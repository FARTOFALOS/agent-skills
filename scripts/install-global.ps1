$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillSource = Join-Path $repoRoot 'skills\decisions'

if (-not (Test-Path $skillSource)) {
    throw "Skill source not found: $skillSource"
}

$targets = @(
    (Join-Path $HOME '.agents\skills\decisions'),
    (Join-Path $HOME '.claude\skills\decisions')
)

foreach ($target in $targets) {
    $parent = Split-Path -Parent $target
    New-Item -ItemType Directory -Force -Path $parent | Out-Null

    if (Test-Path $target) {
        Write-Host "SKIP: $target already exists. Remove or rename it manually if you want to replace it."
        continue
    }

    if ($IsWindows -or $env:OS -eq 'Windows_NT') {
        New-Item -ItemType Junction -Path $target -Target $skillSource | Out-Null
    }
    else {
        New-Item -ItemType SymbolicLink -Path $target -Target $skillSource | Out-Null
    }

    Write-Host "INSTALLED: $target -> $skillSource"
}

Write-Host 'Done. Restart or reopen Codex / Claude Code if the skill is not immediately discovered.'

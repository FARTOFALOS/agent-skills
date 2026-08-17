$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$skillsRoot = Join-Path $repoRoot 'skills'

if (-not (Test-Path $skillsRoot)) {
    throw "Skills directory not found: $skillsRoot"
}

$skills = Get-ChildItem -Path $skillsRoot -Directory | Where-Object {
    Test-Path (Join-Path $_.FullName 'SKILL.md')
}

if (-not $skills) {
    throw "No installable skills found under: $skillsRoot"
}

$platforms = @(
    @{ Name = 'Codex'; Root = (Join-Path $HOME '.agents\skills') },
    @{ Name = 'Claude Code'; Root = (Join-Path $HOME '.claude\skills') }
)

foreach ($platform in $platforms) {
    New-Item -ItemType Directory -Force -Path $platform.Root | Out-Null

    foreach ($skill in $skills) {
        $source = $skill.FullName
        $target = Join-Path $platform.Root $skill.Name

        if (Test-Path $target) {
            $existing = Get-Item -Force $target
            $targets = @($existing.Target)
            if ($existing.LinkType -in @('Junction', 'SymbolicLink') -and $targets -contains $source) {
                Write-Host "OK: $($platform.Name) / $($skill.Name) already linked -> $source"
            }
            else {
                Write-Host "SKIP: $target already exists and is not the expected link."
            }
            continue
        }

        if ($IsWindows -or $env:OS -eq 'Windows_NT') {
            New-Item -ItemType Junction -Path $target -Target $source | Out-Null
        }
        else {
            New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
        }

        Write-Host "INSTALLED: $($platform.Name) / $($skill.Name) -> $source"
    }
}

Write-Host 'Done. Existing linked skills update through git pull; rerun this installer after adding new skill directories.'

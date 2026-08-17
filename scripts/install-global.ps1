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

$codexRoot = Join-Path $HOME '.agents\skills'
$claudeRoot = Join-Path $HOME '.claude\skills'
New-Item -ItemType Directory -Force -Path $codexRoot | Out-Null
New-Item -ItemType Directory -Force -Path $claudeRoot | Out-Null

function Install-CodexSkill {
    param(
        [Parameter(Mandatory = $true)][System.IO.DirectoryInfo]$Skill
    )

    $source = $Skill.FullName
    $target = Join-Path $codexRoot $Skill.Name

    if (Test-Path $target) {
        $existing = Get-Item -Force $target
        $targets = @($existing.Target)
        if ($existing.LinkType -in @('Junction', 'SymbolicLink') -and $targets -contains $source) {
            Write-Host "OK: Codex / $($Skill.Name) already linked -> $source"
        }
        else {
            Write-Host "SKIP: Codex target already exists and is not the expected managed link: $target"
        }
        return
    }

    if ($IsWindows -or $env:OS -eq 'Windows_NT') {
        New-Item -ItemType Junction -Path $target -Target $source | Out-Null
    }
    else {
        New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
    }

    Write-Host "INSTALLED: Codex / $($Skill.Name) -> $source"
}

function Sync-ClaudeSkill {
    param(
        [Parameter(Mandatory = $true)][System.IO.DirectoryInfo]$Skill
    )

    $source = $Skill.FullName
    $target = Join-Path $claudeRoot $Skill.Name
    $markerName = '.agent-skills-managed'
    $marker = Join-Path $target $markerName

    if (Test-Path $target) {
        $existing = Get-Item -Force $target
        $targets = @($existing.Target)

        # Migrate links created by older versions of this installer to a real
        # directory. Claude documents filesystem skill directories, while
        # external Windows junction discovery is not part of that contract.
        if ($existing.LinkType -in @('Junction', 'SymbolicLink') -and $targets -contains $source) {
            Remove-Item -Force $target
        }
        elseif (Test-Path $marker) {
            $managedSource = (Get-Content -Raw $marker).Trim()
            if ($managedSource -ne $source) {
                Write-Host "SKIP: Claude Code target is managed from a different source: $target"
                return
            }
            Remove-Item -Recurse -Force $target
        }
        else {
            Write-Host "SKIP: Claude Code target already exists and is not managed by agent-skills: $target"
            return
        }
    }

    New-Item -ItemType Directory -Force -Path $target | Out-Null
    Get-ChildItem -Force -Path $source | Copy-Item -Destination $target -Recurse -Force
    Set-Content -Path $marker -Value $source -Encoding UTF8

    Write-Host "SYNCED: Claude Code / $($Skill.Name) -> $target (source: $source)"
}

foreach ($skill in $skills) {
    Install-CodexSkill -Skill $skill
    Sync-ClaudeSkill -Skill $skill
}

Write-Host 'Done. After git pull, rerun this installer to sync Claude Code and add any new skills. Codex links follow the canonical checkout directly.'

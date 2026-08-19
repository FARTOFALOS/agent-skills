$ErrorActionPreference = 'Stop'

$repoRoot = $PSScriptRoot
$skillsRoot = Join-Path $repoRoot 'skills'

if (-not (Test-Path $skillsRoot)) { throw "Skills directory not found: $skillsRoot" }

$skills = Get-ChildItem -Path $skillsRoot -Directory | Where-Object {
    Test-Path (Join-Path $_.FullName 'SKILL.md')
}
if (-not $skills) { throw "No installable skills found under: $skillsRoot" }

$codexRoot = Join-Path $HOME '.agents\skills'
$claudeRoot = Join-Path $HOME '.claude\skills'
New-Item -ItemType Directory -Force -Path $codexRoot | Out-Null
New-Item -ItemType Directory -Force -Path $claudeRoot | Out-Null

$skillsRootFull = [System.IO.Path]::GetFullPath($skillsRoot).TrimEnd('\', '/')

function Test-ManagedSourcePath {
    param([Parameter(Mandatory = $true)][string]$Path)

    try {
        $full = [System.IO.Path]::GetFullPath($Path)
        return $full.StartsWith($skillsRootFull + [System.IO.Path]::DirectorySeparatorChar, [System.StringComparison]::OrdinalIgnoreCase)
    } catch {
        return $false
    }
}

function Remove-StaleManagedSkills {
    # Codex deliveries are links into this checkout. Remove only stale links
    # that point under this repository's skills directory.
    foreach ($item in Get-ChildItem -Force -Path $codexRoot) {
        if ($item.LinkType -notin @('Junction', 'SymbolicLink')) { continue }

        $managedTarget = @($item.Target) | Where-Object {
            $_ -and (Test-ManagedSourcePath -Path ([string]$_))
        } | Select-Object -First 1

        if ($managedTarget -and -not (Test-Path -LiteralPath ([string]$managedTarget))) {
            Remove-Item -Force -LiteralPath $item.FullName
            Write-Host "REMOVED: stale Codex skill / $($item.Name)"
        }
    }

    # Claude deliveries are real copied directories marked with their canonical
    # source path. Remove only our managed copies whose canonical source vanished.
    foreach ($item in Get-ChildItem -Force -Path $claudeRoot -Directory) {
        $marker = Join-Path $item.FullName '.agent-skills-managed'
        if (-not (Test-Path -LiteralPath $marker)) { continue }

        $managedSource = (Get-Content -Raw -LiteralPath $marker).Trim()
        if ((Test-ManagedSourcePath -Path $managedSource) -and -not (Test-Path -LiteralPath $managedSource)) {
            Remove-Item -Recurse -Force -LiteralPath $item.FullName
            Write-Host "REMOVED: stale Claude Code skill / $($item.Name)"
        }
    }
}

function Install-CodexSkill {
    param([Parameter(Mandatory = $true)][System.IO.DirectoryInfo]$Skill)
    $source = $Skill.FullName
    $target = Join-Path $codexRoot $Skill.Name

    if (Test-Path $target) {
        $existing = Get-Item -Force $target
        $targets = @($existing.Target)
        if ($existing.LinkType -in @('Junction', 'SymbolicLink') -and $targets -contains $source) {
            Write-Host "OK: Codex / $($Skill.Name) already linked -> $source"
        } else {
            Write-Host "SKIP: Codex target already exists and is not the expected managed link: $target"
        }
        return
    }

    if ($IsWindows -or $env:OS -eq 'Windows_NT') {
        New-Item -ItemType Junction -Path $target -Target $source | Out-Null
    } else {
        New-Item -ItemType SymbolicLink -Path $target -Target $source | Out-Null
    }
    Write-Host "INSTALLED: Codex / $($Skill.Name) -> $source"
}

function Sync-ClaudeSkill {
    param([Parameter(Mandatory = $true)][System.IO.DirectoryInfo]$Skill)
    $source = $Skill.FullName
    $target = Join-Path $claudeRoot $Skill.Name
    $marker = Join-Path $target '.agent-skills-managed'

    if (Test-Path $target) {
        $existing = Get-Item -Force $target
        $targets = @($existing.Target)
        if ($existing.LinkType -in @('Junction', 'SymbolicLink') -and $targets -contains $source) {
            Remove-Item -Force $target
        } elseif (Test-Path $marker) {
            $managedSource = (Get-Content -Raw $marker).Trim()
            if ($managedSource -ne $source) {
                Write-Host "SKIP: Claude Code target is managed from a different source: $target"
                return
            }
            Remove-Item -Recurse -Force $target
        } else {
            Write-Host "SKIP: Claude Code target already exists and is not managed by agent-skills: $target"
            return
        }
    }

    New-Item -ItemType Directory -Force -Path $target | Out-Null
    Get-ChildItem -Force -Path $source | Copy-Item -Destination $target -Recurse -Force
    Set-Content -Path $marker -Value $source -Encoding UTF8
    Write-Host "SYNCED: Claude Code / $($Skill.Name) -> $target (source: $source)"
}

Remove-StaleManagedSkills

foreach ($skill in $skills) {
    Install-CodexSkill -Skill $skill
    Sync-ClaudeSkill -Skill $skill
}

Write-Host 'Done. After git pull, rerun .\install.ps1 to sync Claude Code, add new skills, and remove stale managed deliveries. Codex links follow the canonical checkout directly.'

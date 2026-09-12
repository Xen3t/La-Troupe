# Cohérence de La Troupe : adaptateurs Claude/Codex, signatures, isolation projet.
#
# Ce fichier doit rester encodé en UTF-8 AVEC BOM : sans lui, Windows PowerShell 5.1
# lit les accents en ANSI et rend les messages d'erreur illisibles.

$ErrorActionPreference = 'Stop'

$workspace = (Resolve-Path (Join-Path $PSScriptRoot '../..')).Path
$errors = [System.Collections.Generic.List[string]]::new()

$env:PYTHONUTF8 = '1'
$python = if (Get-Command py -ErrorAction SilentlyContinue) { 'py' } else { 'python' }
& $python (Join-Path $PSScriptRoot 'validate_skills.py')
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
& $python (Join-Path $PSScriptRoot 'sync_claude_skills.py') --check
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

function Resolve-WorkspaceTarget([string] $target) {
    return Join-Path $workspace ($target.Replace('/', [IO.Path]::DirectorySeparatorChar))
}

function Get-AdapterTarget([string] $content) {
    return [regex]::Match($content, 'la-troupe/[A-Za-z0-9_./-]+/SKILL\.md').Value
}

# Index de référence : tout SKILL.md du framework doit être atteignable.
$frameworkSkills = @(
    Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/core') -Recurse -File -Filter 'SKILL.md'
    Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/modules') -Recurse -File -Filter 'SKILL.md'
    Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/workflows') -Recurse -File -Filter 'SKILL.md'
)
$frameworkTargets = [System.Collections.Generic.HashSet[string]]::new()
foreach ($file in $frameworkSkills) {
    $relative = $file.FullName.Substring($workspace.Length + 1).Replace([IO.Path]::DirectorySeparatorChar, '/')
    [void]$frameworkTargets.Add($relative)
}

# --- 1. Toute cible citée par un adaptateur ou une commande doit exister ---
$adapterFiles = @(
    Get-ChildItem -LiteralPath (Join-Path $workspace '.agents/skills') -Recurse -File -Filter 'SKILL.md'
    Get-ChildItem -LiteralPath (Join-Path $workspace '.claude/skills') -Recurse -File -Filter 'SKILL.md'
    Get-ChildItem -LiteralPath (Join-Path $workspace '.claude/commands') -File -Filter '*.md'
)

foreach ($file in $adapterFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    foreach ($match in [regex]::Matches($content, 'la-troupe/[A-Za-z0-9_./-]+/SKILL\.md')) {
        if (-not (Test-Path -LiteralPath (Resolve-WorkspaceTarget $match.Value) -PathType Leaf)) {
            $errors.Add("Cible absente dans $($file.FullName): $($match.Value)")
        }
    }
}

# --- 2. Chaque rôle du framework doit avoir sa signature complète ---
$roleSkills = @(
    Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/core') -Recurse -File -Filter 'SKILL.md'
    Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/modules') -Recurse -File -Filter 'SKILL.md'
)
foreach ($file in $roleSkills) {
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch 'Commence toujours.+\([^)]+\) :') {
        $errors.Add("Signature complète absente: $($file.FullName)")
    }
}

# --- 3. Chaque SKILL.md du framework doit avoir exactement un adaptateur Codex ---
# Dérivé du disque : un rôle ajouté sans adaptateur échoue, sans table à tenir à jour.
$codexAdapters = Get-ChildItem -LiteralPath (Join-Path $workspace '.agents/skills') -Recurse -File -Filter 'SKILL.md'
$covered = @{}
foreach ($file in $codexAdapters) {
    $target = Get-AdapterTarget (Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8)
    if (-not $target) {
        $errors.Add("Adaptateur sans cible La Troupe: $($file.FullName)")
        continue
    }
    if ($covered.ContainsKey($target)) {
        $errors.Add("Deux adaptateurs Codex visent $target : $($covered[$target]) et $($file.Directory.Name)")
        continue
    }
    $covered[$target] = $file.Directory.Name
}
foreach ($target in $frameworkTargets) {
    if (-not $covered.ContainsKey($target)) {
        $errors.Add("Aucun adaptateur de skill ne vise $target (rôle inatteignable par routage automatique)")
    }
}

# --- 4. Les commandes restent des forçages manuels, et ne doublonnent aucun skill ---
$skillNames = [System.Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
foreach ($dir in Get-ChildItem -LiteralPath (Join-Path $workspace '.claude/skills') -Directory) {
    [void]$skillNames.Add($dir.Name)
}
$indexCommands = @('aide', 'roles')
foreach ($file in Get-ChildItem -LiteralPath (Join-Path $workspace '.claude/commands') -File -Filter '*.md') {
    $name = [IO.Path]::GetFileNameWithoutExtension($file.Name)
    $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    if ($content -notmatch 'disable-model-invocation: true') {
        $errors.Add("Commande auto-invocable (frontmatter manquant): $($file.Name)")
    }
    if ($skillNames.Contains($name)) {
        $errors.Add("La commande $($file.Name) doublonne le skill du même nom: le routage devient ambigu.")
    }
    if ($indexCommands -notcontains $name -and -not (Get-AdapterTarget $content)) {
        $errors.Add("Commande sans cible La Troupe: $($file.Name)")
    }
}

# --- 5. Le framework reste générique : aucune référence à un projet du workspace ---
# Un projet se déclare par un manifeste `.troupe.yml` à la racine de son dossier
# (voir workflows/nouveau-projet) : ni le nom du dossier ni `project.name` ne doivent
# apparaître dans le framework.
$projectTerms = [System.Collections.Generic.HashSet[string]]::new()
foreach ($dir in Get-ChildItem -LiteralPath $workspace -Directory) {
    $manifest = Join-Path $dir.FullName '.troupe.yml'
    if (-not (Test-Path -LiteralPath $manifest -PathType Leaf)) {
        continue
    }
    [void]$projectTerms.Add($dir.Name)
    $name = [regex]::Match((Get-Content -LiteralPath $manifest -Raw -Encoding UTF8), '(?m)^[ \t]+name:[ \t]*["'']?([^"''#\r\n]+?)["'']?[ \t]*$')
    if ($name.Success) {
        [void]$projectTerms.Add($name.Groups[1].Value)
    }
}
if ($projectTerms.Count -gt 0) {
    $projectPattern = '\b(' + (($projectTerms | ForEach-Object { [regex]::Escape($_) }) -join '|') + ')\b'
    $genericFiles = @(
        Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/core') -Recurse -File
        Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/modules') -Recurse -File
        Get-ChildItem -LiteralPath (Join-Path $workspace 'la-troupe/workflows') -Recurse -File
    )
    foreach ($file in $genericFiles) {
        $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
        $match = [regex]::Match($content, $projectPattern)
        if ($match.Success) {
            $errors.Add("Référence au projet « $($match.Value) » dans le framework générique: $($file.FullName)")
        }
    }
}

if ($errors.Count -gt 0) {
    # Écrire sur stderr plutôt qu'avec Write-Error : sous $ErrorActionPreference = 'Stop',
    # le premier Write-Error serait terminant et masquerait tous les problèmes suivants.
    [Console]::Error.WriteLine("La Troupe : $($errors.Count) probleme(s) de coherence.")
    foreach ($message in $errors) {
        [Console]::Error.WriteLine("  - $message")
    }
    exit 1
}

Write-Host "La Troupe : $($frameworkTargets.Count) rôles couverts, commandes manuelles, isolation projet valide."

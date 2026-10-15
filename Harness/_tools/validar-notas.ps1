param(
    [string]$NotesDirectory = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$NotesDirectory = (Resolve-Path -LiteralPath $NotesDirectory).Path
$Problems = [System.Collections.Generic.List[string]]::new()
$MaxWords = 1200

# All note material must be Markdown. Executable maintenance tools are
# intentionally isolated under _tools/.
$ToolDirectory = Join-Path $NotesDirectory '_tools'
$AllContentFiles = Get-ChildItem -LiteralPath $NotesDirectory -Recurse -File -Force |
    Where-Object { -not $_.FullName.StartsWith("$ToolDirectory\", [System.StringComparison]::OrdinalIgnoreCase) }
$UnexpectedFiles = $AllContentFiles | Where-Object { $_.Extension -ne '.md' }
foreach ($file in $UnexpectedFiles) {
    $Problems.Add("Arquivo fora de .md na raiz das notas: $($file.FullName)")
}

$MarkdownFiles = $AllContentFiles | Where-Object { $_.Extension -eq '.md' }
$TopicNotes = $MarkdownFiles | Where-Object { $_.Name -match '^\d{2}-.+\.md$' }
$ReadmePath = Join-Path $NotesDirectory 'README.md'
$Readme = if (Test-Path -LiteralPath $ReadmePath) { Get-Content -Raw -LiteralPath $ReadmePath } else { '' }

if (-not $TopicNotes) {
    $Problems.Add('Nenhuma nota temática no padrão NN-nome.md foi encontrada.')
}
if (-not (Test-Path -LiteralPath $ReadmePath)) {
    $Problems.Add('README.md não encontrado.')
}
$duplicateNumbers = $TopicNotes | Group-Object { $_.Name.Substring(0, 2) } | Where-Object { $_.Count -gt 1 }
foreach ($group in $duplicateNumbers) {
    $Problems.Add("Número de nota duplicado: $($group.Name)")
}

foreach ($file in $MarkdownFiles) {
    $content = Get-Content -Raw -LiteralPath $file.FullName
    if ($content -notmatch '^#\s+\S') {
        $Problems.Add("O arquivo deve começar com seu título H1: $($file.Name)")
    }
    $withoutCode = [regex]::Replace($content, '(?ms)^```.*?^```[ \t]*\r?\n?', '')
    if ([regex]::Matches($withoutCode, '(?m)^#\s+\S').Count -ne 1) {
        $Problems.Add("O arquivo deve ter exatamente um título H1 fora de blocos de código: $($file.Name)")
    }

    $linkPattern = '!?\[[^\]]*\]\(([^)]+)\)'
    foreach ($match in [regex]::Matches($content, $linkPattern)) {
        $target = $match.Groups[1].Value.Trim()
        if ($target -match '^(https?://|mailto:|#)') { continue }
        $target = ($target -split '#', 2)[0].Trim('<', '>')
        if (-not $target) { continue }
        $target = [uri]::UnescapeDataString($target)
        $resolved = Join-Path (Split-Path -Parent $file.FullName) $target
        if (-not (Test-Path -LiteralPath $resolved)) {
            $Problems.Add("Link local quebrado em $($file.Name): $target")
        }
        elseif ([IO.Path]::GetExtension($resolved) -and [IO.Path]::GetExtension($resolved) -ne '.md') {
            $Problems.Add("Link local aponta para arquivo que não é .md em $($file.Name): $target")
        }
    }
}

foreach ($file in $TopicNotes) {
    $content = Get-Content -Raw -LiteralPath $file.FullName
    $wordCount = [regex]::Matches($content, '\S+').Count
    if ($wordCount -gt $MaxWords) {
        $Problems.Add("$($file.Name) tem $wordCount palavras; o máximo é $MaxWords.")
    }
    if ($content -notmatch '(?m)^## Em 30 segundos\s*$') {
        $Problems.Add("Falta a seção '## Em 30 segundos' em $($file.Name).")
    } else {
        $summary = [regex]::Match($content, '(?ms)^## Em 30 segundos\s*\r?\n(.*?)(?=^## |\z)').Groups[1].Value
        $summaryBullets = [regex]::Matches($summary, '(?m)^\s*-\s+\S').Count
        if ($summaryBullets -lt 3 -or $summaryBullets -gt 5) {
            $Problems.Add("A seção 'Em 30 segundos' deve ter de 3 a 5 bullets em $($file.Name); encontrados: $summaryBullets.")
        }
    }
    if ($content -match '\[(TODO|TBD|PLACEHOLDER|Número|Tema|situação ou pergunta prática atendida)') {
        $Problems.Add("Possível placeholder não substituído em $($file.Name).")
    }
    $relativePath = [IO.Path]::GetRelativePath($NotesDirectory, $file.FullName).Replace('\', '/')
    $indexLink = '\]\(' + [regex]::Escape($relativePath) + '\)'
    if ($Readme -notmatch $indexLink) {
        $Problems.Add("Nota não ligada pelo caminho correto no README.md: $relativePath")
    }
}

if ($Problems.Count -gt 0) {
    Write-Host 'Falhas na checagem das notas:' -ForegroundColor Red
    foreach ($problem in $Problems) { Write-Host "- $problem" -ForegroundColor Red }
    exit 1
}

Write-Host "OK: $($TopicNotes.Count) notas temáticas e $($MarkdownFiles.Count) arquivos Markdown conferidos." -ForegroundColor Green

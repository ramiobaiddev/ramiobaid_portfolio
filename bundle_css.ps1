# PowerShell CSS Bundler for Rami Obaid Portfolio
# Combines all 34 modular CSS files into a single bundle.css for high-speed mobile loading
$ErrorActionPreference = "Stop"

$files = @(
  'web/styles/tokens/spacing.css',
  'web/styles/tokens/typography.css',
  'web/styles/tokens/colors.css',
  'web/styles/tokens/effects.css',
  'web/styles/tokens/component-tokens.css',
  'web/styles/global.css',
  'web/styles/typography-styles.css',
  'web/styles/layout.css',
  'web/styles/buttons.css',
  'web/styles/eyebrow.css',
  'web/styles/sections/header.css',
  'web/styles/sections/hero.css',
  'web/styles/entrance_concepts/entrance_fade.css',
  'web/styles/hero_concepts/concept_2_particles.css',
  'web/styles/sections/projects.css',
  'web/styles/sections/about_me.css',
  'web/styles/sections/lets_ship_it.css',
  'web/styles/sections/footer.css',
  'web/styles/scroll_reveal.css',
  'web/styles/progress_bar.css',
  'web/styles/pages/case_study/base.css',
  'web/styles/pages/case_study/hero.css',
  'web/styles/pages/case_study/problem.css',
  'web/styles/pages/case_study/vision.css',
  'web/styles/pages/case_study/structure.css',
  'web/styles/pages/case_study/wireframes.css',
  'web/styles/pages/case_study/visual.css',
  'web/styles/pages/case_study/engineering.css',
  'web/styles/pages/case_study/challenges.css',
  'web/styles/pages/case_study/offline.css',
  'web/styles/pages/case_study/gallery.css',
  'web/styles/pages/case_study/cta.css',
  'web/styles/pages/case_study/motion.css',
  'web/styles/pages/case_study/metrics.css'
)

$outputFile = 'web/styles/bundle.css'
$sb = [System.Text.StringBuilder]::new()
[void]$sb.AppendLine("/* ==========================================================================")
[void]$sb.AppendLine("   RAMI OBAID PORTFOLIO - PRODUCTION CSS BUNDLE")
[void]$sb.AppendLine("   Eliminates all @import network waterfalls for 100 Mobile Performance.")
[void]$sb.AppendLine("   ========================================================================== */`n")

foreach ($file in $files) {
    if (Test-Path $file) {
        $content = Get-Content -Path $file -Raw
        # Remove any stray @import lines to prevent unwanted network calls
        $cleaned = $content -replace '(?m)^\s*@import\s+[^;]+;', ''
        [void]$sb.AppendLine("/* --- Begin: $file --- */")
        [void]$sb.AppendLine($cleaned)
        [void]$sb.AppendLine("/* --- End: $file --- */`n")
    }
}

[System.IO.File]::WriteAllText((Join-Path (Get-Location) $outputFile), $sb.ToString(), [System.Text.Encoding]::UTF8)
$size = [math]::Round(((Get-Item $outputFile).Length / 1KB), 1)
Write-Host "Successfully generated $outputFile ($size KB)"


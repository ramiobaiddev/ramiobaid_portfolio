# PowerShell SCSS Compiler for Rami Obaid Portfolio
# Compiles web/styles/scss/main.scss into web/styles/bundle.css with compression and source maps
param(
    [switch]$Watch
)

$ErrorActionPreference = "Stop"

if ($Watch) {
    Write-Host "Watching web/styles/scss for changes..." -ForegroundColor Cyan
    sass --watch web/styles/scss/main.scss:web/styles/bundle.css --style=compressed
}
else {
    Write-Host "Compiling web/styles/scss/main.scss -> web/styles/bundle.css..." -ForegroundColor Cyan
    sass web/styles/scss/main.scss:web/styles/bundle.css --style=compressed
    $size = [math]::Round(((Get-Item 'web/styles/bundle.css').Length / 1KB), 1)
    Write-Host "Successfully compiled web/styles/bundle.css ($size KB)" -ForegroundColor Green
}

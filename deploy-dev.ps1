$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
function Run-Step { param([string]$Name,[scriptblock]$Action) Write-Host ""; Write-Host "=== $Name ===" -ForegroundColor Cyan; & $Action; if ($LASTEXITCODE -ne 0) { throw "$Name failed with exit code $LASTEXITCODE" } }
Set-Location $ProjectRoot
Run-Step "Automated tests" { npm test }
Run-Step "Build Alert UI" { Set-Location "$ProjectRoot\static\alert"; npm run build }
Run-Step "Build Admin UI" { Set-Location "$ProjectRoot\static\admin"; npm run build }
Run-Step "Build Panel UI" { Set-Location "$ProjectRoot\static\panel"; npm run build }
Run-Step "Forge lint" { Set-Location $ProjectRoot; forge lint }
Run-Step "Forge deploy" { Set-Location $ProjectRoot; forge deploy }
Run-Step "Forge install upgrade" { Set-Location $ProjectRoot; forge install --upgrade }
Run-Step "Forge install list" { Set-Location $ProjectRoot; forge install list }
Write-Host ""; Write-Host "TESTS PASSED AND DEPLOYMENT COMPLETE." -ForegroundColor Green

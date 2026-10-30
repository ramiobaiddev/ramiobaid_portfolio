$proc8080 = (netstat -ano | Select-String ":8080\s.*LISTENING") | ForEach-Object { ($_.ToString().Trim() -split '\s+')[-1] } | Select-Object -First 1
$proc8181 = (netstat -ano | Select-String ":8181\s.*LISTENING") | ForEach-Object { ($_.ToString().Trim() -split '\s+')[-1] } | Select-Object -First 1
if ($proc8080) { taskkill /PID $proc8080 /F; Write-Host "Killed port 8080 (PID $proc8080)" } else { Write-Host "Port 8080 already free" }
if ($proc8181) { taskkill /PID $proc8181 /F; Write-Host "Killed port 8181 (PID $proc8181)" } else { Write-Host "Port 8181 already free" }
Write-Host "Done. Run: jaspr serve"

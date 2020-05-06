# ==========================================
# AUTHOR: GRIEP MARCO
# Zeigt alle verfügbaren Chocolatey Updates an
# ==========================================


$response = Invoke-WebRequest -Uri "http://localhost:8090/upgrades"
$data = ConvertFrom-Json $([String]::new($response.Content))
$data | Out-GridView
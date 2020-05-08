# ==========================================
# AUTHOR: GRIEP MARCO
# Synchronisiert alle Chocolatey Versionsinformationen zur API
# ==========================================

$chocoAllAvailable = choco search *

Invoke-RestMethod -Method Post -Uri "http://localhost:8090/truncate"

class ChocoAppVersionInfo {
    [string]$Name
    [string]$Version
}

foreach($c in $chocoAllAvailable) {
    $json = @()
    $splitted = $c -Split " "
    $name = $splitted[0]
    $version = $splitted[1].Replace("v","")
    Write-host "Name: $($name) - Version: $($version)"
    $obj = @([ChocoAppVersionInfo]@{Name=$name;Version=$version})
    $json = $obj | ConvertTo-Json
    Invoke-RestMethod -Method Post -Uri "http://localhost:8090/create" -Body $json -ContentType "application/json"
}

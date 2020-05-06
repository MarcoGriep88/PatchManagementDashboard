$response = Invoke-WebRequest -Uri "http://localhost:8090/upgrades"
$data = ConvertFrom-Json $([String]::new($response.Content))

#$data | Out-GridView
#$data | Export-Excel

foreach ($e in $data) {
    Write-Host "Now trying to do machine: $e.Hostname"
    if (-not (Test-Connection -ComputerName $e.Hostname -Quiet)) {
        Write-Host "Host offline!"
    }
    else {
        Write-Host "Deploying Script Block now on $e.Hostname"
        Invoke-Command -ComputerName $e.Hostname –ScriptBlock { choco install $e.Software -y } -Credential $credentials
    }
}

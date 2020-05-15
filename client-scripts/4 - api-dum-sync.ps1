param( 
    [Parameter(Mandatory=$true,
            Position=0,
            ParameterSetName="DeskUpdate Path",
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            HelpMessage="Path to location of Ducmd.exe")]
    [Alias("PSPath")]
    [ValidateNotNullOrEmpty()]
    [string]
    $DeskUpdate
)

class DUMInfo {
    [string]$Hostname
    [string]$Driver
    [string]$UpgradeVersion
}

$hostname = & hostname
$Driver=""
$Version=""
$obj = @([DUMInfo]@{Hostname=$hostname;Driver=$Driver;UpgradeVersion=$Version})
$json = $obj | ConvertTo-Json


Invoke-RestMethod -Method Post -Uri "http://localhost:8100/clear" -Body $json -ContentType "application/json"

if ($PSVersionTable.PSVersion.Major -lt 4) {
    Write-Error "Powershell Version 4 required"
    exit 9000
}

if (! (Test-Path $DeskUpdate) ) 
{
    Write-Error "Deskupdate not found"
    exit 9001
}
else
{
    $content = (cmd /c $DeskUpdate' /WEB /LIST')
    
    if ($LASTEXITCODE -eq 0) 
    {
        # extract only installable packages
        $content = ($content.Where({$_ -like "Installable packages:"}, 'SkipUntil').Trim()) | Select-Object -Skip 1
        
        if ($content.Count -gt 0) {
            foreach($e in $content) {
                $IDsplit = $e -Split " - "
                $SoftSplit = $IDsplit[1] -Split ","
                $Driver = $SoftSplit[0].Trim()
                $Version = $SoftSplit[1].Trim().Replace("[version] ", "")

                $obj = @([DUMInfo]@{Hostname=$hostname;Driver=$Driver;UpgradeVersion=$Version})
                $json = $obj | ConvertTo-Json
                Invoke-RestMethod -Method Post -Uri "http://localhost:8100/create" -Body $json -ContentType "application/json"
            }            
        }
    } else {
        # return code deskupdate
        Write-Error "Program terminated with errorcode $($LASTEXITCODE) - check Ducmd.exe /E for more information"
        exit $LASTEXITCODE
    }
}

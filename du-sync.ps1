# ---------------------------------------------------------------------------
# config values
# ---------------------------------------------------------------------------
param( 
    [Parameter(Mandatory=$true,
            Position=0,
            ParameterSetName="DeskUpdate Path",
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true,
            HelpMessage="Path to location of Ducmd.exe")]
    [Alias("PSPath")]
    [ValidateNotNullOrEmpty()]
    [string[]]
    $DeskUpdate
)

# ---------------------------------------------------------------------------
# main program starts here
# ---------------------------------------------------------------------------

# check for powershell version
if ($PSVersionTable.PSVersion.Major -lt 4) {
    Write-Error "Powershell Version 4 required"
    exit 9000
}

# check for Deskupdate
if (! (Test-Path $DeskUpdate) ) 
{
    Write-Error "Deskupdate not found"
    exit 9001
}
else
{
    # run Ducmd with parameters
    $content = (cmd /c $DeskUpdate' /WEB /LIST')
    
    # if success, next step
    if ($LASTEXITCODE -eq 0) 
    {
        # extract only installable packages
        $content = ($content.Where({$_ -like "Installable packages:"}, 'SkipUntil').Trim()) | Select-Object -Skip 1
        
        if ($content.Count -gt 0) {
            # return update available
            Write-Host "Update required $($content)"
            exit 9002
            
        } else {
            # return no update available
            Write-Host "no Update required $($content)"
            exit 9003
        }
    } else {
        # return code deskupdate
        Write-Error "Program terminated with errorcode $($LASTEXITCODE) - check Ducmd.exe /E for more information"
        exit $LASTEXITCODE
    }
}

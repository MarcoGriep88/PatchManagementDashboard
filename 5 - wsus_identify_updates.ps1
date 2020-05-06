﻿Function GetUpdateState {
    param(
        [string]$wsusserver,
        [int]$port
    )
    $report = @()
    [void][reflection.assembly]::LoadWithPartialName("Microsoft.UpdateServices.Administration")
    $wsus = [Microsoft.UpdateServices.Administration.AdminProxy]::getUpdateServer($wsusserver,$False,$port)
    $CompSc = new-object Microsoft.UpdateServices.Administration.ComputerTargetScope
    $updateScope = new-object Microsoft.UpdateServices.Administration.UpdateScope; 
    $updateScope.UpdateApprovalActions = [Microsoft.UpdateServices.Administration.UpdateApprovalActions]::Install
       $updates = $wsus.GetUpdates($updateScope)
           foreach($update in $updates){ 
              $update.GetUpdateInstallationInfoPerComputerTarget($CompSc) | ?{$_.UpdateApprovalAction -eq "Install"} |  % { 
             
              $Comp = $wsus.GetComputerTarget($_.ComputerTargetId)
 
              $info = "" | select UpdateTitle, LegacyName, SecurityBulletins, Computername, OS ,IpAddress, UpdateInstallationStatus, UpdateApprovalAction, CreationDate
              $info.UpdateTitle = $update.Title
              $info.LegacyName = $update.LegacyName
              $info.SecurityBulletins = ($update.SecurityBulletins -join ';')
              $info.Computername = $Comp.FullDomainName
              $info.OS = $Comp.OSDescription
              $info.IpAddress = $Comp.IPAddress
              $info.UpdateInstallationStatus = $_.UpdateInstallationState
              $info.UpdateApprovalAction = $_.UpdateApprovalAction
              $info.CreationDate = $_.CreationDate
              $report+=$info 
            }
         }
      
    #$report | ?{$_.UpdateInstallationStatus -ne 'NotApplicable' -and $_.UpdateInstallationStatus -ne 'Unknown' -and $_.UpdateInstallationStatus -ne 'Installed' } 
    #Export-Csv -Path c:\temp\rep_wsus.csv -Append -NoTypeInformation

    foreach($r in $report) {
         
    }

}

GetUpdateState -wsusserver localhost -port 80
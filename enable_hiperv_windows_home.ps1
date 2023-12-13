# Script to activate Microsoft HyperV on Windows Home Edition
# EXECUTE AS ADMINISTRATOR

# Sets the current directory where the script is running
Set-Location $PSScriptRoot

# List the files corresponding to the *Hyper-V*.mum pattern in the Packages directory 
# and store them in the $hvFiles variable
$hvFiles = Get-ChildItem -Path "$env:SystemRoot\servicing\Packages\*Hyper-V*.mum" | Select-Object -ExpandProperty FullName

# Adds the found packages to the Windows online installation
foreach ($file in $hvFiles) {
    dism /Online /NoRestart /Add-Package:"$file"
}

# Enables the Hyper-V feature on Windows
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -LimitAccess

# END
Read-Host "Press Enter"

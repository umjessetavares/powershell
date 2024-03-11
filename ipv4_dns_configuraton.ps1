# SCRIPT TO SET THE DNS ADDRESS OF THE ACTIVE INTERFACE
# ADMINISTRATOR PRIVILEGIES
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Este script requer privilégios de administrador. Reiniciando com privilégios de administrador..."
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-File", $MyInvocation.MyCommand.Path)
    Exit
}
# New DNS Address
$DNS1 = "1.1.1.3"
$DNS2 = "1.0.0.3"

# GET NETWORK INTERFACES
$interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# CONFIGURATION
if ($interface) {
    $interface | Set-DnsClientServerAddress -ServerAddresses ($DNS1, $DNS2)
    Write-Host "DNS alterado para $DNS1 e $DNS2 com sucesso!"
} else {
    Write-Host "Nenhuma interface de rede ativa encontrada."
}

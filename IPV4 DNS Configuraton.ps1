# SCRIPT TO SET THE DNS ADDRESS OF THE ACTIVE INTERFACE
# EXECUTE AS ADMINISTRATOR

# New DNS Address
$DNS1 = "1.1.1.3"
$DNS2 = "1.0.0.3"

# Current network interface
$interface = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

# Configuration
if ($interface) {
    $interface | Set-DnsClientServerAddress -ServerAddresses ($DNS1, $DNS2)
    Write-Host "DNS alterado para $DNS1 e $DNS2 com sucesso!"
} else {
    Write-Host "Nenhuma interface de rede ativa encontrada."
}

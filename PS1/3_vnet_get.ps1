$resourceGroup ="app-rg"
$networkName ="app-vnet"

$VirtualNetwork=Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup

Write-Host $VirtualNetwork.AddressSpace.AddressPrefixes
Write-Host $VirtualNetwork.Location
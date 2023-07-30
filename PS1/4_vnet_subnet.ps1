$resourceGroup ="app-rg"
$networkName ="app-vnet"
$subnetName = "SubnetA"
$subnetAddressPrefix="10.0.0.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup

Add-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $VirtualNetwork -AddressPrefix $subnetAddressPrefix

#Stamping the Previous Command Object with the Vnet
$VirtualNetwork | Set-AzVirtualNetwork
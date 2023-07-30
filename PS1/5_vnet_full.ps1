$resourceGroup ="app-rg"
$location = "Central India"
$networkName ="app-vnet"
$addressPrefix ="10.0.0.0/16"
$subnetName = "SubnetA"
$subnetAddressPrefix="10.0.0.0/24"

$subnet=New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetAddressPrefix

New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix $AddressPrefix -Subnet $subnet
$resourceGroup ="app-rg"
$location = "Central India"
$networkName ="app-vnet"
$subnetName="SubnetA"
$networkInterfaceName="app-interface"

$VirtualNetwork=Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup

$subnet=Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $VirtualNetwork -Name $subnetName

New-AzNetworkInterface -Name $networkInterfaceName -ResourceGroupName $resourceGroup -Location $location `
-SubnetId $subnet.Id -IpConfigurationName "IpConfig"
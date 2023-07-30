$resourceGroup ="app-rg"
$location = "Central India"
$networkName ="app-vnet"
$addressPrefix ="10.0.0.0/16"

New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup -Location $location -AddressPrefix $addressPrefix

#To Remove VNet
#Remove-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup 
#Save in Variable
# $VirtualNetwork=New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroup `
# -Location $location -AddressPrefix $AddressPrefix

# Write-Host $VirtualNetwork.AddressSpace.AddressPrefixes
# Write-Host $VirtualNetwork.Location
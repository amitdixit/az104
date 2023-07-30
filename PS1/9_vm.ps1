$resourceGroup ="app-rg"
$location = "Central India"
$vmName ="appvm"
$vmSize="Standard_DS2_v2"
#Get-AzVMSize -Location 'Central India'

$credential=Get-Credential

$vmConfig=New-AzVMConfig -Name $vmName -VMSize $vmSize

Set-AzVMOperatingSystem -VM $vmConfig -ComputerName $vmName -Credential $credential -Windows

Set-AzVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" -Offer "WindowsServer" -Skus "2022-Datacenter" -Version "latest"

$networkInterfaceName="app-interface"
$networkInterface=Get-AzNetworkInterface -Name $networkInterfaceName -ResourceGroupName $resourceGroup

$vmImage=Add-AzVMNetworkInterface -VM $vmConfig -Id $networkInterface.Id

Set-AzVMBootDiagnostic -Disable -VM $vmImage

New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmImage

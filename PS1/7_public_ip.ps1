$resourceGroup = "app-rg"
$location = "Central India"
$publicIpName = "app-public-ip"
New-AzPublicIpAddress -Name $publicIpName -ResourceGroupName $resourceGroup -Location $location  -AllocationMethod Dynamic -Sku Basic

$resourceGroup="app-grp"
$location="Central India"
$accountSKU="Standard_LRS"
$storageAccountName="uniquestorageaccountname"
$storageAccountKind="StorageV2"

New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $storageAccountName `
-Location $location -Kind $storageAccountKind -SkuName $accountSKU
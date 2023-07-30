$resourceGroup="app-grp"
$location="Central India"
$appServiceName="demoplanakd55534"
$webAppName="webappakd55434434"

New-AzAppServicePlan -ResourceGroupName $resourceGroup -Location $location `
-Name $appServiceName -Tier "F1"

New-AzWebApp -ResourceGroupName $resourceGroup -Name $webAppName `
-Location $location -AppServicePlan $appServiceName

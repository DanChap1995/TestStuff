$inputString = "http://dbp-east-kv-bannerwebapi.azurekv.com/currentversion"
$pattern = "dbp"
$stopCharacter = "."

$matchIndex = $inputString.IndexOf($pattern)

if ($matchIndex -ne -1) {
  $substring = $inputString.Substring($matchIndex)
  $stopIndex = $substring.IndexOf($stopCharacter)
  if ($stopIndex -ne -1) {
    $substring = $substring.Substring(0, $stopIndex)
  }
  Write-Output $substring
}

===========================================

# Azure resource group and KeyVault details
$resourceGroupName = "myResourceGroup"
$keyVaultName = "myKeyVault"
$secretName = "mySecret"

# Check if KeyVault exists
$keyVaultExists = Get-AzKeyVault -ResourceGroupName $resourceGroupName -VaultName $keyVaultName -ErrorAction SilentlyContinue

if ($keyVaultExists -eq $null) {
  # KeyVault doesn't exist, deploy Bicep script to create KeyVault and secret
  $bicepFile = "path/to/bicep/file.bicep"
  $deploymentName = "myDeployment"
  $deploymentParams = @{
    "keyVaultName" = $keyVaultName
    "secretName" = $secretName
  }
  New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -Name $deploymentName -TemplateFile $bicepFile -TemplateParameterObject $deploymentParams

  # Get secret URI
  $secretUri = (Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $secretName).Id
  Write-Output "Secret URI: $secretUri"
} else {
  # KeyVault already exists, output existing secret URI
  $secretUri = (Get-AzKeyVaultSecret -VaultName $keyVaultName -Name $secretName).Id
  Write-Output "Secret URI: $secretUri"
}

=========================================

# Input string and character to search for
$inputString = "C:\Users\username\Documents\file.txt"
$searchChar = "\"

# Find the last occurrence of the search character
$lastIndex = $inputString.LastIndexOf($searchChar)

# Get everything to the right of the search character
$outputString = $inputString.Substring($lastIndex + 1)

# Output the result
Write-Output "Output string: $outputString"
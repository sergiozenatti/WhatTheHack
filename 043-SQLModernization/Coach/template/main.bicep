targetScope = 'subscription'

param baseRgName string = 'sqlmodernhk'
param location string = 'australiaeast'
param numberOfDeployments int = 1

resource resourceGroups 'Microsoft.Resources/resourceGroups@2021-04-01' = [for i in range(0, numberOfDeployments): {
  name: '${baseRgName}-${i}'
  location: location
}]

module deployment './azuredeploy.bicep' = [for i in range(0, numberOfDeployments): {
  name: 'sql-modernization-deployment-${i}'
  scope: resourceGroup(resourceGroups[i].name)
  params: {
  }
}]

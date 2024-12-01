param appName string

param location string = resourceGroup().location

@secure()
param administratorLogin string

@secure()
param administratorLoginPassword string


resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: '${appName}-sqlServer'
  location: location
  properties: {
      administratorLogin: administratorLogin
      administratorLoginPassword: administratorLoginPassword
  }
}

resource sqlDb 'Microsoft.Sql/servers/databases@2017-10-01-preview' = {
  parent: sqlServer
  name: '${appName}-sqlDb'
  location: location
  sku: {
    name: 'S1'
  }
}

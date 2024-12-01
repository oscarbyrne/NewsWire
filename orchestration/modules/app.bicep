param appName string

param location string = resourceGroup().location


resource hostingPlan 'Microsoft.Web/serverfarms@2023-01-01' = {
	name: '${appName}-hostingPlan'
	location: location
	sku: {
		name: 'F1'
	}
}

resource site 'Microsoft.Web/sites@2023-01-01' = {
	name: appName
	location: location
	properties: {
		serverFarmId: hostingPlan.id
		httpsOnly: true
		reserved: false
		siteConfig: {
			metadata: [
				{
					name: 'CURRENT_STACK'
					value: 'dotnetcore'
				}
			]
		}
	}
}

param appName string

@secure()
param dbAdminLogin string

@secure()
param dbAdminLoginPassword string


module app 'modules/app.bicep' = {
	name: 'NewsWire-app'
	params: {
		appName: appName
	}
}

module db 'modules/db.bicep' = {
	name: 'NewsWire-db'
	params: {
		appName: appName
		administratorLogin: dbAdminLogin
		administratorLoginPassword: dbAdminLoginPassword
	}
}

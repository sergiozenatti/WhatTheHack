deploy:
	az login --use-device-code
	az account set --subscription ""
	az deployment sub create --location australiaeast --template-file main.bicep --parameters baseRgName=sqlmodaue --parameters location=australiaeast --parameters numberOfDeployments=6
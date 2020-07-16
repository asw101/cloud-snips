# README

## group
```bash
RESOURCE_GROUP='190800-app-service'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## app-service - linux
```bash
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json
```

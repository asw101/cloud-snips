# README

## group
```bash
RESOURCE_GROUP='190800-acr'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## acr
```bash
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json
```

## acr-output
```bash
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy-output.json
```

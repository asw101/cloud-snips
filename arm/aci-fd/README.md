# README

## group
```bash
RESOURCE_GROUP='190800-aci-fd'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## aci
```bash
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json
```

# README

## group
```bash
RESOURCE_GROUP='190800-kv-acr'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## kv-acr
```bash
az group deployment create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json
```

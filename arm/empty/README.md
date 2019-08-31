# README

## group
```bash
RESOURCE_GROUP='190800-empty'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## empty
```bash
az group deployment create --resource-group $RESOURCE_GROUP \
    --template-file empty.json \
    --mode 'Complete'
```

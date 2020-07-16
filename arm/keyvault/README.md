# README

## group
```bash
RESOURCE_GROUP='190800-kv'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## kv
```bash
ADMIN_ID=$(az ad signed-in-user show | jq -r .objectId)
az deployment group create --resource-group $RESOURCE_GROUP \
    --template-file azuredeploy.json \
    --parameters adminId="$ADMIN_ID"
```

## kv-secret
```bash
RESOURCE_GROUP='190800-test'
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy-secret.json \
    --parameters keyVaultResourceGroup='190800-kv' keyVaultName='kvrecwetpjrqrmk'

RESOURCE_GROUP='190800-test'
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy-secret.json \
    --parameters keyVaultName='kvrecwetpjrqrmk'
```

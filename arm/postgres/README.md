# README

## group
```bash
RESOURCE_GROUP='190800-postgres'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## postgres
```bash
SERVER_PASSWORD=$(openssl rand -hex 12)'A1!'
az group deployment create --resource-group $RESOURCE_GROUP \
    --template-file azuredeploy.json \
    --parameters administratorLoginPassword=$SERVER_PASSWORD 
```

## postgres + keyvault
```bash
SERVER_PASSWORD=$(openssl rand -hex 12)'A1!'
az group deployment create --resource-group $RESOURCE_GROUP \
    --template-file azuredeploy-kv.json \
    --parameters administratorLoginPassword=$SERVER_PASSWORD \
        location='centralus'
```


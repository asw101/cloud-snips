# README

## group
```bash
RESOURCE_GROUP='190800-vm'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## vm - windows
```bash
RESOURCE_GROUP='190800-vm-win'
PASSWORD_OR_KEY=$(openssl rand -hex 6)'A1!'
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy-windows.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY"
```

## vm - linux
```bash
RESOURCE_GROUP='190800-vm-lin'
PASSWORD_OR_KEY="$(cat ~/.ssh/id_rsa.pub)"

# with key
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy-linux.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY"

# with key, vm name, and script
az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy-linux.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY" \
        vmName=vm2 \
        customDataUrl='https://gist.githubusercontent.com/asw101/40102c0abce14351b2c0d4efd3e342c9/raw/190800-docker.sh'
```

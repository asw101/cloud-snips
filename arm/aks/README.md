# README

## aks - single:
```bash
SUBSCRIPTION_ID=$(az account show | jq -r .id)
RESOURCE_GROUP='190800-aks-1'
LOCATION='eastus'

RANDOM_STR=$(openssl rand -hex 3)
SP='sp.json'

# create with --skip-assignment and:
az ad sp create-for-rbac --skip-assignment > _/$SP

SP_NAME=$(cat _/$SP | jq -r .name)
SP_CLIENT_ID=$(cat _/$SP | jq -r .appId)
SP_CLIENT_SECRET=$(cat _/$SP | jq -r .password)
DEPLOYMENT_NAME="190800-aks-1"
AKS_NAME="aks1"

az group create -n $RESOURCE_GROUP -l $LOCATION

az role assignment create --assignee $SP_NAME --role Contributor \
    --scope "/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}"

az deployment group create --resource-group $RESOURCE_GROUP \
    --template-file ../empty/empty.json \
    --mode 'Complete'

az deployment group create --name $DEPLOYMENT_NAME --resource-group $RESOURCE_GROUP  \
    --template-file azuredeploy.json \
    --mode 'Complete' \
    --parameters \
    clusterName=$AKS_NAME \
    location=$LOCATION \
    servicePrincipalClientId=$SP_CLIENT_ID \
    servicePrincipalClientSecret=$SP_CLIENT_SECRET \
    agentCount=1 \
    agentVMSize=Standard_B2s \
    | jq -c .

# login and test cluster
az aks get-credentials -g $RESOURCE_GROUP -n $AKS_NAME
kubectl cluster-info
kubectl get nodes
kubectl run ubuntu -it --restart=never --image=ubuntu --command -- bash
```

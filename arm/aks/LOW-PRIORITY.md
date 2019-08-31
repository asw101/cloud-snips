# LOW PRIORITY

## register provider
```bash
az feature register --name LowPriorityPoolPreview --namespace Microsoft.ContainerService
az feature list -o table --query "[?contains(name, 'Microsoft.ContainerService/LowPriorityPoolPreview')].{Name:name,State:properties.state}"
az provider register --namespace Microsoft.ContainerService
```

## az rest
```bash
SUBSCRIPTION_ID=$(az account show | jq -r .id)
RESOURCE_GROUP='190822-aks'
AKS_NAME='aks-501b64'
AGENTPOOL_NAME='lowpriority'

# list
URI="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}/providers/Microsoft.ContainerService/managedClusters/${AKS_NAME}/agentPools?api-version=2019-08-01"

az rest --method get --uri $URI

# create
URI="/subscriptions/${SUBSCRIPTION_ID}/resourceGroups/${RESOURCE_GROUP}/providers/Microsoft.ContainerService/managedClusters/${AKS_NAME}/agentPools/${AGENTPOOL_NAME}?api-version=2019-08-01"
BODY=$(cat agentpool.json)

az rest --method put --uri $URI --body "$BODY"
```

## Resources
- https://docs.microsoft.com/en-us/rest/api/aks/agentpools/createorupdate

az deployment group create --resource-group $RESOURCE_GROUP \
    --template-file empty.json \
    --mode 'Complete'
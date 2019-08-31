az group deployment create --resource-group $RESOURCE_GROUP \
    --template-file empty.json \
    --mode 'Complete'
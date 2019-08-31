# README

## subscription + group
```bash
SUBSCRIPTION='ca-aawislan-demo-test'
RESOURCE_GROUP='190800-vmss'
LOCATION='eastus'

az account set --subscription $SUBSCRIPTION

az group create -n $RESOURCE_GROUP -l $LOCATION
```
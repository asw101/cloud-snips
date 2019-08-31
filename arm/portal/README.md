# README

## arm - azure portal
```bash
# gist: https://gist.github.com/asw101/f2f5ceced2b2235d570838c2489ce187

TEMPLATE_URL='https://gist.githubusercontent.com/asw101/f2f5ceced2b2235d570838c2489ce187/raw/azuredeploy-linux.json'
OUTPUT_URL='https://portal.azure.com/#create/Microsoft.Template/uri/'$(echo $TEMPLATE_URL | jq -s -R -r @uri )
echo $OUTPUT_URL
```

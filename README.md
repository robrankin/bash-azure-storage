An example Bash script to upload a file to an Azure Storage account, using an Azure AD provided Service Principle, and the Client Credetials OAuth2 flow.

Register a new App in your AAD and assign it access to the storage account or container required.

Usage:
1. Enter the service principles crendentials in the config file and source it.
2. run: `./azure_sa.sh <filename>`

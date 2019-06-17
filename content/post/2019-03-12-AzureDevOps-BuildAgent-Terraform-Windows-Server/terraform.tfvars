
#The name of the resource group
resourcegroup = "AzureDevOpsWin"

#The location of the resources
location = "westeurope"

#The url of the Azure DevOps Organization https://dev.azure.com/[Organization]
url = "https://dev.azure.com/[ORGANIZATION]"

#The Personal Access Token (PAT), generate here: https://dev.azure.com/[Organization]/_usersSettings/tokens
pat = ""

#The name of the agent pool, https://dev.azure.com/[Organization]/_settings/agentpools?poolId=8&_a=agents
pool = "Default"

#The name of the agent
agent = "SelfHostedWin1"

#The size of the vm
size = "Standard_B1ms"

#The hostname of the VM
hostname = "AzureDevOpsWin"

#The username for the VM
admin_username = ""

#The password for the VM
admin_password = ""
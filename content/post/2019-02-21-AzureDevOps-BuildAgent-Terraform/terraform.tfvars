
#The name of the resource group
resourcegroup = "AzureDevOps"

#The location of the resources
location = "westeurope"

#The Azure DevOps Url https://dev.azure.com/[Organization]/
url = "https://dev.azure.com/<Organization>/"

#The Personal Access Token (PAT), generate here: https://dev.azure.com/[Organization]/_usersSettings/tokens
pat = ""

#The name of the agent pool, https://dev.azure.com/[Organization]/_settings/agentpools?poolId=8&_a=agents
pool = "Default"

#The name of the agent
agent = "SelfHosted1"

#The SSH public key for the VM
sshkey = "ssh-rsa AAAAB3NzaC1yc2EAAAA ..."

#The size of the vm
size = "Standard_B1s"
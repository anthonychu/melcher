---
title: "Infrastructure as Code and Governance: Deployment Best Practices"
date: 2019-01-07T14:30:24+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Azure
  - Terraform
  - Azure DevOps
  - Governance
tags:
  - Provisioning
  - ARM
  - Continuous Integration & Continuous Deployment (CI/CD)
  - 
  - Infrastructure as Code (IAC)
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "#azure #DevOps #terraform"
---

Using Terraform is easy - but benefiting of it in a team with governance and approvals? Not so much.  
In this post, I show you how I set things up to have solid, repeatable deployments with Terraform and Azure DevOps.
<!--more-->

Todo:

- Staging Concept
- Approvals
- Repeatable Deployments
- Naming Convention

## Governance and Infrastructure as Code

My governance requirements are the following:

- **Automation**: Automate as much as possible. Every change should be checked in, documented and executed accordingly. "Everything as code".
- **Multiple Subscriptions and Resource Groups**: Organize everything in subscriptions and resource groups.
- **Resource Tags**: Tag my resources (structure, criticality, cost management etc)
- **Permission Assignments / Role Based Access Controls (RBAC)**: Assign permissions in a structured/governed way.
- **Resource Locks**: Prevent accidental deletion
- **Naming Convention** Enable/Enforce a consistent naming convention
- **Documentation** System should document itself. For the latest information/configuration I dont want to check the portal. The documentation must be searchable, too.
- **Staging** Support of multiple stages: DEV and PROD is fine. Having more environments for short periods should be easy to setup/destroy.

Those requirements are only the tip of the iceberg - there are many more implicit requirements, but covering them will be a great start.

Given all those Infrastructure as Code requirements, I use Terraform to tackle them.

## Terraform

[Terraform](https://www.terraform.io/) is the tool that amazed me the most last year - it's so easy to provision **and update** infrastructure environments that I recommend it to everyone. Infrastructure as Code (IaC) to provision and manage small to large environments is definitely a must, it's 2019!

This wont be an introductory post to terraform and Azure, there are already plenty of them. And the [Azure docs](https://docs.microsoft.com/en-us/azure/terraform/) are solid, too.  
Instead, this post will focus on the Infrastructure as Code Governance topics in the context of Azure.

A huge [template repository](https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples ) is available, we dont have to start from scratch.

If you use VS Code you should install [this extension](https://marketplace.visualstudio.com/items?itemName=mauve.terraform) to get autocomplete and references - that speeds up the development a lot!
{{< fancybox "images" "vscode-terraform.png" "Terraform VS Code integration" "single_image" >}}

The provisioning part is covered and solid - how about the governance aspect? Rolling-out changes and have them in a structured, repeatable deployment process for multiple developers is a core requirements and I solved them with Azure DevOps.

## Azure DevOps

Using Terraform in a team in a collaborative, secure and reproducible manner? Right, Azure DevOps can and should take care of our Terraform scripts. The good news are there is are pretty solid [terraform build & release tasks](https://marketplace.visualstudio.com/items?itemName=charleszipp.azure-pipelines-tasks-terraform) available. So installation of the terraform executable is covered, same are the terraform commands for:

- init
- validate
- plan
- apply

That is a low hanging fruit here and covers a lot! The destroy command, as of now, is not implemented in this task. If you need it, then you can use one of the other available [build tasks](https://marketplace.visualstudio.com/search?term=terraform&target=AzureDevOps&category=Azure%20Pipelines&sortBy=Relevance) for Azure DevOps.

Next up, let's check a basic deployment scenario.

## Build and Release: Terraform Deployments

Once I push my Terraform scripts to Azure DevOps, a build is triggered to generate a plan. To demonstrate this, I simple checked in a small script that only provisions a resource group with a tag.

{{< highlight ruby >}}
#create a resource group with the terraform name 'main'
resource "azurerm_resource_group" "main" {
  name     = "tf-resources"
  location = "West Europe"

  tags {
    environment = "staging"
  }
}
{{< /highlight >}}

'terraform plan' then generates me execution plan that details what will be done when we 'terraform apply' that script. So every addition, modification or deletion will be listed - how awesome is that?! Try to do that with PowerShell or ARM templates.

In the example above it would result in:
{{< highlight bash >}}
##[section]Starting: terraform plan

‌Refreshing Terraform state in-memory prior to plan...‌
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.
------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  ‌+‌ create‌
‌
Terraform will perform the following actions:

‌  ‌+‌ ‌azurerm_resource_group.main‌
‌      id:               <computed>‌
      location:         "westeurope"
      name:             "tf-resources"
      tags.%:           "1"
      tags.environment: "staging"
‌
‌Plan:‌ 1 to add, 0 to change, 0 to destroy.‌

------------------------------------------------------------------------
Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
{{< /highlight >}}

So every line that starts with a **+** will be added to the subscription. Super helpful stuff!



## Azure DevOps & Terraform

So this was all pretty basic terraform stuff (still awesome!) - but 

## The build

todo: overview
todo: approval
todo: output screenshot
todo: error handling
todo: release pipeline

{{< fancybox "images" "terraform-build.png" "Plan the terraform deployment" "single_image" >}}

{{< highlight yaml >}}
queue:
  name: Hosted VS2017
steps:
- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-installer.TerraformInstaller@0
  displayName: 'Use Terraform 0.11.8'


- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-cli.TerraformCLI@0
  displayName: 'terraform init'
  inputs:
    command: init

    backendType: azurerm

    backendServiceArm: 'Microsoft Azure Internal Consumption (36d3ff36-dc30-4224-9970-6c24b9043705)'

    backendAzureRmResourceGroupName: terraform

    backendAzureRmStorageAccountName: mmeterraform

    backendAzureRmContainerName: staging

    backendAzureRmKey: '<key>'


- task: charleszipp.azure-pipelines-tasks-terraform.azure-pipelines-tasks-terraform-cli.TerraformCLI@0
  displayName: 'terraform plan'
  inputs:
    command: plan

    environmentServiceName: '<subscription>'
{{< /highlight >}}

gives you the following:
{{< fancybox "images" "terraform-plan-output.png" "terraform plan output in Azure DevOps" "single_image" >}}

## Final words

todo: summary
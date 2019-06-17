---
title: "AZ-203: Learning Material / Link Collection"
date: 2019-01-10T10:47:40+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Certification
  - Development
tags:
  - AZ-203
featured: "images/AZ-203.png"
featuredalt : ""
hashtags: 
  - "#azure"
  - "#az-203"
---

I took the AZ-200 beta exam last year and the exam did not make it out of beta. It was [replaced with the AZ-203 exam](https://www.microsoft.com/en-us/learning/community-blog-post.aspx?BlogId=8&Id=375185). I am pretty sure that I did not meet the 70% threshold to be automatically credited with the [AZ-203](https://www.microsoft.com/en-us/learning/exam-AZ-203.aspx) certification. I had to learn for the AZ-201 certification anyways.

*Update (18.01.2019): I did pass AZ-200, but it was not enough to get credited for AZ-203.*

Here is my list of links that I use to prepare for the exam.
<!-- more-->

## Topics and Links

### Develop Azure Infrastructure as a Service Compute Solutions (10-15%)

#### Implement solutions that use virtual machines (VM)

Provision VMs  
https://docs.microsoft.com/en-us/azure/virtual-machines/
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/tutorial-manage-vm

Create ARM templates  
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/ps-template

Configure Azure Disk Encryption for VMs  
https://docs.microsoft.com/en-us/azure/virtual-machines/windows/encrypt-disks

#### Implement batch jobs by using Azure Batch Services

Manage batch jobs by using Batch Service API  
https://docs.microsoft.com/en-us/azure/batch/
https://docs.microsoft.com/en-us/azure/batch/batch-api-basics

Run a batch job by using Azure CLI, Azure portal, and other tools  
https://docs.microsoft.com/en-us/azure/batch/batch-apis-tools

Write code to run an Azure Batch Services batch job  
https://docs.microsoft.com/en-us/azure/batch/quick-run-dotnet

#### Create containerized solutions

Create an Azure Managed Kubernetes Service (AKS) cluster  
https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes  
https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough

Create container images for solutions  
https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-app

Publish an image to the Azure Container Registry  
https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-prepare-acr

Run containers by using Azure Container Instance or AKS  
https://docs.microsoft.com/en-us/azure/container-instances/container-instances-tutorial-deploy-app

### Develop Azure Platform as a Service Compute Solutions (20-25%)

#### Create Azure App Service Web Apps

Create an Azure App Service Web App  
https://docs.microsoft.com/en-us/azure/app-service/app-service-cli-samples  
https://docs.microsoft.com/en-us/azure/app-service/app-service-powershell-samples  
https://blogs.msdn.microsoft.com/benjaminperkins/2017/10/02/create-an-azure-app-service-web-app-using-powershell/

Create an Azure App Service background task by using WebJobs  
https://docs.microsoft.com/en-us/azure/app-service/web-sites-create-web-jobs
https://docs.microsoft.com/en-us/azure/app-service/websites-dotnet-deploy-webjobs

Enable diagnostics logging  
https://docs.microsoft.com/en-us/azure/app-service/overview-diagnostics

#### Create Azure App Service mobile apps

https://docs.microsoft.com/en-us/azure/app-service-mobile/app-service-mobile-value-prop

Add push notifications for mobile apps  
https://docs.microsoft.com/en-us/azure/notification-hubs/notification-hubs-push-notification-overview

Enable offline sync for mobile app  
https://docs.microsoft.com/en-us/azure/app-service-mobile/app-service-mobile-offline-data-sync

Implement a remote instrumentation strategy for mobile devices  
https://docs.microsoft.com/en-us/intune/device-management

#### Create Azure App Service API apps

Create an Azure App Service API app  
https://docs.microsoft.com/en-us/azure/app-service/

Create documentation for the API by using open source and other tools  
https://blog.kloud.com.au/2017/06/13/azure-functions-with-swagger/

#### Implement Azure functions

Implement input and output bindings for a function  
https://docs.microsoft.com/en-us/azure/azure-functions/functions-triggers-bindings

Implement function triggers by using data operations, timers, and webhooks  
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-scenario-function-sb-trigger

Implement Azure Durable Functions  
https://docs.microsoft.com/en-us/azure/azure-functions/durable/durable-functions-overview

Create Azure Function apps by using Visual Studio  
https://docs.microsoft.com/en-us/azure/azure-functions/functions-create-your-first-function-visual-studio

### Develop for Azure storage (15-20%)

#### Develop solutions that use storage tables

Design and implement policies for tables  
https://docs.microsoft.com/en-us/rest/api/storageservices/establishing-a-stored-access-policy

Query table storage by using code  
https://docs.microsoft.com/en-us/rest/api/storageservices/querying-tables-and-entities

Implement partitioning schemes  
https://docs.microsoft.com/en-us/azure/architecture/best-practices/data-partitioning  
https://docs.microsoft.com/en-us/rest/api/storageservices/designing-a-scalable-partitioning-strategy-for-azure-table-storage

#### Develop solutions that use Cosmos DB storage
https://docs.microsoft.com/en-us/azure/cosmos-db/introduction

Create, read, update, and delete data by using appropriate APIs  
https://docs.microsoft.com/en-us/azure/cosmos-db/sql-api-dotnet-samples

Implement partitioning schemes  
https://docs.microsoft.com/en-us/azure/cosmos-db/partitioning-overview

Set the appropriate consistency level for operations  
https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels

#### Develop solutions that use a relational database

Provision and configure relational databases  
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-get-started-portal

Configure elastic pools for Azure SQL Database  
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-elastic-pool

Create, read, update, and delete data tables by using code  
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-design-first-database-csharp

#### Develop solutions that use blob storage

Move items in blob storage between storage accounts or containers  
https://docs.microsoft.com/en-us/azure/storage/common/storage-moving-data

Set and retrieve properties and metadata  
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-properties-metadata  
https://docs.microsoft.com/en-us/rest/api/storageservices/setting-and-retrieving-properties-and-metadata-for-blob-resources  
https://docs.microsoft.com/en-us/rest/api/storageservices/set-blob-metadata

Implement blob leasing  
https://docs.microsoft.com/en-us/rest/api/storageservices/lease-blob

Implement data archiving and retention  
https://docs.microsoft.com/en-us/azure/storage/blobs/storage-lifecycle-management-concepts

### Implement Azure security (10-15%)

#### Implement authentication

Implement authentication by using certificates, forms-based authentication, or tokens  
https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-scenarios

Implement multi-factor or Windows authentication by using Azure AD  
https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks

Implement OAuth2 authentication  
https://docs.microsoft.com/en-us/azure/active-directory/develop/v1-protocols-oauth-code

Implement Managed Service Identity (MSI)/Service Principal authentication  
https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview

#### Implement access control

Implement CBAC (Claims-Based Access Control) authorization  
https://docs.microsoft.com/en-us/aspnet/core/security/authorization/claims?view=aspnetcore-2.2

Implement RBAC (Role-Based Access Control) authorization  
https://docs.microsoft.com/en-us/azure/role-based-access-control/

Create shared access signatures  
https://docs.microsoft.com/en-us/azure/storage/common/storage-dotnet-shared-access-signature-part-1

#### Implement secure data solutions

Encrypt and decrypt data at rest and in transit  
https://docs.microsoft.com/en-us/azure/storage/common/storage-service-encryption

Create, read, update, and delete keys, secrets, and certificates by using the KeyVault API  
https://docs.microsoft.com/en-us/azure/key-vault/

### Monitor, troubleshoot, and optimize Azure solutions (15-20%)

#### Develop code to support scalability of apps and services

Implement autoscaling rules and patterns  
https://docs.microsoft.com/en-us/azure/architecture/best-practices/auto-scaling

Implement code that handles transient faults  
https://docs.microsoft.com/en-us/azure/architecture/best-practices/transient-faults

#### Integrate caching and content delivery within solutions

Store and retrieve data in Azure Redis cache  
https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/

Develop code to implement CDNs in solutions  
https://docs.microsoft.com/en-us/azure/cdn/

Invalidate cache content (CDN or Redis)
https://docs.microsoft.com/en-us/azure/cdn/cdn-purge-endpoint  
https://docs.microsoft.com/en-us/azure/azure-cache-for-redis/cache-administration#reboot

#### Instrument solutions to support monitoring and logging

Configure instrumentation in an app or service by using Application Insights  
https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview

Analyze and troubleshoot solutions by using Azure Monitor  
https://docs.microsoft.com/en-us/azure/azure-monitor/

Implement Application Insights Web Test and Alerts  
https://docs.microsoft.com/en-us/azure/azure-monitor/app/monitor-web-app-availability  
https://docs.microsoft.com/en-us/azure/azure-monitor/app/alerts

### Connect to and Consume Azure Services and Third-party Services (20-25%)

#### Develop an App Service Logic App

Create a Logic App  
https://azure.microsoft.com/en-gb/services/logic-apps/

Create a custom connector for Logic Apps  
https://docs.microsoft.com/en-us/connectors/custom-connectors/create-logic-apps-connector

Create a custom template for Logic Apps  
https://docs.microsoft.com/en-us/azure/logic-apps/logic-apps-create-logic-apps-from-templates

#### Integrate Azure Search within solutions

Create an Azure Search index  
https://docs.microsoft.com/en-us/azure/search/search-create-service-portal

Import searchable data  
https://docs.microsoft.com/en-us/azure/search/search-semi-structured-data

Query the Azure Search index  
https://docs.microsoft.com/en-us/azure/search/search-query-overview

#### Establish API Gateways

Create an APIM instance  
https://docs.microsoft.com/en-us/azure/api-management/api-management-key-concepts

Configure authentication for APIs  
https://docs.microsoft.com/en-us/azure/api-management/api-management-authentication-policies

Define policies for APIs  
https://docs.microsoft.com/en-us/azure/api-management/api-management-policies

#### Develop event-based solutions

Implement solutions that use Azure Event Grid  
https://docs.microsoft.com/en-us/azure/event-grid/

Implement solutions that use Azure Notification Hubs  
https://azure.microsoft.com/en-us/services/notification-hubs/

Implement solutions that use Azure Event Hub  
https://docs.microsoft.com/en-us/azure/event-hubs/

#### Develop message-based solutions

Implement solutions that use Azure Service Bus  
https://docs.microsoft.com/en-us/azure/service-bus/

Implement solutions that use Azure Queue Storage queues  
https://docs.microsoft.com/en-us/azure/storage/queues/storage-dotnet-how-to-use-queues

## Mapping of AZ-200 & AZ-201 to AZ-203

AZ-203 Exam Objective | Previous Exam | Module where covered
--- | --- | ---
Implement solutions that use virtual machines (VM) | New objective, no existing content |
Implement batch jobs by using Azure Batch Services | AZ-200.3: Develop Azure Platform as a Service solutions | Scheduling bulk operations |
Create containerized solutions | AZ-200.3: Develop Azure Platform as a Service solutions | Create solutions that use Azure Kubernetes Service |
Create Azure App Service Web Apps | AZ-200.3: Develop Azure Platform as a Service solutions | Creating App Service Web Apps |
Create Azure App Service mobile apps | AZ-200.3: Develop Azure Platform as a Service solutions | Creating mobile apps |
Create Azure App Service API apps | AZ-200.3: Develop Azure Platform as a Service solutions | Creating App Service Web Apps (partial coverage) 
Implement Azure functions | AZ-200.3: Develop Azure Platform as a Service solutions | Creating Azure Functions |
Develop solutions that use storage tables | AZ-200.2: Develop for Azure storage | Develop solutions that use Azure Storage tables |
Develop solutions that use Cosmos DB storage | AZ-200.2: Develop for Azure storage | Develop solutions that use Azure Cosmos DB storage |
Develop solutions that use a relational database | AZ-200.2: Develop for Azure storage | Develop solutions that use a relational database |
Develop solutions that use blob storage | AZ-200.2: Develop for Azure storage | Develop solutions that use Microsoft Azure Blob storage |
Implement authentication | AZ-200.4: Implement security in Azure development solutions | Implementing authentication |
Implement access control | AZ-200.4: Implement security in Azure development solutions | Implementing access control |
Implement secure data solutions | AZ-200.4: Implement security in Azure development solutions | Implementing secure data solutions |
Develop code to support scalability of apps and services | AZ-201.1: Develop for an Azure cloud model | Develop for autoscaling |
Integrate caching and content delivery within solutions | AZ-200.2: Develop for Azure storage | Developing for caching and content delivery solutions |
Instrument solutions to support monitoring and logging | AZ-201.1: Develop for an Azure cloud model | Instrument an app or service and implement logging |
Develop an App Service Logic App | AZ-200.3: Develop Azure Platform as a Service solutions | Creating an app service Logic App |
Integrate Azure Search within solution | AZ-201.1: Develop for an Azure cloud model | Enable the search of textual content |
Establish API Gateways | AZ-201.2: Implement Azure development integration solutions | Manage APIs by using API Management (APIM) |
Develop event-based solutions | AZ-201.2: Implement Azure development integration solutions | Configure a message-based integration architecture |
Develop message-based solutions | AZ-201.2: Implement Azure development integration solutions | Develop an application message model |

Good luck  
Max
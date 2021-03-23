---
title: "Launching: Mevitco ProFile - large file exchange on Azure"
date: 2021-03-22T17:35:51+01:00
2021: "03"
author: "Max Melcher"
categories:
  - Mevitco
  - ProFile
  - Azure
tags:
  - large file exchange
  - Azure
  - Azure App Service
  - Azure Marketplace
  - Azure STorage
  - Azure Container
  - Docker
  - ClamAV
featured: "images/Mevitco-ProFile.png"
featuredalt : "Launching Mevitco ProFile - serverless large file exchange on Azure"
hashtags: 
  - "#azure"
---

I always wanted to build a product, sell a service - and here we are: **I am launching Mevitco ProFile**.  
It is purely based on Azure managed services, no Virtual Machines, no per-user license - and super easy to use. Two buttons, less is sometimes more.

## Mevitco ProFile

In my years at various companies I saw several 'large file exchange' solutions. Some of them were homegrown, some of them are purchased, a few are SaaS offerings. Most of them were complicated to use, complicated to deploy and operated and used Virtual Machines to exchange files - and all of them were super expensive. Cloud-native offerings? Hosting in your own Azure Subscription? None. 

I wanted to have a very simple service - so simple that you can deploy the solution with the click of a button. Simple enough to not require Kubernetes.

{{< fancybox "images" "ProFile-HighLevelArchitecture.png" "ProFile - High Level Architecture" "single_image" >}}

An Azure App Service, Azure Storage Account, Azure Container Registry - and Azure Active Directory for authentication. No Virtual Machine, no database, no Kubernetes. It is that simple.

## Solution Highlights

* Data & Application entirely in your subscription
* Native Azure managed services: Azure Web Apps and Azure Storage. Compound SLA of 99.94% in one region. No Virtual Machine.
* Configurable file extensions
* Integrated and self-updating Antivirus
* Unlimited file size - auto-retry on connection-loss
* Download files as zip
* Native Azure Active Directory Integration
* End to end encryption: Encrypted storage, encrypted traffic - optional password protection per session
* Email Notifications
* Removing of personal identifiable information after 90 days (configurable), e.g. comply with GDPR.
* Configurable data retention, default is 7 days
* Multi-language: Currently English and German is available, additional languages can be added on request
* Fully encrypted, at rest and in transit
* Fully charged via Azure Marketplace 

## Screenshots

Uploading one or more files, drag & drop or browsing.
The files are uploaded in 'chunks' of 10 MB. If an upload failed, it is retried automatically.
{{< fancybox "images" "ProFile.png" "ProFile - Uploading a file" "single_image" >}}

The solution can be configured via the integrated setup page. File extensions, Authentication, Email notifications etc.
{{< fancybox "images" "Setup.png" "ProFile - Integrated Setup" "single_image" >}}

How much storage is used? How many sessions were created? How much download volume per month? Everything on the statistics page (for admins only):
{{< fancybox "images" "Statistics.png" "ProFile - Statistics" "single_image" >}}

An authenticated user has an overview of their sessions - and delete them.
{{< fancybox "images" "MySessions.png" "ProFile - Session Overview" "single_image" >}}

## Demo

A demo environment (1 TB limit, 1 day retention, reduced file-extension, no authentication) is available here: 
https://mevitco.azurewebsites.net/

## Running Mevitco ProFile

The Azure Marketplace, as of now, requires to have two offerings - one for the application itself, and one to run it - the runtime. 

The Application is provided as a docker container image: free of charge with all features, no strings attached. You can get it via the Azure Marketplace '[ProFile Container]'. During deployment you can use an existing [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/) or create a new one. This registry will then host the docker container so you can use it in a runtime. You can select what version you want to provision, and if the version should be automatically updated if there is a new release. 

To run the container, there are two options:

Currently there are two hosting options: 
1. Azure 'Managed Offering' runtime - supported by Mevitco
2. 'self-deployed', 'self-operated' runtime - everything you

The Azure Managed Offering - provided through the Azure Marketplace - ensures that you get the latest and tested runtime for Mevitco ProFile. The extended security validation in the Azure Marketplace ensures a high quality and secure deployment. Additionally, [just-in-time access](https://docs.microsoft.com/en-us/azure/azure-resource-manager/managed-applications/request-just-in-time-access#request-access) can be enabled to give you full control.

The runtime deploys two Azure services: Azure App Services and one Azure Storage Account.
 

https://azuremarketplace.microsoft.com/en-us/marketplace/apps/mevitco.profile-container?tab=Overview
https://github.com/MaxMelcher/mevitco.ProFile.runtime

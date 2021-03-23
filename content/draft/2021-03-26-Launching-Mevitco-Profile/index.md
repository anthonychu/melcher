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

I wanted to have a very simple service - so simple that you can deploy the solution with the click of a button.

{{< fancybox "images" "ProFile-HighLevelArchitecture.png" "ProFile - High Level Architecture" "single_image" >}}

## Features

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

## Screenshots

## Demo

## Hosting Options

https://azuremarketplace.microsoft.com/en-us/marketplace/apps/mevitco.profile-container?tab=Overview
https://github.com/MaxMelcher/mevitco.ProFile.runtime

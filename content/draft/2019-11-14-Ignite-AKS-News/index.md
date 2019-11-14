---
title: "Azure Kubernetes (AKS) - Ignite 2019 Updates"
date: 2019-11-14T08:40:11+01:00
2019: "11"
author: "Max Melcher"
categories:
  - AKS
  - Azure
tags:
  - Kubernetes
  - Hugo
  - Performance
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "#azure"
---

## Multiple node pools

Support for multiple node pools in Azure Kubernetes Service is now available – Multiple node pools with different hardware or really flexible scaling. 
Requires VirtualMachineScaleSets as nodes.
The terraform implementation is not very stable yet!

## Threat Protection for Azure Kubernetes Service

Threat Protection for Azure Kubernetes Service (AKS) Support in Security Center – scan images in Azure Container Registry for vulnerabilities
Azure Kubernetes Service (AKS) support for Azure Availability Zones is now available – higher availability 
Live performance metrics and live deployments in Azure Monitor for containers – live reporting, used this yesterday during the load testing. Adds a little bit of cpu overhead!
Azure Kubernetes Service (AKS) support for authenticated IPs is now available – secure the Kubernetes admin API access. You should add this once it is in terraform.
Azure Kubernetes Service (AKS) cluster autoscaler is now available – node autoscaling, could be quite handy for unpredictable workloads. 
This requires VirtualMachineScaleSets as nodes.
Easier diagnostics and logging with Azure Kubernetes Service is now in preview – preview, but gives insight into common problems

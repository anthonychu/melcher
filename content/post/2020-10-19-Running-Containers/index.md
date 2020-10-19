---
title: "Running Containers on Azure – All Options Explained"
date: 2020-10-19T17:12:13+02:00
2020: "10"
author: "Max Melcher"
categories:
  - Container
tags:
  - Azure Kubernetes Service 
  - AKS
  - ACI
  - App Service
  - WebApps
  - Functions
  - Container
featured: "images/ContainersOnAzure.png"
featuredalt : "Running containers on Azure"
hashtags: 
  - "#azure"
---

If you want to run a container, most of the customers I talk to, immediately think about Kubernetes – this is obviously a correct answer, but there are plenty of other options available on Azure. In this post I am providing a quick overview of all the options. Firstly, I start with the standalone container options followed by the container orchestration options.<!--more-->

## Standalone Container
In this section I am going to explain the standalone container runtimes – while some of them could technically run multiple containers, the focus are mostly single instances of them.

### Virtual Machine (VM)
Virtual Machines provide the greatest flexibility to run docker container. The 284 different (more are being added all the times!) combinations of CPU and RAM gives you the perfect platform to run one or more containers. On both windows and linux VMs you can install the docker runtime and you are ready – but – it’s a VM that you have to maintain and configure, I would only consider this work Dev/Test workloads simply because the operational efforts are too high.

### Azure Container Instance (ACI)
Azure Container Instances are the exact opposite of the VM-based docker runtime: you provide the container; Azure will run it. If its one instance or a thousand does not really matter. The price depends on the number of vCPU and GBs of memory allocated per second – a serverless container runtime. This is ideal if you need to burst and simply do not know when the load is coming – prediction of the cost is sometimes a challenge if you can only work with estimates. You can even combine ACI with Azure Kubernetes Service to mix and match the workloads.

### Azure App Service
Azure Web App for Containers – this is my personal hidden champion - you provide a container; App Service will run it. Ideal for web-based workloads because App Service is a web hosting platform. Deployment, scaling, and monitoring is already existing and can be utilized right out of the box.

### Azure Batch
Batch compute and containers are a great combination – if the workload can be scaled across many batch jobs, you can put it in a container and scale it with Azure Batch. You can also leverage low priority VMs, great to reduce the cost.

## Container Orchestration
Now to the more complex and sophisticated options to run a container – container orchestrators. Like a symphony, you need to coordinate multiple containers on multiple hosts to ‘play’ together - in the following I explain the options.

### Azure Kubernetes Service (AKS)
The fully fledged, fully managed Kubernetes service on Azure – most of the dev teams I talk to appreciate that they can just consume the Kubernetes as a platform, but running and operating them is simply not something they want to do. So, with AKS, this is taken care of, you select the version of Kubernetes and a few minutes later you have your cluster – and then you can run your container symphony on it.

### Azure Service Fabric
Azure Service Fabric is a distributed system platform and the core of Azure. It is more of the exotic ways to run a container, but it can run, scale and operate them.

## Summary
If this would have been a quiz, could you name them all before reading this post? The many options make it sometimes a little harder to choose, but having flexibility and choice is always great if you have a particular problem.

 

Hope it helps,  
Max
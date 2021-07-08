---
title: "Load Balancing on Azure - An Overview"
date: 2020-10-21T17:57:26+02:00
2020: "10"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Load Balancer
  - Application Gateway
  - Application Gateway
  - Traffic Manager
featured: "images/LoadBalancer.png"
featuredalt : "Load Balancing on Azure - An Overview"
hashtags: 
  - "#azure"
---

# Load Balancing on Azure - An Overview

There are multiple options to do load balancing on Azure, this article will give you an overview and list the different scenarios when to use what.<!--more-->

&#39;Load Balancing&#39; is here the distribution (e.g. web requests) based on defined criteria (e.g. user location, resource utilization or round robin) to achieve a goal, e.g. avoid overloading or in case of a disaster to increase availability by automatically failing over to a redundant component.

Please also look at the [decision tree](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview#decision-tree-for-load-balancing-in-azure) for when to use what.

We will start with the regional services followed by the global services.

## Regional Load Balancing Services

A regional service is a service that is running in one region. If the region has an outage, then the service might stop working. If the target region has Availability Zones, you can deploy the regional service zone-redundant to get higher availability – but if the entire zone &#39;explodes&#39; then you will be affected by this.

Please note: regional service does not mean that you must route the traffic to the same region!

### Azure Load Balancer (ALB)

Azure Load Balancer is certainly one of the core services of Azure – they are available [since 2014](https://azure.microsoft.com/en-us/blog/internal-load-balancing/) and many iterations have been added since then. Back then only one SKU was available, now we have Standard and Basic Load Balancers available, with [different capabilities, scale, SLA](https://docs.microsoft.com/en-us/azure/load-balancer/skus), and [pricing](https://aka.ms/lbpricing).

The Azure Load Balancer is a Layer 4 network service (see [OSI model](https://en.wikipedia.org/wiki/OSI_model)), so it transports the traffic to the target service. It is working for all traffic (TCP, UDP) and its recommended for non-HTTP(S) traffic. It is obviously used once you deploy a VM in multiple Availability Zones, or if you use Kubernetes.

Additionally, there is an interesting feature in preview to make [the Azure Load Balancer a cross-regional service](https://docs.microsoft.com/en-us/azure/load-balancer/cross-region-overview). Follow the documentation or [Azure Update](https://azure.microsoft.com/en-us/updates/?query=load%20balancer) for further information.

[Docs](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)  
[Pricing](https://azure.microsoft.com/pricing/details/load-balancer/)  
[SLA](https://aka.ms/lbsla)  

### Azure Application Gateway (AAG)

Azure Application Gateway is a Layer 7 network service (see [OSI model](https://en.wikipedia.org/wiki/OSI_model)) for HTTP(s)-based applications – compared to the previous mentioned Azure Load Balance the AAG is *closer to the user*, can therefore inspect the traffic and even offload the SSL termination. It can run with only private IPs, this is sometimes the decision point to use the service compared to the global services described later. A [Web Application Firewall](https://docs.microsoft.com/en-us/azure/application-gateway/features#web-application-firewall) can also be added and configured to get protection against common attacks (e.g. SQL injection, cross site scripting).

[Docs](https://docs.microsoft.com/en-us/azure/application-gateway/overview)  
[Pricing](https://azure.microsoft.com/en-us/pricing/details/application-gateway/)  
[SLA](https://azure.microsoft.com/en-us/support/legal/sla/application-gateway/v1_2/)  

## Global Load Balancing Services

Next, we look at the two global Azure Load Balancing services, Azure Traffic Manager and Azure Front Door – both require that the target service be accessible via the internet, in other words, must have a public IP.

### Azure Traffic Manager (ATM)

Azure Traffic Manager is a DNS-based load balancer – you request the DNS name, it returns the best IP to connect to. This is sometimes misunderstood, ATM does not act like a proxy and tunnels the traffic to the target, it tells the client to what target it can connect – based on load, geographic proximity, or health of the endpoint. The target must be an internet-facing service.

[Docs](https://docs.microsoft.com/en-us/azure/traffic-manager/traffic-manager-overview)  
[Pricing](https://azure.microsoft.com/pricing/details/traffic-manager/)  
[SLA](https://azure.microsoft.com/en-us/support/legal/sla/traffic-manager/v1_0/)  

### Azure Front Door (AFD)

Azure Front Door is very similar to Azure Traffic Manager but adds a ton of features for HTTP-based, internet-facing applications. It can do SSL termination for noticeable faster response times, can add a Web Application Firewall, supports HTTP/2, CDN – if you want to run a public website in multiple regions, then this service provides great flexibility.

[Docs](https://docs.microsoft.com/en-us/azure/frontdoor/front-door-overview)  
[Pricing](https://azure.microsoft.com/pricing/details/frontdoor/)  
[SLA](https://azure.microsoft.com/en-us/support/legal/sla/frontdoor/v1_0/)  

Hope it helps,  
Max
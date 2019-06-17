---
title: "Azure Red Shirt Dev Tour Munich 2018 - a summary"
date: 2018-01-18T09:42:45+01:00
aliases:
   - "/post/2018-01-18-Azure-Red-Shirt-Dev-Tour-Munich-2018/"
2018: "01"
author: "Max Melcher"
featured: "ScottAndMax.png" 
featuredalt : "A selfie with Scott Guthrie" 
featuredpath : "/images/2018/Redshirt"
categories:
  - Community
  - Azure
  - Development
tags:
  - Scott Guthrie
  - Scott Gu
---

A summary of Scott Guthrie's Azure Red Shirt Dev Tour in Munich - in short: it was __**SUPER AWESOME**__! <!--more-->

## Scott Guthrie - the Red Shirt / "cloud boss" live on stage

Yesterday, January 18th 2018 was the Red Shirt Dev Tour by Scott Guthrie [@scottgu](https://twitter.com/@scottgu) in Munich. The whole event was around 6 hours and I estimate that there were around 600 people:
{{< fancybox "/images/2018/Redshirt" "Attendees.jpg" "600 people" "single_image" >}}

The venue, Alte Kongresshalle, in Munich was great for this type of event - but unfortunately no Wifi and no chargers. I wanted to blog more intensively about this event, but ran out of power... 

So here comes a (*incomplete*) list about the topics that Scott covered:

### VMs

We saw a VM with 128 cores - must have been a M128s type, with A LOT OF MEMORY. Inside the Windows Server VM he started a Hyper-V manager, RDP'ed into a VM that had a HyperV manager and RDP'ed into a linux VM. Pure inception, pure awesome. The feature is called "[nested virtualization](https://azure.microsoft.com/en-us/blog/nested-virtualization-in-azure/)".

### Azure CLI

Managing Azure with the Azure Portal is one of the options. Scott showed us how easy it is to use the Azure CLI and even the Azure Cloud shell directly in your browser. Clicking is sooooo yesterday!

### Web Apps

Scott spent a lot of time showing us how awesome Azure AppServices are. He showed a lot of demos (e.g. ASP .net core MVC) and showed us how easy it is to scale the sites vertically and horizontally - I am a web guy, this stuff is solid!    

### Deployment

Next topic was continuous deployment with Azure Websites - it was so easy, Scott did it live on stage in ~2 minutes. Create a deployment slot, deploy to it - swapping to prodution with ZERO downtime - as easy as it should be. And if things break there is a way back. I use this daily, big like from my side! 

### Xamarin 

Next up was Laurent Bugnion who showed us how easy it is to create awesome native apps with Xamarin - with live debugging on the iPhone: 
{{< fancybox "/images/2018/Redshirt" "Xamarin.jpg" "Xamarin and native apps" "single_image" >}}

It was brief, but seeing this opens the horizont. Good stuff!

### Continuous Integration & Continuous Deployment (CI/CD)

Scott showed us a Visual Studio Team Services (VSTS) project that he is responsible for - did some analysis of the recent commits, showed us fancy dashboards of the performance of the team - merged a pull request live on stage (that was rejected because of a policy).

### SQL Databases

Azure SQL is a cool one - it was never easier to get a new database running (and maintained) than with Azure SQL. 3 clicks and 1 minute later you have a nie performing database that is always up to date, backups, high-availability and ready to use.

### Cosmos DB

The new kid in town: [Cosmos "no-sql" database](https://azure.microsoft.com/en-us/services/cosmos-db/) with high-performance, globally distributed, no schema awesomeness. I used it in a project in the past - once you understand it, its very very AWESOME. 

### Azure Functions (serverless)

Scott showed us how easy it is to integrate http hooks - in this case a github notification in a serverless [Azure Function](https://azure.microsoft.com/en-us/blog/introducing-azure-functions/). Then he told us about a customer that notified that there must be a bug in the invoice - 1 billion executions cost them 80$ - but it's not a bug, thats exactly what it is for. Batch processing in scale. Check the [pricing page](https://azure.microsoft.com/en-us/pricing/details/functions/) for the crazy, very low, numbers. 

### Logic Apps

Do you integrate services? If so, check out Logic Apps. Thats an area I will checkout sooner than later. 

### Cognitive Services

Cognitive Services are always fun! Especially if Scott used them live on stage in a cool image recognition demo. Only if a picture contains a cat it was approved:
{{< fancybox "/images/2018/Redshirt" "CognitiveServices.jpg" "Cat or no cat? That's the question!" "single_image" >}}

The attendees uploaded pictures during Scott's talk - but Cognitive Services filtered out the "dog" pictures.

Next was live face and emotion detection. I never saw a "sad Scott" - but we all had really fun while he pretended to be sad!
{{< fancybox "/images/2018/Redshirt" "CognitiveServices_Face.jpg" "A happy and a sad Scott!" "single_image" >}}

### Azure Machine Learning

I am not very sure here, but I think it was Paige Bailey [@DynamicWebPaige](https://twitter.com/DynamicWebPaige) who presented Azure Machine Learning. Data Cleaning was my favorite (I wish that would be available in Excel!!!). Brief, but again, excellent! 

### Azure Stack 

Running a cruise ship? Other areas were you need Azure's flexibility but **offline**? Then checkout Azure stack. I certainly will.

### Azure Advisor 
Paying too much? Azure Advisor can give you a help here. The Cloudyn reports are awesome, too - they tell you what you are paying and why. 

### Security Center
Security and Threat Detection is super important. You must trust the cloud and therefore the cloud must be secure! Scott showed us some incidents and how Azure protects us. Patching, too. Everything there. Important, very important options we have there. 

### Summary

It was awesome. I really enjoyed Scott's presentation - giving a talk for 6 hours at this pace with that many topics. Simply **WOW**! 
But I am pretty sure I forgot to mention lots of topics like containers, SQL injections and what not - this day was soooooo broad!

And the selfie, I wont forget that one.

Thanks for the day!!!

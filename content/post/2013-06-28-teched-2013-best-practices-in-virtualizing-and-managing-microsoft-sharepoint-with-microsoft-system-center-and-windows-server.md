---
title: 'TechEd 2013: Best Practices in Virtualizing and Managing Microsoft SharePoint with Microsoft System Center and Windows Server'
author: Max Melcher
aliases:
   - "/post/2013-06-28-teched-2013-best-practices-in-virtualizing-and-managing-microsoft-sharepoint-with-microsoft-system-center-and-windows-server/"
2013: "06"
type: post
date: 2013-06-28T13:49:37+00:00
url: /2013/06/teched-2013-best-practices-in-virtualizing-and-managing-microsoft-sharepoint-with-microsoft-system-center-and-windows-server/
yourls_shorturl:
  - http://melcher.it/s/13
categories:
  - TechEd

---
Session by [Simon Skinner][1] ([@CymonSkinner][2])

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb23.png" width="244" height="139" border="0" />][3]

> SharePoint is now a company standard, but what is supported, sensible, or even practicable? How do we go about monitoring and managing SharePoint? In this session, we discuss the virtualization path and best practices using Hyper-V for high availability and why virtualization makes sense. […]

Here are my notes:

<!--more-->

## Planning Virtualization

There is now support to virtualize the largest SQL Server installations – this is good news. From the slides:

> A SharePoint 2013 infrastructure deployed within 5 Hyper-V VMs (3 WFE, 1 App, 1 SQL), running on a single physical server, backed by SSD-based, mirrored Storage Spaces, supported the demand of over 1.3 million heavy users (60 requests per hour), with 1% concurrency, running a lightweight, non-blocking workload), with measurably low response times throughout.

Impressive numbers, I will read the [full report][4] soon.

## Deployment

There are a couple of tools to deploy a SharePoint Farm – some of them are new to me. Simon showed us how to automate the deployment with Virtual Machine Manager 2012 – the templates look quite impressive! Then he mentioned, this apparently a bit too short, System Center.

## Monitoring

Monitoring can be done with SharePoint Management Pack for System Center Operations Manager. Important: The installation experience is not that smooth, check the slides for instructions.

Other options are ULS and SharePoint Health Analyzer. The good things about the Health Analyzer is that they are visible in SCOM – so for a bigger installation its maybe worth to create custom health rules so you can quickly detect problems – and react in time and proactively.

What is really cool is that you can add a log monitor on the ULS logs – for multiple web frontends this is awesome – and so you get a centralized log. Neat!

> I call it Intellectual Laziness

Nice quote – Lazy people tend to automate tasks so I fully agree on that. If you add some brain to it you have more time for important stuff.

## Protection

Last chapter is about protection of your farm – so its about Data Protection Manager 2012 – you can even backup to Azure now. Thats a tool thats was totally off my radar -  good stuff.

## Session Slides and Recording

As usual you can get the [slides][5] and the [recording][6] from the TechEd site. Because Bill interacted with the audience, go watch the recording.

## My evaluation

Automation and Best Practices – this was a rock solid session. Many new stuff for me, very valuable. Simon’s presentation was very good – highly recommend it!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2013-06-28T15-18-37_0" alt="2013-06-28T15-18-37_0" src="http://melcher.it/wp-content/uploads/2013-06-28T15-18-37_0_thumb.jpg" width="244" height="184" border="0" />][7][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2013-06-28T15-02-23_1" alt="2013-06-28T15-02-23_1" src="http://melcher.it/wp-content/uploads/2013-06-28T15-02-23_1_thumb.jpg" width="244" height="184" border="0" />][8]

 [1]: http://channel9.msdn.com/Events/Speakers/simon-skinner
 [2]: http://twitter.com/CymonSkinner
 [3]: http://melcher.it/wp-content/uploads/image23.png
 [4]: http://download.microsoft.com/download/C/C/1/CC16C89A-E289-4217-B2D8-7DD37A4285B8/ESG-Lab-Validation-WS2012-HyperV-and-SQL2012.pdf
 [5]: http://video.ch9.ms/sessions/teched/eu/2013/MDC-B356.pptx
 [6]: http://channel9.msdn.com/Events/TechEd/Europe/2013/MDC-B356#fbid=brbMsfI4lBZ
 [7]: http://melcher.it/wp-content/uploads/2013-06-28T15-18-37_0.jpg
 [8]: http://melcher.it/wp-content/uploads/2013-06-28T15-02-23_1.jpg

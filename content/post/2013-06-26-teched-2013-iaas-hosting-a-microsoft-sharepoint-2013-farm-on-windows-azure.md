---
title: 'TechEd 2013: IaaS: Hosting a Microsoft SharePoint 2013 Farm on Windows Azure'
author: Max Melcher
aliases:
   - "/post/2013-06-26-teched-2013-iaas-hosting-a-microsoft-sharepoint-2013-farm-on-windows-azure/"
2013: "06"
type: post
date: 2013-06-26T11:05:21+00:00
url: /2013/06/teched-2013-iaas-hosting-a-microsoft-sharepoint-2013-farm-on-windows-azure/
yourls_shorturl:
  - http://melcher.it/s/V
categories:
  - SharePoint 2013
  - TechEd

---
Session by [Michael Washam][1] ([@MWashamMS][2]) how to provision SharePoint 2013 in Windows Azure Virtual Machines.

Session notes after the jump.

<!--more-->

Provisioning SharePoint with PowerShell in the Cloud – sounds awesome, is awesome. Michael showed us how to provision and configure Azure virtual machines to host high available SharePoint farms – load balanced and what not. For the load balancer part, there has to be an anonymous site so that the load balancer can determine the state of the web app, he's coming in with no credentials.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Michael provisioning Azure VMs with PowerShell" alt="Michael provisioning Azure VMs with PowerShell" src="http://melcher.it/wp-content/uploads/2013-06-26T12-14-22_0_thumb.jpg" width="244" height="184" border="0" />][3]{.thickbox}

## Small Farm Architecture Tips

&nbsp;

> Scale out - not up!

I totally agree – that’s good for Search Architecture, too.

## MSDN Subscription Changes

There are free hours when you have a MSDN subscription – this applies to my subscription, too. This is great, I literally see my new VM already….

## Automation, Automation, Automation

The message is: Automation saves money and reduces error (I add: It creates leisure time!). There is a <a href="https://github.com/WindowsAzure/azure-sdk-tools-samples" target="_blank">github repository</a> with collection of scripts how to provision SharePoint 2013 on Azure – very useful!

## My Evaluation

Interesting to know, hopefully I can host a project with this in the future. I will try it at least with my free hours.

 [1]: http://channel9.msdn.com/Events/Speakers/michael-washam
 [2]: https://twitter.com/MWashamMS "https://twitter.com/MWashamMS"
 [3]: http://melcher.it/wp-content/uploads/2013-06-26T12-14-22_0.jpg

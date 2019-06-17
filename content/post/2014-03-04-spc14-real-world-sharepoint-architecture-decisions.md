---
title: 'SPC14: Real-world SharePoint architecture decisions'
author: Max Melcher
aliases:
   - "/post/2014-03-04-spc14-real-world-sharepoint-architecture-decisions/"
2014: "03"
type: post
date: 2014-03-04T21:37:23+00:00
url: /2014/03/spc14-real-world-sharepoint-architecture-decisions/
yourls_shorturl:
  - http://melcher.it/s/23
categories:
  - Conference
  - ITPro
  - Office Web Apps 2013
  - Search
  - SharePoint 2013

---
> Being a SharePoint architect can be challenging - you need to deal with everything from hardware, resources, requirements, business continuity management, a budget and of course customers. You, the architect, have to manage all this and in the end deliver a good architecture that satisfies all the needs of your customer. Along the line you have to make decisions based on experience, facts and sometimes the gut feeling. In this session we will cover some of the architectural changes in the SharePoint 2013 architecture, some of the new guidance from Microsoft and provide insight into a number of successful real-world scenarios. You will see what decisions were made while designing and implementing these projects with emphasis on why they were made.

Session "Real-world SharePoint architecture decisions" by [Wictor Wilén][1], here are my notes:

## Changes

Distributed Cache Service: Patches will be separately delivered. Wictor recommends to use the latest CU.

Request Management: Rule-based, software load balancing. Missconfigured rules can take down your farm.

Search: Rearchitectured and rewritten with using features from both FAST and SharePoint Search are implemented. Same engine is used for Exchange.

Office Web Apps (WAC): Wictor’s favorite service – separate application, separate server, separate patches.

Workflow: separate product – can be shared with multiple farms (not recommended)

Claims Based Authentication: the new default.

OAuth: Used for Authentication. A basic understanding really helps.

S2S Auth: Apps, Workflow use server to server authentication.

## Sizing

> There is no perfect architecture you can download and apply.

Or as I would say: It depends.

> 3 is the new 2 – and 7 is the new 5

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1705" alt="IMG_1705" src="http://melcher.it/wp-content/uploads/IMG_1705_thumb.jpg" width="348" height="185" border="0" />][2]{.thickbox}

Means you need more servers – but think about the fault domain, if you virtualize you need redundant VM servers, if you do load balancing you need redundancy there. Always ask yourself how to patch this?

## Topology

Routing, caching and database must be fast – every request go through there, if they are slow your farm will be slow.

Search Layer should have <500 msec latency. Many components are based on Search – make it fast!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1714" alt="IMG_1714" src="http://melcher.it/wp-content/uploads/IMG_1714_thumb.jpg" width="244" height="184" border="0" />][3]{.thickbox}

Search requires different planning in 203 – cross site publishing, analytics, recommendations need to be taken care of. October 2013 CU contains huge improvements.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1711" alt="IMG_1711" src="http://melcher.it/wp-content/uploads/IMG_1711_thumb.jpg" width="244" height="184" border="0" />][4]{.thickbox}[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1716" alt="IMG_1716" src="http://melcher.it/wp-content/uploads/IMG_1716_thumb.jpg" width="244" height="184" border="0" />][5]{.thickbox}

Workflow Server: You can install it on 1 or 3 servers – no other options.

Office Web Apps: Separate servers – no other option.

App Server: On prem, co-locate with SP server, Azure or other hosting options (LAMP) to offload the workload.

Certifcates: You should use certificates for about everything – when someone steals your oauth token they could access sensible data. Apps, WAC - and more.

Firewall: Firewall team should be involved early. Wictor will provide a firewall cheat sheet, because Technet lacks a good one.

User Profile: ADI, built-in FIM, External FIM are the options. He suggest to use external FIM but you need to license it.

MySites, Social, Yammer: MySite is a must. DirSync is a must for Yammer (to make it fault tolerant you need 4 additional servers, 2 ADFS, 2 Web Proxies)

Hybrid: Search is the key to hybrid, Mysites can be deployed on-prem or on O365.

Look and Feel: If you want to customize deploy the MySite on-prem.

Social. Yammer is the way forward.

## Single Web Application approach

One WebApp to listen to all host headers, and is **recommended**. AppCatalog has to be in the same WebApp – if you use two, you need two AppCatalogs.

Memory footprint reduced.

Most often requires Host Named Site Collections.

For Host Named Site Collections he recommends a custom site creation provider.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1722" alt="IMG_1722" src="http://melcher.it/wp-content/uploads/IMG_1722_thumb.jpg" width="244" height="184" border="0" />][6]{.thickbox}

Root Site Collection is **required**.

### Caveats

You need a load balancer for the custom http header.

## Demo

Wictor showed us how to create a Host Named Site Collection (HNSC) with PowerShell. Very straight forward, worked like a charm and is another good reason to use PowerShell.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1724" alt="IMG_1724" src="http://melcher.it/wp-content/uploads/IMG_1724_thumb.jpg" width="348" height="185" border="0" />][7]{.thickbox}

Then Wictor showed some pretty extensive samples – can not write them down, was too complex to summarize, but was very useful to see complex scenarios – would love to see them in Technet as reference.

## Forgotten stuff

List of things people often forget in SharePoint architectures:

  1. High Availability and Desaster recovery 
      1. 20% of the farms Wictor sees have 99.9% uptime
      2. 10% had 100% uptime requirements (impossible).
      3. Affects the cost
  2. Workflow
  3. Provider Hosted Apps
  4. Access Services 2013

## Things to avoid / consider

Multi-tenancy, often done for the wrong reasons. For large-scale hosting consider O365.

Streched Farms – read <http://askwictor.com/spstreched>

Service Farms and Service Application federation: Makes solution more complex, understand limitations upfront. Managed Metadata Service is a good service to federate.

## Summary

So many good sessions in parallel – Future of Infopath or the session by Spencer Harbar about Identity Federation (homework) – I am still glad that I attended Wictor’s session, good stuff, I learned quite a lot and “refreshed” many topics I tend to forget. The room was packed, there is obviously a huge demand!

Wictor delivered so many stuff in a short time (my notes are therefore not complete!) – he is really fast paced <img class="wlEmoticon wlEmoticon-smile" style="border-style: none;" alt="Smiley" src="http://melcher.it/wp-content/uploads/wlEmoticon-smile2.png" />

 [1]: https://twitter.com/wictor
 [2]: http://melcher.it/wp-content/uploads/IMG_1705.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1714.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1711.jpg
 [5]: http://melcher.it/wp-content/uploads/IMG_1716.jpg
 [6]: http://melcher.it/wp-content/uploads/IMG_1722.jpg
 [7]: http://melcher.it/wp-content/uploads/IMG_1724.jpg

---
title: 'SPC14: Search architecture and sizing in SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2014-03-06-spc14-search-architecture-sizing-sharepoint-2013/"
2014: "03"
type: post
date: 2014-03-06T04:55:17+00:00
url: /2014/03/spc14-search-architecture-sizing-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/2c
categories:
  - Conference
  - ITPro
  - Office 365
  - Search
  - SharePoint 2013

---
> In this session we will dig into the new architecture for Search in SharePoint 2013. We will cover all architectural components, plus discuss the differences between the 2013 release versus FAST Search and search in SharePoint 2010. Microsoft has updated topology models for different sized deployments. This will be presented along with sizing and scaling data for both physical and virtual machines - actionable data you can use to assess and use during your planning phase. We will also cover planning for high availability, backup/restore, and migration.

Here are my session notes for “Search architecture and sizing in SharePoint 2013” by Barry Waldbaum and Thomas Molbach.

## Search Architecture

Thomas briefly explained the Search Architecture – nothing new here for me, its very well documented on Technet.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1872" alt="IMG_1872" src="http://melcher.it/wp-content/uploads/IMG_1872_thumb.jpg" width="244" height="184" border="0" />][1]{.thickbox}

### Scaling

SharePoint 2013 Search scales pretty well –. I tried it in a project and it works.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1873" alt="IMG_1873" src="http://melcher.it/wp-content/uploads/IMG_1873_thumb.jpg" width="244" height="184" border="0" />][2]{.thickbox}.

### Web Front-End

Display Template, Query Rules – quite a lot happens on the web frontend.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1875" alt="IMG_1875" src="http://melcher.it/wp-content/uploads/IMG_1875_thumb.jpg" width="244" height="184" border="0" />][3]{.thickbox}

### Analytics

With the analytics service you can do very great things because it provides the insights behind the “Trends” in SharePoint. It even provides a view counter.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1879" alt="IMG_1879" src="http://melcher.it/wp-content/uploads/IMG_1879_thumb.jpg" width="244" height="184" border="0" />][4]{.thickbox}

### 

## Search Query Tool

Thomas showed some nice tricks with the awesome [Search Query Tool][5]. There is a property called [recommendedfor][6] that accepts a url and shows what other items are recommended for the given url. Then he filtered on ViewsRecent to show the elements that were recently clicked on.

More about the tool will be announced tomorrow by [Mikael Svenson][7] ([blog][8]).

## Sizing

> Benchmark the VMs to verify that you get the performance they IT department promised you

Scaling from small 10M to 40M:

> Average document size is 250KB

I use that as a rule of thumb, too - but it has constraints.

> SharePoint 2010 had Single Point of Failures – SharePoint 2013 does not have this anymore

Large Topology: 100M Enterprise

24 Servers – phew.

October 2013 Cumulative Update

High Density Indexing: 4 Index Partitions per Node – this cut the amount of server requirements in half (less licenses!) but you have to scale up your hardware.

> Q: Why only 10M items in one index?
> 
> A: Higher amount: Backup takes longer, Response time gets worse

Analytics: Scale-up, otherwise it eats more network.

That was incredible - I had to stop taking notes, really dense information delivery 🙂

## Backup and Restore

Robust backup, no Query Downtime during backup – it is even supported to restore QA backup on PROD (same topology).

## Migration

### Re-Implement

Create everything from scratch.

### Search First Migration

Publish Search Service Application – done that, works great.

### Migrate from SharePoint 2010

Attach the Search Service Application Database

### Migrate from Fast Search For SharePoint 2010

Backup/Restore Database – PowerShell script to to some work.

## Summary

Apparently 50% of the session was not in the description – I expected more Sizing and Architecture and was close to leave the audience. Then the good part with the sizing started and provided really good value to me. WOW – had a blast! The changes that happened in October 2013 CU/SP1 for search are really incredible. Additionally, I waited in the queue because there were so many questions – and learned even more. Great stuff. Did I say it was great yet?

 [1]: http://melcher.it/wp-content/uploads/IMG_1872.jpg
 [2]: http://melcher.it/wp-content/uploads/IMG_1873.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1875.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1879.jpg
 [5]: https://sp2013searchtool.codeplex.com/
 [6]: http://blogs.technet.com/b/tothesharepoint/archive/2014/01/22/add-and-configure-the-recommended-items-and-popular-items-web-part-in-sharepoint-server-2013.aspx#recommendedfor
 [7]: https://twitter.com/mikaelsvenson
 [8]: http://techmikael.blogspot.com/

---
title: 'TechEd 2013: Step by Step: Search Development in Microsoft SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2013-06-27-teched-2013-step-by-step-search-development-in-microsoft-sharepoint-2013/"
2013: "06"
type: post
date: 2013-06-27T09:18:16+00:00
url: /2013/06/teched-2013-step-by-step-search-development-in-microsoft-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/Z
categories:
  - Search
  - TechEd

---
Another search session – good times!

<!--more-->

Session by Jan Inge Bergseth (MSFT, Search Center of Excellence)

## Content Enrichment

Content Enrichment is a great feature to enrich your data during crawl – actually it’s the only way to enrich at all. When the crawler index an item and if the metadata of the current item matches some criteria, the metadata are sent to a customizable web service. Important: Metadata aliases do not work! Additionally you cannot change the body field and the security descriptors – wow, the last one is bad. But you can reject documents during crawl, crawl blacklists come to my mind. This is also great for calculations based on the provided metadata (days since published > 10, as example).

## 

## Content Ingestion

Several options to integrate data from external systems:

  * No code 
      * OData
      * SQL
  * Code 
      * .NET Assembly
      * WCF

Important: If you develop a custom connector you should implement the methods for incremental crawling otherwise there will be slow full crawls only.

&nbsp;

## Display Templates

Important: If you don’t use the enterprise search center you do not get the html files to edit them – only the unreadable js files. Wow, tough one.

&nbsp;

## Demo

Jan showed one demo from the content enrichment, BDC to the final display templates – easy to follow, nothing to complex. The result looked like this:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb17.png" width="244" height="69" border="0" />][1]

I assume, the audience get the idea how powerful that new design is – or as Jan said:

> The Sky is the limit

## 

## Loading scripts

There are several ways to load external javascript files:

  * <script> tag
  * SP.SOD
  * $includeScript
  * or load them in the masterpage

Jan recommended to add big javascript files in the masterpage so that when you hit the search center, the scripts are already loaded. I think this is good for certain situations, in a big environment this is unmaintainable and can cause that you bloat up your masterpage.

&nbsp;

## Hover Templates

In a short example Jan showed how to extend the hover template with some client object model calls to get the best ranked items related to the current item – good one!

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2013-06-27T11-13-11_4.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2013-06-27T11-13-11_4" alt="2013-06-27T11-13-11_4" src="http://melcher.it/wp-content/uploads/2013-06-27T11-13-11_4_thumb.jpg" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    Loading related items in the hover templates. Here you can see best ranked items
  </p>
</div>

## 

## Slides / Recording

You can grab the slides or watch the recording [here][2].

&nbsp;

## My evaluation

Step by step – straight forward demo, enjoyed it! Thanks again, Jan.

 [1]: http://melcher.it/wp-content/uploads/image17.png
 [2]: http://channel9.msdn.com/Events/TechEd/Europe/2013/SES-B311#fbid=brbMsfI4lBZ

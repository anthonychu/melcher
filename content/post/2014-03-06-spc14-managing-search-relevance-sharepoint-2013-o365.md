---
title: 'SPC14: Managing Search Relevance in SharePoint 2013 and O365'
author: Max Melcher
aliases:
   - "/post/2014-03-06-spc14-managing-search-relevance-sharepoint-2013-o365/"
2014: "03"
type: post
date: 2014-03-06T20:20:18+00:00
url: /2014/03/spc14-managing-search-relevance-sharepoint-2013-o365/
yourls_shorturl:
  - http://melcher.it/s/2f
categories:
  - Conference
  - ITPro
  - Office 365
  - Search
  - SharePoint 2013

---
> Improve the value of search results by managing Relevance. SharePoint 2013 and O365 provide a comprehensive set of tools to manage Search Relevance. SharePoint 2013 and O365 combine and improve upon the best tools available for Fast Search and SharePoint 2010, and introduce the notion of Query Rules that allow administrators to influence relevance for a single query or sets of queries using a straightforward user interface. In this talk, we will explain how ranking works under the hood, and give hands on demonstrations of how to use query rules, result sources, XRANK, federation to external search providers, and use the rank tuning tool to improve relevance and the value of your search solutions. We will explain the Relevance Lifecycle, the iterative process of finding problem queries and fixing them that is essential to optimizing relevance, and discuss which tools are most appropriate for various situations.

My notes for “Managing Search Relevance in SharePoint 2013 and O365” by David Louis Hollembaek and [Mikael Svenson][1].at SharePoint Conference 2014 in Las Vegas.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2005" alt="IMG_2005" src="http://melcher.it/wp-content/uploads/IMG_2005_thumb.jpg" width="348" height="185" border="0" />][2]

> 15 years of search experience on stage

## The Problem

Standard search results lack personal relevancy and the result presentation is not that good – this can be done better.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2002" alt="IMG_2002" src="http://melcher.it/wp-content/uploads/IMG_2002_thumb.jpg" width="244" height="184" border="0" />][3]

## The Plan

What can you adjust? Query? Content? Ranking? User Interface? You can adjust everything.

Goals? What do you want to achieve? Set targets.
  
Golden set: Create a reference set that is optimized and show that to end users. This motivates users to increase the quality – this was also part of the [IA Best Practices session][4].

### Relevancy cycle

Establish a relevancy cycle to adjust the ranking and gather feedback how that worked. Then plan what to adjust, gather feedback and improve.

### New Tools

Query Rules: reformate/transform query
  
Dynamic Ranking Rules: reorder the result ranking
  
Rank Model Tuning App: a new tool by Mikael
  
Custom Rank Model: not covered in this session – there is some [Technet articles][5] out there.

Capturing Intent: done with Query Rules.

Demo 1: add a result block
  
Demo 2: add user context / segments to query rule

## Search Query Tool v2

New functionalities where added in v2: XRANK freshness generator (new documents are ranked higher than older documents):

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Terminals 3.4.0 (Files store)_2014-03-07_17-19-23" alt="Terminals 3.4.0 (Files store)_2014-03-07_17-19-23" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-03-07_17-19-23_thumb.png" width="244" height="196" border="0" />][6]

Explain Rank feature (why is this result ranked like this)

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Terminals 3.4.0 (Files store)_2014-03-07_17-17-09" alt="Terminals 3.4.0 (Files store)_2014-03-07_17-17-09" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-03-07_17-17-09_thumb.png" width="244" height="183" border="0" />][7]

and much more. I contributed to the project – there was much more added, [go try it][8] and provide feedback!

It is a very essential tool when you do something search related – for ITPRO and DEVS.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2007" alt="IMG_2007" src="http://melcher.it/wp-content/uploads/IMG_2007_thumb.jpg" width="244" height="184" border="0" />][9]

Download is free – go grab it [here][10].

## Ranking App for O365

Mikael showed us the ranking app for O365 that was released in January – wow, good stuff. To modify the ranking in O365 you add the app to your tenant, then you need to add 11 search query and manually rank the results – than the magic happens. It autotunes the ranking set based on your feedback and this could result in a better relevancy for your users. It is O365 only so far – but there will be an on-prem version “later”. Really an interesting approach –  I would love to see that in the general search results – you don’t like your results, please down/up-vote them – that would cool.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2010" alt="IMG_2010" src="http://melcher.it/wp-content/uploads/IMG_2010_thumb.jpg" width="244" height="184" border="0" />][11][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2011" alt="IMG_2011" src="http://melcher.it/wp-content/uploads/IMG_2011_thumb.jpg" width="244" height="184" border="0" />][12]

## Summary

Search was my expectation – Search was delivered. Solid presentation, good slides – I am happy with that. Roughly 400 people attended in the very last session, there is a demand for that. Very good message they transported - very good one!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_2013" alt="IMG_2013" src="http://melcher.it/wp-content/uploads/IMG_2013_thumb.jpg" width="244" height="184" border="0" />][13]

 [1]: https://twitter.com/mikaelsvenson
 [2]: http://melcher.it/wp-content/uploads/IMG_2005.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_2002.jpg
 [4]: http://melcher.it/?p=1334
 [5]: http://msdn.microsoft.com/en-us/library/office/dn169052(v=office.15).aspx
 [6]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-03-07_17-19-23.png
 [7]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-03-07_17-17-09.png
 [8]: https://sp2013searchtool.codeplex.com/
 [9]: http://melcher.it/wp-content/uploads/IMG_2007.jpg
 [10]: https://sp2013searchtool.codeplex.com
 [11]: http://melcher.it/wp-content/uploads/IMG_2010.jpg
 [12]: http://melcher.it/wp-content/uploads/IMG_2011.jpg
 [13]: http://melcher.it/wp-content/uploads/IMG_2013.jpg

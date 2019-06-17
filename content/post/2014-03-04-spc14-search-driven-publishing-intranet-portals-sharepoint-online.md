---
title: 'SPC14: Search-driven publishing for Intranet Portals in SharePoint Online'
author: Max Melcher
aliases:
   - "/post/2014-03-04-spc14-search-driven-publishing-intranet-portals-sharepoint-online/"
2014: "03"
type: post
date: 2014-03-04T21:51:05+00:00
url: /2014/03/spc14-search-driven-publishing-intranet-portals-sharepoint-online/
yourls_shorturl:
  - http://melcher.it/s/25
categories:
  - Conference
  - Search
  - SharePoint 2013

---
Session "Search-driven publishing for Intranet Portals in SharePoint Online" by Alex Pope (Microsoft) and [Helge Grenager Solheim][1] (Microsoft).

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1749" alt="IMG_1749" src="http://melcher.it/wp-content/uploads/IMG_1749_thumb.jpg" width="244" height="184" border="0" />][2]{.thickbox}

> Search-driven publishing is alive in SharePoint Online! This includes the Content Search Web Part (CSWP) and Cross-Site Collection Publishing - both enhance the number and quality of search-driven solutions you can build into your sites and portals within Office 365. This session will provide an overview of these new building blocks, provide best practices and focus on how to optimize page load times with queries and take advantage of a new caching mechanism in the CSWP. Your sites will come alive, be dynamic and change the way you provide &#8216;fresh' content to your users.

Here are my notes.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1748" alt="IMG_1748" src="http://melcher.it/wp-content/uploads/IMG_1748_thumb.jpg" width="244" height="184" border="0" />][3]{.thickbox}

## Benefits

Benefit is that you can create dynamic pages and get independent authoring and publishing. With query builder you can decide what should be presented and with Display Templates you can adjust the presentation.

> Search scales!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1754" alt="IMG_1754" src="http://melcher.it/wp-content/uploads/IMG_1754_thumb.jpg" width="348" height="185" border="0" />][4]{.thickbox}

### Missing features

In SPO you don’t have some webparts, e.g Taxonomy Refinement - this is because they do not scale for multi-tenant environment.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1755" alt="IMG_1755" src="http://melcher.it/wp-content/uploads/IMG_1755_thumb.jpg" width="348" height="185" border="0" />][5]{.thickbox}

### Automatic property creation

Site column: crawled + managed property
  
List column: crawled property only

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1758" alt="IMG_1758" src="http://melcher.it/wp-content/uploads/IMG_1758_thumb.jpg" width="348" height="185" border="0" />][6]{.thickbox}

### Search Schema

Multiple schema but with limitations.
  
Cant change refinable, sortable properties - but you can use RefineableText00 properties to add the refiners.

## Demo

Helge showed how to adjust a content search webpart to display as a slider - and one that shows the most frequently used documents with give file types - slick and simple!

## Feature “Roadmap”

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1768" alt="IMG_1768" src="http://melcher.it/wp-content/uploads/IMG_1768_thumb.jpg" width="348" height="185" border="0" />][7]{.thickbox}

## Group Caching for CSWP

Finite Query capacity (Microsoft scaled out - over 2000 servers run the search behind SharePoint Online)

> Query is slow - solve it with a cache!

  1. Speeds up search driven intranet pages
  2. Makes complex queries fast
  3. Decreases page load time

Its a property in the settings page - you can target a group or everyone. Be aware that when you use everyone, the everyone group needs permission.
  
The cache expiry is 15 minutes!

## Display Template Best Practices

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1779" alt="IMG_1779" src="http://melcher.it/wp-content/uploads/IMG_1779_thumb.jpg" width="244" height="184" border="0" />][8]{.thickbox}

Good stuff – I am glad I recommended the same rules to my clients.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1782" alt="IMG_1782" src="http://melcher.it/wp-content/uploads/IMG_1782_thumb.jpg" width="244" height="184" border="0" />][9]{.thickbox}

## Content by Search or Content by Query

That’s a good question – but for me as a Search guy this was crystal clear before: Search is the way to go.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1783" alt="IMG_1783" src="http://melcher.it/wp-content/uploads/IMG_1783_thumb.jpg" width="348" height="185" border="0" />][10]{.thickbox}

## Summary

Very decent session – I am not into SharePoint Online that much, but Helge and “the Pope” Alex did a good show, summarized what is possible and if not they explained why. In the end it was very interesting for me – the caching possibilities is an indicator what will be available on-prem “later”, but is additional transparency for me. The Best Practices for Search was even greater – there are to few guides out there yet.

 [1]: https://twitter.com/helgesolheim
 [2]: http://melcher.it/wp-content/uploads/IMG_1749.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1748.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1754.jpg
 [5]: http://melcher.it/wp-content/uploads/IMG_1755.jpg
 [6]: http://melcher.it/wp-content/uploads/IMG_1758.jpg
 [7]: http://melcher.it/wp-content/uploads/IMG_1768.jpg
 [8]: http://melcher.it/wp-content/uploads/IMG_1779.jpg
 [9]: http://melcher.it/wp-content/uploads/IMG_1782.jpg
 [10]: http://melcher.it/wp-content/uploads/IMG_1783.jpg

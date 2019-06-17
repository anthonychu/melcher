---
title: 'He’s dead, Jim: SharePoint 2013 Search Troubleshooting'
author: Max Melcher
aliases:
   - "/post/2014-10-13-hes-dead-jim-sharepoint-2013-search-troubleshooting/"
2014: "10"
type: post
date: 2014-10-13T09:03:32+00:00
url: /2014/10/hes-dead-jim-sharepoint-2013-search-troubleshooting/
yourls_shorturl:
  - http://melcher.it/s/3k
categories:
  - Search
  - SharePoint 2013

---
Recently we had some strange search issues in our very own intranet and its time to blog about some SharePoint 2013 Search Troubleshooting.

At first I noticed that our Search results were quite old, usually that is not the case because we enabled continuous crawling and I was surprised that it worked that well. How I noticed? I have tiny app that utilized search and supports our core business process: billing. But it suddenly stopped finding new items.

## Issue 1: Broken web.config on our search server

As mentioned above I noticed that new items in our SharePoint Environment did not show up - you can quickly confirm that when you go to your search center and search for *****. Then check the Last Modified Refiner and as you can see below: we had a problem.

<div style="width: 211px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image34.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Last Modified refiner - with zero results for today" src="http://melcher.it/wp-content/uploads/image_thumb34.png" alt="image" width="201" height="188" border="0" /></a>
  
  <p class="wp-caption-text">
    Last Modified refiner - with zero results for today
  </p>
</div>

But once you identified the problem you can tackle it. In this case I told our internal IT that there is something wrong, we checked the crawl log: **~560.000 errors**.

That this was not monitored is a different story - but the error I saw that was quite familiar: “Search error: crawler could not connect to the repository”. That means either the SharePoint is not running, there is a firewall in between - or as in our case it returned HTTP 500 errors for every request. I could easily confirm that by opening a browser on the SharePoint crawler itself and open the target site. I looked at our IT admin: “Did you change something?” -  he: “We deployed a feature and that did not work out that well…” - me: “Did you remove it everywhere except the search crawler?” - he nodded. The in this case broken web.config was quickly restored - started a full crawl to get rid of the many errors and we should be fine, right? Right?!!

## Issue 2: Cannot plan query for index system

Because full crawls tend to take quite a while - even with like 100 dp/s - I checked the search results the next morning:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Search.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="That did not work - every search query resulted in that error. The important part is the correlation ID" src="http://melcher.it/wp-content/uploads/Search_thumb.png" alt="Search" width="244" height="88" border="0" /></a>
  
  <p class="wp-caption-text">
    That did not work - every search query resulted in that error. The important part is the correlation ID
  </p>
</div>

Ouch - what happened? I right away called our admin: “What did you do?” - he said  “I just changed the password of the farm account via central admin like I did several times” - mhh, that should work, nothing to blame here. So I asked him to send me the uls logs and some screens of the SharePoint Search Service Application:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image35.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Full crawl seems to work - a bit slower than it should tho" src="http://melcher.it/wp-content/uploads/image_thumb35.png" alt="image" width="244" height="107" border="0" /></a>
  
  <p class="wp-caption-text">
    Full crawl seems to work - a bit slower than it should tho
  </p>
</div>

Crawl logs do not look too suspiciously.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image36.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Event log #1" src="http://melcher.it/wp-content/uploads/image_thumb36.png" alt="image" width="244" height="99" border="0" /></a>
  
  <p class="wp-caption-text">
    Event log #1
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image37.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Huston - we have a problem!" src="http://melcher.it/wp-content/uploads/image_thumb37.png" alt="image" width="244" height="112" border="0" /></a>
  
  <p class="wp-caption-text">
    Huston - we have a problem!
  </p>
</div>

Event log - useful as ever to identify that you have a problem but sometimes it does not help you identify what problem you have… so I was keen to see the ULS entry for the correlation ID I saw during the search - so I got it:

> SearchServiceApplication::Execute-Exception: Microsoft.SharePoint.SPException: Tried IMS endpoints for operation Execute: Cannot plan query for index system SP2f28f6df0f54. **Index fragment &#8216;1' has no available cells. Cell statuses: [Cell I.0.1 on node IndexComponent3: Cell status is set to &#8216;not available' (cell out of sync or seeding)]** at Microsoft.Office.Server.Search.Query.Ims.LoadBalancer.RoundRobinLoadBalancerContext.NextEndpoint(String operationName, String failMessage) at Microsoft.Office.Server.Search.Administration.SearchServiceApplication._ImsQueryInternalType.DoSpLoadBalancedImsOp\[T\](ImsBackedOperation\`1 imsCall, Int32 timeoutInMilliseconds, Int32 wcfTimeoutInMilliseconds, String operationName) at Microsoft.Office.Server.Search.Administration.SearchServiceApplication&#8230;. fe0fc09c-8c99-b017-25c9-d3feac78a369

That sounds not that healthy, especially the **Cell status is set to &#8216;not available' (cell out of sync or seeding)**. The index is made out of cells - if they are not there, Search is very unhappy. I can only conclude that changing the password during a full crawl is a **bad idea**.

So we first tried to restart the SharePoint Search Service - no result.
  
We restarted the entire box - no result.

So we heavy-heartedly did an **index reset** and the search results immediately came back - **empty but working again**. But trust me, resetting the index during a workday, with many search-driven applications around is not the greatest experience you can have - and you shouldn’t. There is room for improvement in our intranet, do you agree?

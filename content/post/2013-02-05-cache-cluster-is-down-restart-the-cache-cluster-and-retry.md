---
title: Cache cluster is down, restart the cache cluster and Retry
author: Max Melcher
aliases:
   - "/post/2013-02-05-cache-cluster-is-down-restart-the-cache-cluster-and-retry/"
2013: "02"
type: post
date: 2013-02-05T08:16:24+00:00
url: /2013/02/cache-cluster-is-down-restart-the-cache-cluster-and-retry/
yourls_shorturl:
  - http://melcher.it/s/s
categories:
  - SharePoint 2013

---
Had a small issue with my SharePoint 2013 MySite today, I could not update a User Profile in Central Admin – this is what I got from the ULS Log:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sp2013_cachecluster.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="sp2013_cachecluster" alt="sp2013_cachecluster" src="http://melcher.it/wp-content/uploads/sp2013_cachecluster_thumb.png" width="244" height="224" border="0" /></a>
  
  <p class="wp-caption-text">
    ULSViewer: The exception is pointing us in the right direction.
  </p>
</div>

> The Execute method of job definition Microsoft.Office.Server.UserProfiles.LMTRepopulationJob (ID 104963a2-b53c-4476-bc23-fa7d6453e42f) threw an exception. More information is included below.  Unexpected exception in FeedCacheService.IsRepopulationNeeded: Cache cluster is down, restart the cache cluster and Retry.

At least the error message pointed me to the right direction, the Cache Cluster is new in SharePoint 2013 and I associated it with the app fabric distributed cache. As I first read it it sounded like "The King is dead - long live the King!" - but maybe I watch to many movies&#8230;

## Solution

Restart the app fabric service and wait a couple of second with a line of powershell:

<pre lang="powershell">Restart-Service AppFabricCachingService


</pre>

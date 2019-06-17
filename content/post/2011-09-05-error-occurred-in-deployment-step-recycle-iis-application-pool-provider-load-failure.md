---
title: 'Error occurred in deployment step ‘Recycle IIS Application Pool’: Provider load failure'
author: Max Melcher
aliases:
   - "/post/2011-09-05-error-occurred-in-deployment-step-recycle-iis-application-pool-provider-load-failure/"
2011: "09"
type: post
date: 2011-09-05T20:59:55+00:00
url: /2011/09/error-occurred-in-deployment-step-recycle-iis-application-pool-provider-load-failure/
yourls_shorturl:
  - http://melcher.it/s/b
categories:
  - SharePoint 2007
  - SharePoint 2010

---
Try the following:

  1. Restart Windows Management Instrumentation service.
  2. Restart Visual Studio
  3. iisreset

<div>
  Hopefully it helps - usually it does for me.
</div>

---
title: My Links in SharePoint 2013
author: Max Melcher
aliases:
   - "/post/2013-01-04-my-links-in-sharepoint-2013/"
2013: "01"
type: post
date: 2013-01-04T16:30:15+00:00
url: /2013/01/my-links-in-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/g
categories:
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013

---
the My Links “vanished” in SharePoint 2010 – they were no longer visible. The Problem: Some clients heavily utilize those server-side favorites.

## SharePoint 2010

The links are stored in the Database and the controls to manage the favorites and the page for that is there. Luckily the migration from SP2007 to SP2010 migrated the links, too. Just the control in the ribbon was missing – but there is a [very good codeplex solution][1] for that.

## SharePoint 2013

In case you are wondering if you could use the links in SharePoint 2013 – the page to manage the links is still there:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image4.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="SharePoint 2013 - Manage &quot;My Links&quot; page" alt="SharePoint 2013 - Manage &quot;My Links&quot; page" src="http://melcher.it/wp-content/uploads/image_thumb4.png" width="244" height="177" border="0" /></a>
  
  <p class="wp-caption-text">
    SharePoint 2013 - Manage "My Links" page
  </p>
</div>

One question is open: Are the links migrated from SP2010 to SP2013? I have not tried it yet but I will update this post as soon as I can confirm it.

 [1]: http://mylinks.codeplex.com/

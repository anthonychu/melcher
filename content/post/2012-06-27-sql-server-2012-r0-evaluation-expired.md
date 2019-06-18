---
title: SQL Server 2012 R0 Evaluation expired
author: Max Melcher
aliases:
   - "/post/2012-06-27-sql-server-2012-r0-evaluation-expired/"
2012: "06"
type: post
date: 2012-06-27T17:17:32+00:00
url: /2012/06/sql-server-2012-r0-evaluation-expired/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/u
categories:
  - ITPro
  - SharePoint 2010
  - SQL Server 2012

---
Yesterday was the 180th day without problems on my DEV/DEMO environment – until my eval expired without noticeable warning ahead. The whole thing just locked down and of course my SharePoint doesn’t like that:

[<img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border: 0px;" title="cannot-connect-to-config-db-error" src="http://melcher.it/wp-content/uploads/cannot-connect-to-config-db-error_thumb.jpg" alt="cannot-connect-to-config-db-error" width="244" height="108" border="0" />][1]

Great, just great.

Because Alegri is a Microsoft Partner, we do have valid SQL Server 2012 codes – so I asked for one, received one and tried to upgrade my license from EVAL to ENTERPRISE. So I started the installer of R0, clicked on the “change license” link entered the code – everthing ran green. Still Management Studio complains that my version is expired and the SQL Server Service wont start… so I tried to upgrade to SQL Server 2012 RTM – started the upgrade thing in the RTM installer. After checking a lot of stuff it complained that it can't connect to the SQL Server instance. For sure it can't because I can’ start it.

## How I fixed it - or making it work again

  1. Backup your data folder (just to be safe)
  2. Uninstall  R0 – just search for R0 in the Installed Software list
  3. Install SQL Server 2012 RTM 
      1. Take care that you create the same instance
  4. Stop the new instance
  5. Copy back the whole data directory
  6. Check if everything works again

At first tried to attach all Databases back to the instance  - but – I would have lost all permissions on the Master node and receive a “Can not connect to SharePoint configuration database”.

All works smoothly again – no more time bombs in my environment more. If you don't have a license, sorry, can't help you.

## Lessons learned

Upgrade even faster to the new versions or wait till RTM.

## But: SQL Server 2012 is great - what you think?

 [1]: http://melcher.it/wp-content/uploads/cannot-connect-to-config-db-error.jpg

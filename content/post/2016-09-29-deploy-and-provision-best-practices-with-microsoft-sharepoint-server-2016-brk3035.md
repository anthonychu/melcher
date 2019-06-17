---
title: 'Deploy and provision best practices with Microsoft SharePoint Server 2016 #BRK3035'
author: Max Melcher
aliases:
   - "/post/2016-09-29-deploy-and-provision-best-practices-with-microsoft-sharepoint-server-2016-brk3035/"
2016: "09"
type: post
date: 2016-09-29T17:49:27+00:00
url: /2016/09/deploy-and-provision-best-practices-with-microsoft-sharepoint-server-2016-brk3035/
categories:
  - Ignite 2016
  - SharePoint 2016

---
> Microsoft SharePoint Server 2016 provides a new suite of IT capabilities to drive improvements in both scale and resiliency. Learn the best practices to deploying and provisioning SharePoint Server 2016 with these capabilities in mind.

A session with <a href="https://twitter.com/@toddklindt" target="_blank">Todd Klindt (@toddklindt)</a> and <a href="https://twitter.com/@sharepointlhorn" target="_blank">Jason Himmelstein (@sharepointlhorn)</a> – this will be super good!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_12_48_47_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_12_48_47_Rich_thumb.jpg" alt="WP_20160929_12_48_47_Rich" width="244" height="139" border="0" />][1]

Here are my notes:

### MinRole

MinRole rocks and its actually self-healing, can be installed on 1 server (plus sql). Minimum MinRole multi-server farm requires 4, with high availability its 8. Thats a lot of (virtual) metal…

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_12_57_34_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_12_57_34_Rich_thumb.jpg" alt="WP_20160929_12_57_34_Rich" width="244" height="139" border="0" />][2]

HA and Distributed Cache: do a graceful shutdown, thats per-se no HA.

There is a big change in <a href="https://blogs.office.com/2016/09/26/announcing-feature-pack-1-for-sharepoint-server-2016-cloud-born-and-future-proof/" target="_blank">Feature Pack 1</a> to support smaller environments because that has been requested so many times – good stuff!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_13_09_28_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_13_09_28_Rich_thumb.jpg" alt="WP_20160929_13_09_28_Rich" width="244" height="138" border="0" />][3]

So once the feature pack is out you can combine services and do front-end and distributed cache on one server, and application and search.

### Cloud SSA / hybrid search

> Indexing is the stuff when the monkey bangs the coconut on the ground to check whats inside (Todd Klindt)

Man, I will steal that quote.

Once you use it, you dont have to have a bigger topology – index is in the cloud – and enables you to externalize onPrem data repositories.

Test it on a test environment, setting up cloud search could have impact on provider hosted apps.

### SQL Server Performance

Pre-Grow, Auto-Grow, Instant File Instantiation – all the stuff that speeds up your databases/sql – speeds up your SharePoint.

### Load testing

Measure before you scale!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_13_35_52_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_13_35_52_Rich_thumb.jpg" alt="WP_20160929_13_35_52_Rich" width="244" height="138" border="0" />][4]

Jason told a customer case, were they improved the wrong metrics (custom code, sql performance) to then later on identify that the bottleneck was the CPU. Now they rerun the performance test and compare them with the previous baseline. There is a <a href="https://channel9.msdn.com/Events/SharePoint-Conference/2014/SPC381" target="_blank">recording how to setup loadtesting from SPC 2014.</a>

## Summary

High expectations, high quality session – Todd and Jason are always a great combo and do great infotainment!

Go watch the session once its available!

 [1]: https://melcher.it/wp-content/uploads/WP_20160929_12_48_47_Rich.jpg
 [2]: https://melcher.it/wp-content/uploads/WP_20160929_12_57_34_Rich.jpg
 [3]: https://melcher.it/wp-content/uploads/WP_20160929_13_09_28_Rich.jpg
 [4]: https://melcher.it/wp-content/uploads/WP_20160929_13_35_52_Rich.jpg

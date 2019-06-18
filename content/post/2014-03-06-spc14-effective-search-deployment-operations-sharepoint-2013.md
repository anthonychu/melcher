---
title: 'SPC14: Effective Search deployment and operations in SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2014-03-06-spc14-effective-search-deployment-operations-sharepoint-2013/"
2014: "03"
type: post
date: 2014-03-06T18:42:56+00:00
url: /2014/03/spc14-effective-search-deployment-operations-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/2e
categories:
  - Conference
  - ITPro
  - Search
  - SharePoint 2013

---
> SharePoint 2013 introduces a new and highly flexible search topology. This gives more flexibility on how to scale a system, and allows search to tackle demanding requirements for query and indexing performance. In this session we will take you through the deployment of a multi-node search installation, provide best practices for common operational procedures, and give you tips and tricks on how to keep your search system healthy.

My session notes for “Effective Search deployment and operations in SharePoint 2013” by [Kristopher Loranger][1] and Mert Sangar at SharePoint Conference 2014 in Las Vegas:

# Search Architecture

Mert showed a comparison how the architecture of search changed from SharePoint 2010 and FAST Search for SharePoint to SharePoint 2013 – good overview.

> Bug: October CU 2013 has an issue that when you have a very long Search Service Application name – things break.

### High Availability

Search is FAST Search now – they implemented the high availability concept of FAST.

### Set up your initial search topology

Best to do it in PowerShell – I have a sample script [here][2], there is a better one on [MSDN][3] by Brian Pendergrass.

> Its not supported that you change the index location after provisioning,

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1943" alt="IMG_1943" src="http://melcher.it/wp-content/uploads/IMG_1943_thumb.jpg" width="348" height="185" border="0" />][4]

I need to clarify that quote – I thought it is supported when you migrate to a new topology where the index is in the new location.

During a repartitioning the search query application is paused, no search results during that time – and I experienced it can take very long!

Recommendation: symmetric index layout.

### Demo: Setup up multi-node deployment

Kristopher showed the script in action – nice

### Deployment Options for Large Enterprise

  1. Central Search Farm: better relevancy, lower maintaining costs, better end-user experience
  2. Distributed: Search index on each farm, federated results as result blocks
  3. Hybrid: On-prem and O365 – federation, stepwise migration of the cloud

### Keep your Search Topology Healthy

Search Diagnostics are available through the UI or with PowerShell (Get-SPEnterpriseSearchStatus) – there is a [helper script][5] that renders the results nicely.

Search Reports: Performance, Zero-Result queries, etc.

Monitoring: SCOM and ULS

The yellow state in the UI means its degraded and (might) recover, red means hardware or configuration problems. Use powershell cmdlet to get more information.

Kristopher showed some nice tricks how to get insights out of the many search reports – need to rewatch the video afterwards to internalized this for me.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1949" alt="IMG_1949" src="http://melcher.it/wp-content/uploads/IMG_1949_thumb.jpg" width="348" height="185" border="0" />][6][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1950" alt="IMG_1950" src="http://melcher.it/wp-content/uploads/IMG_1950_thumb.jpg" width="348" height="185" border="0" />][7]

### Daily/Weekly tasks

Admins: check search topology, monitor performance, health, # documents per partition
  
Business users: create best bets and query rules, check zero results and abandoned query.

## Patch and updates

Its recommended to install March PU and at least October 2013 CU. Many changes that regarding to scale.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1955" alt="IMG_1955" src="http://melcher.it/wp-content/uploads/IMG_1955_thumb.jpg" width="348" height="185" border="0" />][8]

## High Availability

Kristopher showed the concepts behind search high availability (great stuff) and how to replace a failed node in a search installation. Apparently the demo failed, but they prepared a video so all was good.

## Summary

Most of the stuff I knew already – but the devil is in the detail, right? Kristopher and Mert did a nice presentation, very valuable presentation to me! Q&A afterwards was great, too.

 [1]: http://blogs.msdn.com/b/kristopherloranger/
 [2]: http://melcher.it/s/c
 [3]: http://blogs.msdn.com/b/sharepoint_strategery/archive/2012/08/24/deploy-sharepoint-2013-ssa-across-multiple-servers-using-powershell.aspx
 [4]: http://melcher.it/wp-content/uploads/IMG_1943.jpg
 [5]: http://blogs.msdn.com/b/knutbran/archive/2012/11/30/how-to-view-the-status-of-the-sharepoint-2013-search-service.aspx
 [6]: http://melcher.it/wp-content/uploads/IMG_1949.jpg
 [7]: http://melcher.it/wp-content/uploads/IMG_1950.jpg
 [8]: http://melcher.it/wp-content/uploads/IMG_1955.jpg

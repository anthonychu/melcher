---
title: 'SPC14: Best practices for Hybrid Search deployments'
author: Max Melcher
aliases:
   - "/post/2014-03-05-spc14-best-practices-hybrid-search-deployments/"
2014: "03"
type: post
date: 2014-03-05T01:33:04+00:00
url: /2014/03/spc14-best-practices-hybrid-search-deployments/
yourls_shorturl:
  - http://melcher.it/s/27
categories:
  - Conference
  - Hybrid
  - ITPro
  - Office 365
  - Search
  - SharePoint 2013

---
SharePoint Conference 2014 Session "Best practices for Hybrid Search deployments" by Brent Groom and Norm Lambert.

> Are your customers interested in trying out Office365, but still keeping most of their collaboration assets and data on-premises? Are they asking you to provide a single way to find content regardless of where it lives? This session will arm you with the information necessary to help your customers plan Hybrid deployments – connecting SharePoint 2013 on-premises with Office365 – and enabling a comprehensive Search experience that spans the two. You’ll learn about Search in SharePoint 2013 capabilities in O365, as well as new out-of-box hybrid capabilities that make this scenario much easier to enable then before.

Here are my notes:

## Reason for Hybrid

  * Cheaper, more reliable infrastructure
  * Use of new O365 features
  * On-Prem because of regulatory requirements
  * Privacy/Legal reasons to store content in the originating country.

## Challenges

  * Contents distributed on-prem, cloud or both
  * Different user interfaces
  * Different domains – where is my content?
  * Multiple search center

## How can hybrid help?

One Enterprise Search Center that shows the results of content sitting on O365 in a result container.

## Options

You can configure hybrid search with three different setups. One-way inbound (O365 can fetch search results from on-prem, but requires reverse proxy server) or One-way outbound (on-prem fetches search results from O365)– or the best but most complex option two-way binding.

### Search verticals

You can add verticals that present search results and make it look like the results are fetched from the local search service – that’s the current Microsoft implementation.

### Microsoft Search Center

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="IMG_1798" alt="IMG_1798" src="http://melcher.it/wp-content/uploads/IMG_1798_thumb.jpg" width="244" height="184" border="0" />][1][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="IMG_1800" alt="IMG_1800" src="http://melcher.it/wp-content/uploads/IMG_1800_thumb.jpg" width="244" height="184" border="0" />][2]

Interesting to see what they implemented – I saw a feedback option for on-prem but not on the O365 version. The refiners where adjusted for some results, but I saw no custom Display Templates. Refiner Count was enabled for on-prem but not O365. The on-prem has a glossary search, too. For a “cloud-first” strategy they had pretty few features for their cloud search center, just saying.

## Performance Best Practices

Latency, DB Server, 1:*, Security.

Rule of thumb: Redirect your users to the place where the content is. Content in the cloud –> Search Center in the cloud.

Best Bets are queried from the Database – if you have many it can impact your DB Performance.

1:* means that when you do a query, a query rule can trigger other search queries for result containers – instead of doing one query you do multiple queries and that needs performance.

## Infrastructure Best Practice

Reverse Proxy: F5, Citrix, Juniper provide options. Microsoft offers Server 2012 R2 with Web Application Proxy (**recommended**). TMG would be second option but no longer actively developed.

## Security Best Practices

STS; Dir Sync + password syn, SSL, Login options, VPN or Direct Access

## Content Best Practices

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1805" alt="IMG_1805" src="http://melcher.it/wp-content/uploads/IMG_1805_thumb.jpg" width="348" height="185" border="0" />][3]

## Future of Search

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1808" alt="IMG_1808" src="http://melcher.it/wp-content/uploads/IMG_1808_thumb.jpg" width="348" height="185" border="0" />][4]

This slide lists all pain-points – the last bullet is the most important thing – but as usual no ETA when we can use it.

## Summary

The session was informative – but honestly I am not happy with the options they presented. Hybrid means for me that the user is not aware where the content is and maybe does not notice that something is on-prem or in the cloud. OWA Preview anyone? Following documents?

It was really nice to see how Microsoft adjusted their on-prem search Center – good insight!

 [1]: http://melcher.it/wp-content/uploads/IMG_1798.jpg
 [2]: http://melcher.it/wp-content/uploads/IMG_1800.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1805.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1808.jpg

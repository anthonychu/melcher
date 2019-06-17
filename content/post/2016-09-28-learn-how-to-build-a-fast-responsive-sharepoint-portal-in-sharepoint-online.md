---
title: Learn how to build a fast, responsive SharePoint portal in SharePoint Online
author: Max Melcher
aliases:
   - "/post/2016-09-28-learn-how-to-build-a-fast-responsive-sharepoint-portal-in-sharepoint-online/"
2016: "09"
type: post
date: 2016-09-28T03:09:29+00:00
url: /2016/09/learn-how-to-build-a-fast-responsive-sharepoint-portal-in-sharepoint-online/
yourls_fetching:
  - "1"
categories:
  - Ignite 2016
  - SharePoint 2016

---
Performance is key, who does not hate slow pages? In this session by Russ More and John Fan we will learn how to speed up SharePoint Online pages to build faster portals.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160927_15_52_24_Rich" src="https://melcher.it/wp-content/uploads/WP_20160927_15_52_24_Rich_thumb.jpg" alt="WP_20160927_15_52_24_Rich" width="244" height="139" border="0" />][1]

Here are my notes:

## Measure, Measure, Measure!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160927_16_02_13_Rich" src="https://melcher.it/wp-content/uploads/WP_20160927_16_02_13_Rich_thumb.jpg" alt="WP_20160927_16_02_13_Rich" width="244" height="139" border="0" />][2]

> You get what you measure!

Microsoft measures a lot of metrics internally and even compare them to competitors – they monitor their own dogfood service (fast ring) to see if there are regressions.

Nice fact: Average page in SharePoint loads in 3 seconds. I expected it to be much higher actually.

Personal note: If you want super easy measuring, try Azure Application Insights - I used it in several projects now and it really gives you great insights what people are using and where you are facing problems that must be improved.

## Improve

Entry point with a lot of tips is: <http://aka.ms/tune>

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160927_16_24_41_Rich" src="https://melcher.it/wp-content/uploads/WP_20160927_16_24_41_Rich_thumb.jpg" alt="WP_20160927_16_24_41_Rich" width="244" height="139" border="0" />][3]

Most of the performance issues are not server but client related - it just takes to long to deliver all content to the client so it can render the entire page. Lots of requests, large files, unminified js/css and usage of inline scripts and styles. The old http/1.1 protocol, or as John called it "waterfall requests" is part of the problem because the requests are not handled in parallel.

Lots of request? Minify and reduce, use CDNs – and use http/2 to bundle request. There is a nice test page to visualize the difference between http/1.1 and http/2:  [https://http2.golang.org/gophertiles][4]

Using CDNs in an online scenario like SharePoint Online is of course much easier.

## SharePoint Framework SPFx

SharePoint Framework kinda evolved out of those problems (or at least inspired the solution), client-side only rendering with performance in mind.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160927_16_48_51_Rich" src="https://melcher.it/wp-content/uploads/WP_20160927_16_48_51_Rich_thumb.jpg" alt="WP_20160927_16_48_51_Rich" width="244" height="139" border="0" />][5]

I will definitely attend one or two deep dive sessions about this.

## Summary

Phew, lots of input. Interesting facts and hints from John and Russ!

Need to fiddle with CDNs in one of my client projects with SharePoint Online where the pages are loading REALLY slow and see if the things can be improved/measured with the methods that haven been shown.

 [1]: https://melcher.it/wp-content/uploads/WP_20160927_15_52_24_Rich.jpg
 [2]: https://melcher.it/wp-content/uploads/WP_20160927_16_02_13_Rich.jpg
 [3]: https://melcher.it/wp-content/uploads/WP_20160927_16_24_41_Rich.jpg
 [4]: https://http2.golang.org/gophertiles "https://http2.golang.org/gophertiles"
 [5]: https://melcher.it/wp-content/uploads/WP_20160927_16_48_51_Rich.jpg

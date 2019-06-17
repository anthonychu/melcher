---
title: 'TechEd 2012 (#TEE12), Amsterdam – Day 3'
author: Max Melcher
aliases:
   - "/post/2012-06-28-teched-2012-tee12-amsterdam-day-3/"
2012: "06"
type: post
date: 2012-06-28T09:08:55+00:00
url: /2012/06/teched-2012-tee12-amsterdam-day-3/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/t
categories:
  - ITPro
  - SharePoint 2010
  - TechEd 2012

---
Third day at TechEd, not getting more sleep here but coffee keeps us going!

The delegate party was in the AJAX Amsterdam soccer arena – private public viewing style.

## First Session: Best Practices for Building Your Website for Scale with Microsoft SharePoint 2012 (Spencer Harbar, @harbars)

At first I thought “Why isnt he talking about User Profiles, Sync or something – he is Mr. UserProfiles for me.

Key messages:

Capacity Planning, Architect Scale, Pilot & Test, Deploy, Monitor & Validate, and repeat.

Output caching increases the Throughput massively – goal is between 80% and 90%.

#### Common bottlenecks:

Web front-end: CPU, Memory, Disk I/O, Disk space

App servers: Disk I/O, Memory, CPU

Database servers: DB locks, Disk I/O, CPU, Memory, Disk space

#### Caches:

Web server memory: Output cache (compiled pages), Object cache (SPQuery)

Web server disk: BLOB cache

See if Site Collection Output Cache is working: Site Collection settings => Enable debug cache information on pages (then check html source after page rendering, there should be comment <!--—rendered using cache profile…. –-->) – Gotcha is that Developer dashboard is not longer working because that guy is cache too.

Monitor the cache trimming, if there is a lot scale up the web frontend servers (=> more memory or make the items stay longer in the cache).

If Web frontend CPU is utilized for more than 80% the response time is impacted (Spence’s example was 7 times slower with CPU above 80%).

ASP.Net Post-Cache substitution (partially cached pages)

That was surprising: SPList.GetItems(SPQuery) is not cached – you have to cache it yourself. Same is SharePoint client object model.

Blob cache: Store on separate drive, increase size and lifetime if possible

CDN: If the site is internet facing load jquery and modernizr from big CDNs.

IIS Compression: STRONGLY recommendation to enable static compression. Consider dynamic compressions.

Content Deployment: Dont use it for high availability, Site relaunch/redesign, schedule the load from write operations – its not made for that.

Content Deployment Best Practices:

  1. Content Deployment + SQL Server Enterprise. Central Administration: Tick the box to use sql snapshots
  2. Custom solution must be “aware” of Content Deployment

Variations – Best Practices at Scale

  1. Avoid “Multilingual Afterthought Syndrom – what a name. 
      1. Set up Variations early on, otherwise you have to copy a lot
  2. Consider On-Demand Page Propagation

## TechEd Expo

Needed a pause and took the time to discover the different booths. Very interesting products (even useful ones) arround, some I will try. Had a great discussion at the Microsoft booth, could ask a lot of questions (and I got them answered, awesome!). One thing I wanted to know is if you could run Hyper V on a Windows 8 non-Server version – you can with Hyper V Client. Thats good new for me, bad news for VMWare Workstation.

Despite the fact there are not that much SharePoint sessions here, the coverage of SharePoint experts (MVPs, SharePoint Master and even SharePoint Architects) is quite high (to name some: Spencer Harbar, Todd Klindt, John Ross, Randy Drisgill, Steve Fox, Paul Stubbs, Radi Atanassov, …) – had a great discussion about SignalR, FAST Search, SharePoint Ignite for vNext,  **SharePoint vNext beta** (they told me exactly nothing…). To sum it up: I had fun.

## Second Session: Building HTTP Services with ASP.NET Web API (Sayed Hashimi)

Best reason to use Web API: Interoperability (use on phones, browsers, clients, … ) and SCALE.

Sayed’s demo was pretty slick, he used knockoutJS to visualize and bind the data. As benefit of the service you get content-negotiation (xml or json or whatever if the client requests it without overhead) and odata support: filter and query without implementing them, neat! Just mark methods returning entities with [Queryable] and return IQueryable objects. I literally can see this in SharePoint WebServices in SharePoint ‘15 – this will rock. You need .net 4 for it, so no out-of-the-box benefits for SP2010.

And finally there will be an API Explorer for that – will be a nuget package, cool.

## Third Session: Creating Robust, Maintainable Coded UI Tests with Visual Studio 2012 (Brian Keller)

I hoped we see the demo recorded from the new IE, but Brian choose to show a small wpf app. No big deal, I hope the functionality is comparable. A lot of new features added to coded UI tests, seems like its usable in VS 2012 – I tried it in VS2010 but it was too slow and cumbersome to invest time. I'll retry it with VS2012, looks straightforward.

If your test fails you can see screenshots why the test failed or even record them during your test.

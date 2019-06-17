---
title: Missing FAST Search Center Template
author: Max Melcher
aliases:
   - "/post/2012-04-26-missing-fast-search-center-template/"
2012: "04"
type: post
date: 2012-04-26T09:40:30+00:00
url: /2012/04/missing-fast-search-center-template/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/x
categories:
  - FAST for SharePoint
  - SharePoint 2010

---
Ever wondered where the FAST Search Center Template is and why the hack its not there when you create a new site?

Start this little powershell and you can create it:

<pre lang="csharp">$site = Get-SPSite -Identity http://sp2010.demo.com/sites/demo
$site.Features.Add("5EAC763D-FBF5-4d6f-A76B-EDED7DD7B0A5")</pre>

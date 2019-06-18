---
title: 'Teched 2013: Microsoft SQL Server 2014 In-Memory OLTP: Overview'
author: Max Melcher
aliases:
   - "/post/2013-06-25-teched-2013-microsoft-sql-server-2014-in-memory-oltp-overview/"
2013: "06"
type: post
date: 2013-06-25T12:21:31+00:00
url: /2013/06/teched-2013-microsoft-sql-server-2014-in-memory-oltp-overview/
yourls_shorturl:
  - http://melcher.it/s/R
categories:
  - TechEd

---
In-Memory is the big new thing - here are my notes from the session!

<!--more-->

Session by Jos de Bruijn, get the slides here: [http://melcher.it/s/O][1]

> Myth: In Memory OLTP is like DBCC PINTABLE

Wrong, new design from the ground up.

Hot tables have to fit into Memory – I guess we SharePoint Guys need even more RAM now. This will greatly improve the performance.

> Myth: In-Memory Databases are a separate product.

Wrong, fully integrated into SQL Server 2014.

> Myth: You can use In-Memory without any changes.

Wrong, if you want the full potential, you have to adjust, e.g. the schema.

> Myth: Since data is in memory – I will loose it after a server crash.

Wrong, data is persisted.

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="Jos showing that stored procedures are 11x faster now" alt="Jos showing that stored procedures are 11x faster now" src="http://melcher.it/wp-content/uploads/2013-06-25T14-15-20_0_thumb.jpg" width="244" height="184" border="0" />][2]

## Interesting Question

> Will SharePoint 2013 profits from In-Memory technology, yet?

Answer from Jos: I don't know, yet.

## My Evaluation

Techy session – Jos showed a lot of low-level stuff, I like that. More information does not hurt and maybe helps. Fixing the myths with the In-Memory stuff is appreciated, too – one client told me a myth, I can clarify this now!

It’s definitive worth following this new technology. I will download the bits and do some tests with SharePoint 2013, thats for sure!

 [1]: http://melcher.it/s/O "http://melcher.it/s/O"
 [2]: http://melcher.it/wp-content/uploads/2013-06-25T14-15-20_0.jpg

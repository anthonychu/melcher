---
title: 'TechEd 2013: Microsoft SharePoint 2013 Administration'
author: Max Melcher
aliases:
   - "/post/2013-06-27-teched-2013-microsoft-sharepoint-2013-administration/"
2013: "06"
type: post
date: 2013-06-27T16:11:22+00:00
url: /2013/06/teched-2013-microsoft-sharepoint-2013-administration/
yourls_shorturl:
  - http://melcher.it/s/11
categories:
  - ITPro
  - TechEd

---
[Corey Burke][1] ([@cburke007][2]) and Todd Klindt ([@toddklindt][3])– Entertaining SharePoint Administration

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb20.png" width="244" height="139" border="0" />][4]{.thickbox}

> In this session, we cover what's new in SharePoint 2013. First, we cover installing SharePoint 2013 and configuring your new farm. This session provides what to need to start planning your new SharePoint 2013 farm and dovetails nicely into Part 2, which covers changes in SharePoint 2013 the SharePoint administrator should know about. We cover changes to how you’ll plan your farm topology. We also cover the changes to the Search service application and how that impacts scale. Finally, we spend some time talking about everyone’s favorite part of SharePoint Server, the User Profile Service.

That’s quite a lot for one session – but Todd is a fast speaker. The session also includes cheap jokes about SharePoint Developers, guaranteed!

So here are my session notes:

<!--more-->

## Performance – Performance – Performance!

Performance come from SQL server, so implement the best practices. Don’t be cheap on hardware!

I love to [quote][5] this one:

> The cost of overinvestment in hardware is almost always far less than the cumulative expenses related to troubleshooting problems caused by under sizing.

Virtualization is more common nowadays, but its tough to virtualize SQL Server / SharePoint – the good thing, there is a [webcast][6] about how to set things up correctly. Note: I will attend to that session tomorrow.

Access Service creates a lot of databases, Todd’s recommendation is to provision this service to a different SQL Server instance. I think that’s a good one.

User Profile Service has not changed that much in SharePoint 2013 – is it FIM RC under the hood again? If there is a question concerning User Profiles, I always check [Spence Harbar’s blog][7] – if someone figured it out, its him.

## Architecture

Web Frontend, Application Server, Database Server – the first two tiers are flexible enabled/disabled via the Web Role.

> Search: There is a gang on the box stealing all the resources

Nice one, so true. Search loves RAM.

Then the two IT-Pros showed us how to scale SharePoint from two servers to three servers – and then it got bigger and bigger. Finally a session about big installations. By the way, where is the level 400 session for scaling SharePoint?

Search is a killer: Don’t underestimate the hardware requirements for bigger installations.

## Patches

4 times patches killed SharePoint 2010 and they were pulled right afterwards. Todd has two lists, he is my reference for the current recommended version ([SharePoint 2010][8] and [SharePoint 2013][9]). Too bad there is no “If I were you, I would install this patch flag” on the page. Important: There is no uninstall – install the patches on a TEST environment and to quote Dan Holme:

> You always have a TEST environment – without it you don’t have a PROD environment

## Slides & 60 Minutes Entertainment

You can grab the [slides][10] and the [recording][11] from the TechEd site – I ‘d recommend you to watch it, because the show is really good!

## My evaluation

Laughing and learning – that’s why I love Todd’s sessions for years now. I even bought his book at TechEd, but he took it from me to shamelessly promote it in the session:

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="2013-06-27T17-34-35_0" alt="2013-06-27T17-34-35_0" src="http://melcher.it/wp-content/uploads/2013-06-27T17-34-35_0_thumb.jpg" width="184" height="244" border="0" />][12]{.thickbox}

The Todd and Corey combo worked very well, I (and I assume the 100 attendees) had a very good time! Thanks!

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="2013-06-27T17-34-35_3" alt="2013-06-27T17-34-35_3" src="http://melcher.it/wp-content/uploads/2013-06-27T17-34-35_3_thumb.jpg" width="244" height="184" border="0" />][13]{.thickbox}

 [1]: http://blog.sharepoint-voodoo.net/
 [2]: https://twitter.com/cburke007
 [3]: https://twitter.com/toddklindt
 [4]: http://melcher.it/wp-content/uploads/image20.png
 [5]: http://technet.microsoft.com/en-us/library/ff758647(v=office.14).aspx
 [6]: http://channel9.msdn.com/Events/TechEd/NorthAmerica/2013/MDC-B356#fbid=WGzBjalI8qs
 [7]: http://www.harbar.net/
 [8]: http://www.toddklindt.com/blog/lists/posts/post.aspx?id=224
 [9]: http://www.toddklindt.com/blog/Lists/Posts/Post.aspx?ID=346
 [10]: http://video.ch9.ms/sessions/teched/eu/2013/SES-B323.pptx
 [11]: http://channel9.msdn.com/Events/TechEd/Europe/2013/SES-B323#fbid=brbMsfI4lBZ
 [12]: http://melcher.it/wp-content/uploads/2013-06-27T17-34-35_0.jpg
 [13]: http://melcher.it/wp-content/uploads/2013-06-27T17-34-35_3.jpg

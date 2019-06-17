---
title: ShareCamp 2013 – Recap and session slides
author: Max Melcher
aliases:
   - "/post/2013-04-15-sharecamp-2013-recap-and-session-slides/"
2013: "04"
type: post
date: 2013-04-15T20:10:40+00:00
url: /2013/04/sharecamp-2013-recap-and-session-slides/
yourls_shorturl:
  - http://melcher.it/s/6
categories:
  - Presentation
  - SharePoint 2013

---
[ShareCamp][1] 2013 took place at Microsoft’s office here in Munich last weekend (4/12/2013-4/14/2013) and it was a BLAST.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sharecamp.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Sharecamp 2013 - before it began" alt="sharecamp" src="http://melcher.it/wp-content/uploads/sharecamp_thumb.jpg" width="244" height="244" border="0" /></a>
  
  <p class="wp-caption-text">
    Sharecamp 2013 - before it began. Picture taken by Michael Greth
  </p>
</div>

&nbsp;

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sharecamp_start.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="sharecamp_start" alt="sharecamp_start" src="http://melcher.it/wp-content/uploads/sharecamp_start_thumb.jpg" width="244" height="153" border="0" /></a>
  
  <p class="wp-caption-text">
    Saturday, 9:00am.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sharecamp_sessionplaning.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Sharecamp 2013 - shortly before the session planning" alt="sharecamp_sessionplaning" src="http://melcher.it/wp-content/uploads/sharecamp_sessionplaning_thumb.jpg" width="244" height="153" border="0" /></a>
  
  <p class="wp-caption-text">
    200 SharePointers voting for sessions
  </p>
</div>

What I totally like was the open but still professional style of the [barcamp][2] – every attendee was allowed to suggest one or more presentation topic. After receiving more than 5 votes from the 200 attendees you got a session slot assigned (room and time). Meeting friends, colleagues, 5 MVPs (Michael Greth, Christian Glessner, Niki Borell, Daniel Wessels and Fabian Moritz) and other experts (from Microsoft, too) was really cool and I learned a lot, again!

No promotion in my company was needed, more than 10 colleagues attended  – Sebastian Huppmann gave a nice presentation on Saturday about Twitter’s Streaming API – and it was the first year that Alegri sponsored the event.

## Session: “Search Architecture” by Rainer Asbach, Microsoft

Every time Rainer Asbach is speaking I try to attend. Very, very profound search-expertise – I attended 2 years ago - now again and it was very interesting again!

Key take aways:

  * Search Index is now smaller, FIXML of FAST not stored anymore. Index should be noticeable smaller than with FAST for SharePoint 2010.
  * Better understanding how search is scaled and how to utilize critical services – great video how the crawler/query component hits CPU/RAM and how that affects DB/Webfrontends/Index/Analytics etc.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sharecamp_searcharchitecture.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="sharecamp_searcharchitecture" alt="sharecamp_searcharchitecture" src="http://melcher.it/wp-content/uploads/sharecamp_searcharchitecture_thumb.jpg" width="244" height="153" border="0" /></a>
  
  <p class="wp-caption-text">
    Rainer Asbach - Search Architecture
  </p>
</div>

&nbsp;

## Session: “Search-driven Apps with SharePoint 2013 – what’s possible with the new platform?”

Presented my favorite topic – **Search** – in front of roughly 50 people I showed what the new platform is capable of. From continuous crawling to content by search webpart I covered a lot of stuff and answered even more questions. Had fun!

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Sharecamp_Search.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="SharePoint 2013 Search-driven apps session, photo by @OWirkus" alt="Sharecamp_Search" src="http://melcher.it/wp-content/uploads/Sharecamp_Search_thumb.jpg" width="244" height="139" border="0" /></a>
  
  <p class="wp-caption-text">
    Presenting at ShareCamp 2013 - I am the guy with the red shirt
  </p>
</div>

&nbsp;

Slides: available at [slideshare][3]

## Session: SharePoint 2013 / Best Tools / Toolbox + automated SharePoint 2013 Installation

Again, 50 people attended my session about tools. This time I showed how to install SharePoint 2013 fully automated with PowerShell – the awesome [AutoSPInstaller][4] raised a lot of questions and kept the session very interactive. I was really surprised that only 20% of the audience knew it…

Apparently I could not show the final result, I will record a webcast for the [SharePoint Toolbox][5] and you can see the result there.

After showing how to configure the AutoSPInstaller (briefly) – I showed how to install other tools via [chocolatey][6] (8 [SharePoint tools][7] are available by now).

Then we discussed some tools but ran out of time because I talked too much! My bad. Here is the list of the tools we collected:

[UlsViewer][8] (two guys in the audience did not know this gem!)
  
[Chocolatey][6]
  
[Caml Designer][9] (see [webcast][10] )
  
[CKSDEV][11] (webcast, [new version for 2012 available][12])
  
[Sharepoint Manager][13] (2007 / 2010 / 2013)
  
[Health check rules][14] (new one for me, will check it out!)
  
[SPServices][15]
  
[Blob Cache Manager][16] (SP2010 and SP2013)
  
[SP2010 Batch Edit][17] (want to batch edit list entries with managed Metadata in SP2010? This is a solution…)
  
[SPWakeUp][18] (a handy solution for the sleepy SharePoint)
  
[Microsoft Remote Desktop Connection Manager][19] (new for me, sounds great!)
  
[Dynamic Forms for SharePoint][20] (adjustable forms for SharePoint to save data to a list with rules and styles)
  
[SPSin][21] (inject JavaScript and CSS into selected SharePoint pages)

Slides: [available at slideshare][22]

## Final notes

Thanks everyone for organizing this great, great event - I will attend next year, promised. Hopefully no relocation next year so I can attend both days and can join more sessions and discussions.

&nbsp;

&nbsp;

 [1]: http://sharecamp.de
 [2]: http://en.wikipedia.org/wiki/BarCamp
 [3]: http://de.slideshare.net/melchermaximilian/search-share-camp2013
 [4]: http://autospinstaller.codeplex.com
 [5]: http://sharepointtoolbox.de
 [6]: http://chocolatey.org
 [7]: http://chocolatey.org/packages?q=sharepoint
 [8]: https://www.google.de/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&ved=0CDUQFjAA&url=http%3A%2F%2Farchive.msdn.microsoft.com%2FULSViewer&ei=1VpsUerSDMWI4gST24H4Aw&usg=AFQjCNEOHo87LLj0Gc_rOwp6O5Tg4tZzfQ&sig2=oHEiBb-U2uG5eOInVYhXDw&bvm=bv.45175338,d.Yms
 [9]: http://sharepoint.biwug.be/SitePages/Caml_Designer.aspx
 [10]: http://www.sharepointtoolbox.de/blog/2012/06/04/sharepoint-toolbox-004-caml-designer/
 [11]: http://cksdev.codeplex.com/
 [12]: http://visualstudiogallery.msdn.microsoft.com/cf1225b4-aa83-4282-b4c6-34feec8fc5ec?SRC=Home
 [13]: https://spm.codeplex.com/
 [14]: https://sphealth.codeplex.com/
 [15]: https://spservices.codeplex.com/
 [16]: https://sp2010blobcachemgr.codeplex.com/
 [17]: https://sp2010batchedit.codeplex.com/
 [18]: https://spwakeup.codeplex.com/
 [19]: http://www.microsoft.com/en-us/download/details.aspx?id=21101
 [20]: https://spdynamicforms.codeplex.com/
 [21]: https://spsin.codeplex.com/
 [22]: http://www.slideshare.net/melchermaximilian/sharepoint-2013-best-tools-v3-automatisierte-sharepoint-2013-installation

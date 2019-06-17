---
title: 'TechEd 2013: Search Architecture, Sizing, and Migration in Microsoft SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2013-06-26-teched-2013-search-architecture-sizing-and-migration-in-microsoft-sharepoint-2013/"
2013: "06"
type: post
date: 2013-06-26T08:25:30+00:00
url: /2013/06/teched-2013-search-architecture-sizing-and-migration-in-microsoft-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/T
categories:
  - Search
  - SharePoint 2013
  - TechEd

---
From the session description:

> Successful SharePoint deployments have one thing in common: great search!

So, true – here are my session notes from the Search Architecture, Sizing, and Migration in Microsoft SharePoint 2013 session.

<!--more-->

Session by Jan Inge Bergseth (MSFT, Search Center of Excellence). Slides + Video of the NA TechEd <a href="http://channel9.msdn.com/Events/TechEd/NorthAmerica/2013/SES-B310#fbid=WGzBjalI8qs" target="_blank">here</a>, but with a different speaker.

## Architecture

I know a quite a lot about this topic, it was a pretty short overview about the architectural changes. The slides are based on the SPC slides (SPC202) – and that’s a good thing.

## Demo

Jan showed how easy it is to add Metadata and visualize them as a pie chart refiner in the search results page.

## Analytics Service

I should invest more time with this beauty –  there is some hidden potential when you ask for “Suggested sites to follow” or “Are you looking for these again?”.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2013-06-25T17-34-25_0" alt="2013-06-25T17-34-25_0" src="http://melcher.it/wp-content/uploads/2013-06-25T17-34-25_0_thumb.jpg" width="244" height="184" border="0" />][1]{.thickbox}

## Migration Scenarios

Okay, there is new information here. I had in mind that there is now migration story from FAST Search Server to SharePoint 2013 – but it seems there is one:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Migration Scenarios for SharePoint Search" alt="Migration Paths - taken from http://channel9.msdn.com/Events/TechEd/NorthAmerica/2013/SES-B310#fbid=WGzBjalI8qs" src="http://melcher.it/wp-content/uploads/image_thumb16.png" width="244" height="139" border="0" />][2]{.thickbox}

Maybe its supported, but the custom PowerShell line could be a “It depends!”. Jan said “undocumented”.

## Backup and Restore

Everything but the index is in the database.

## My questions after the session:

> Is there a rule of thumb for index size?

Not an official one.

> Will there be Search Performance Evaluation with the same level of detail as there was for FAST Search Server For SharePoint 2010?

Some started it – but it's either not finished or not yet published. Too bad, I read the one for FAST several times.

> Is there an out of the box solution to this <a href="http://sharepoint.stackexchange.com/questions/71116/aam-with-searchcentre-on-its-own-web-app" target="_blank">question</a>?

Not ad-hoc. Follow up mail with questions is on the way.

## My evaluation

Search – could talk and listen to this topic forever! The session is great by design. Okay, back to reality: Detailed session but I wish there would be a deeper session (Level 400, anyone?) for this. I learned the most after the sessions because the questions of the attendees covered the edge cases and tough situations. Still, enjoyed the session!

 [1]: http://melcher.it/wp-content/uploads/2013-06-25T17-34-25_0.jpg
 [2]: http://melcher.it/wp-content/uploads/image16.png

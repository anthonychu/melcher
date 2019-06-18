---
title: 'SPC14: Complex Problem Solving with the new HTML5 APIs'
author: Max Melcher
aliases:
   - "/post/2014-03-04-spc14-complex-problem-solving-new-html5-apis/"
2014: "03"
type: post
date: 2014-03-04T21:46:33+00:00
url: /2014/03/spc14-complex-problem-solving-new-html5-apis/
yourls_shorturl:
  - http://melcher.it/s/24
categories:
  - Apps
  - Development
  - SharePoint 2013

---
> HTML5 and CSS3 are now a standard part of the Office and SharePoint developer's skillset. While much of the buzz around HTML5 and CSS3 focuses on creating a responsive and satisfying end-user experience, a whole new set of JavaScript APIs was also introduced. These APIs provide powerful capabilities that either didn't exist before, or were only available in 3rd-party libraries. In this session, we'll focus on these new APIs and use them to solve real-world problems such as maintaining context in a SharePoint-hosted app, caching app data, and communicating between app parts. Attendees will exit the session with a host of new ideas for using the HTML5 APIs to solve real-world problems.

Session "Complex Problem Solving with the new HTML5 APIs" by [Scot Hillier][1] – here are my notes.

## From Bricks to Houses

SP2010: WebParts, Workflows, Libraries, Pages
  
SP2013: Provider Hosted Apps, SharePoint Hosted Apps, App Parts

Good analogy – SharePoint developer will be transformed to Web Developer – we are responsible for greater parts now.

{{< fancybox "/wp-content/uploads/" "IMG_1732.jpg" "" "single_image" >}}

## Responsive App Parts / iFrames

SharePoint controls the size of the App Part / iFrame.

Media Queries with window.**matchMedia** – mobile first, look great on any device.
  
Request larger iFrame with **postMessage**. This method allows to send text message between windows, works across domains.

Demo: Scot showed a Corporate Calendar App that is based on search and aggregates calendar entries farm wide.

## SPA / Ajax Navigation

Single Page Applications (SPA) are trending because of no postbacks that gives a great user experience. This renders the browser navigation useless.

Solution for this can be done with the history object. Scot recommends to use a framework for SPA, example here was Angular.js

## App Part Communication

Server-Sent Events (SSE) – one way communication over an established channel to the client

> Server-Sent Events are wicked cool stuff

Web API supports SSE to push streams to clients.

> For HTML5 Apps you need to know what your browser supports – modernizer.js is your friend.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1736" alt="IMG_1736" src="http://melcher.it/wp-content/uploads/IMG_1736_thumb.jpg" width="348" height="185" border="0" />][3]

IE does not support SSE (I would recommend <a href="http://signalr.net/" target="_blank">SignalR</a> here, that handles everything for you).

Demo: Scot showed how to connect webparts with Server Side Events – pretty cool demo, I will grab his source code afterwards and check how he did it.

## Web Sockets

Web Sockets allow you to create two-way communications (e.g. chat applications).

Scot uses Alchemy WebSocket Server for his demo – with this you get websockets up and running in minutes.

Demo: Scot generated a Ticket Generator that generates ticket on one page, and a consumer on another page – with his pattern you can create cross page communication.

## Performance

JavaScript is single threaded – you can use Web Workers so spawn new threads and unblock the main thread.

Dedicated (one caller) and Shared Workers (multiple callers) can communicate with postMessage but cannot access the DOM directly.

Demo: Type ahead scenario where you search and during the search the cursor freezes because the main thread is blocked. The conclusion is that Web Workers are not for higher performance but for better responsiveness.

## Maintain SharePoint Context

Challenge is to maintain the SharePoint context across pages. Solution can be to use Web Storage – you can even enrich them with Geolocation data.

Web Storage is key-value pair storage, can be persistent or session based storage.

## Summary

Scot Hillier delivers what he promised, definitely will try some of the stuff he showed on stage – very good session. Apparently I did not receive one of the “Working on it” T-Shirts he gave away during his session – but his many demos made this session very valuable for me.

 [1]: http://twitter.com/scothillier
 [2]: http://melcher.it/wp-content/uploads/IMG_1732.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_17361.jpg

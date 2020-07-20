---
title: SharePoint 2013 Search Preview for Documents hosted in SharePoint 2010
author: Max Melcher
aliases:
   - "/post/2013-11-22-sharepoint-2013-search-preview-documents-hosted-sharepoint-2010/"
2013: "11"
type: post
date: 2013-11-22T23:59:32+00:00
url: /2013/11/sharepoint-2013-search-preview-documents-hosted-sharepoint-2010/
yourls_shorturl:
  - http://melcher.it/s/1r
categories:
  - Deep Dive
  - Development
  - Office Web Apps 2013
  - Search
  - SharePoint 2010
  - SharePoint 2013

---
Recently I talked to some clients because of a "**Search-First**" SharePoint 2013 migration (more about this topic will follow). During a training this week I got aware of a serious issue with the "Search-first" approach, especially with the really nice Office Web Apps 2013 Search Previews you get for <a title="Licensing for Office Web Apps 2013" href="http://blogs.technet.com/b/volume-licensing/archive/2013/05/22/how-to-license-office-web-apps-server.aspx" target="_blank">free</a> (read only!).

## Problem

Some clients want to start their migration with setting up a new SharePoint 2013 farm. This new farm then crawls the old SharePoint 2010 farm. After successfully crawling it, the SharePoint 2013 farm then publishes its Search Service to the SharePoint 2010 farm. So far so good. But what happens with all the new shiny features in the Search UI? Nothing. Until now everything works as it should - you now get better search results in your existing SharePoint 2010 environment.

Now let's take it a step further. Replace the SharePoint 2010 Search Center with a Search Center hosted in SharePoint 2013 - replacing is actually wrong, you have to do a redirect from the SharePoint 2010 environment to the Search Center in SharePoint 2013 - with the Search Preview, Display Templates and all the good stuff. Pretty great, I totally love the new features and the business value you can create with it:

{{< fancybox "/wp-content/uploads" "SP2013_Preview_Default.png" "" "single_image" >}}

But here is the Problem: You crawled the SharePoint 2010 environment - by default you wont get a Preview for documents in the old environment:

{{< fancybox "/wp-content/uploads" "SP2013_Preview_SP2010.png" "" "single_image" >}}

There is a <a title="Utilizing Web Apps 2010 to get PowerPoint search document previews of SharePoint 2010 content in SharePoint 2013 search" href="http://blogs.msdn.com/b/murads/archive/2012/10/11/utilizing-web-apps-2010-to-get-powerpoint-previews-of-sharepoint-2010-content-from-sharepoint-2013-search.aspx" target="_blank">great article by Murad Sæter</a> how you could substitute the Preview with Office Web Apps 2010 (the service application in SharePoint 2010 that needs expensive Office 2010 licenses!). Many of my clients don't have the Office 2010 licenses - many of them still use Office 2007 - so a show stopper. PDF Preview with old Office Web Apps - nope. This additionally applies to documents hosted on a fileshare - that does not work either.

## Reason

So we have Security Trimming in SharePoint Search - you only see what you are allowed to see. Why is there now Preview?

Thats because of <a title="oAuth explanation on Wikipedia" href="http://en.wikipedia.org/wiki/OAuth" target="_blank">oAuth </a>- or better the inability of SharePoint 2010 to understand and accept oAuth (great explanation here by <a title="Inside SharePoint 2013 OAuth Context Tokens" href="http://blogs.msdn.com/b/kaevans/archive/2013/04/05/inside-sharepoint-2013-oauth-context-tokens.aspx" target="_blank">Kirk Ewans</a>).

## Behind the scenes

The following happens when you hover over search result that is suitable for a Preview - let's name the searching user **Max**:

  1. The search crawler created a link to render a document in the browser. This link is stored in the property&nbsp;ServerRedirectedURL or&nbsp;ServerRedirectedEmbedURL.
  2. This link points to a SharePoint Page called WopiFrame (e.g.&nbsp;http://sharepoint2013/_layouts/15/WopiFrame.aspx?sourcedoc=/Documents/OSP218.pptx&action=default&DefaultItemOpen=1)
  3. This WopiFrame page knows the url to the bound Office Web Apps Server and redirects the request to it. With three parameters: The sourcedoc of the document to render, an oAuth access token and an oAuth time to live token.
  4. The Office Web Apps server, in order to render the document and deliver it back, needs the document to render - of course. Because we left the original server where **Max** was authenticated - we don't have this client context anymore - the request from the Office Web Apps back to the SharePoint 2013 server to get the document is **anonymously**. But why does the SharePoint delivers our precious document? Thats because of the oAuth access token - SharePoint 2013 can validate it and accepts the request like one **Max** would actually do.
  5. After some computing and drawing time, the Office Web Apps server delivers the preview back to **Max**.

Because SharePoint 2010 does not understand and accept anonymously requests (most of the time) - and does not understand oAuth tokens - Office Web Apps 2013 do not render Documents hosted on SharePoint 2010.

## &nbsp;Solution:&nbsp;SharePoint 2013 Search Preview for Documents hosted in SharePoint 2010

Figuring out a solution cost me 4 days "brain time" - thinking about the problem - understand the root cause - analyzing options. And chatting with some really nice guys - more about this later.

In the following picture I show you the flow how the requests go from one server to another:

{{< fancybox "/wp-content/uploads" "Search_Preview_SP2010_Flow.png" "" "single_image" >}}

In order to make this all happen, I created a SharePoint Farm Solution (full trust) that needs to be deployed on the SharePoint 2013 side. This provides two handlers that do the following.

SP2010Redirect.ashx: Accepts the initial user request and generates a url that contains the document that should be rendered (full url), the requesting user (domain login) and a simple hash (prevents tampering with the data - **no real security**!) - that guy is for step (1) in the flow.

SP2010Preview.ashx: Accepts the request back from the Office Web Apps server with the full url of the document, the user login and the hash. With those three values it can check the integrity of the parameters, download the document of the SharePoint 2010 (or what system you like) and &nbsp;returns it to the Office Web Apps server. This page handles step (3) to step (6).

## Pictures / Video or it did not happen!

<span class="embed-youtube" style="text-align:center; display: block;"></span>

&nbsp;

{{< fancybox "/wp-content/uploads" "SP2013_Preview_SP2010_working.png" "" "single_image" >}}

## Flaws of the current implementation /

## Room for improvement

The code I am going to share is no production ready code - there are magic, hard-coded values in it. I only demonstrate how I did it. No warranties for what so ever.

So why don't I use oAuth and the WOPIFrame for all the security stuff? Thats because of wonderful internal classes. Dear Microsoft - please open up so I can implement a secure approach.&nbsp; If I miss a thing and can actually use oAuth directly - please let me know!

Again in other words: If you can create the hash that is passed along for anti-tampering, the SP2010Preview.ashx will download you **every document of the SP2010 (this is serious!!)** - in my code I did not implement the security check for the given user anyways 🙂 Neither did I add the display template - but its so easy to change it, you will figure it out.

Grab the demo code <a href="https://github.com/MaxMelcher/SP2010Preview" target="_blank">here</a>.

## Thanks!

I really love the SharePoint community - there are a lot of helpful and awesome guys out there. To quote a few that really helped me figuring out this solution:

<blockquote class="twitter-tweet" width="500">
  <p>
    <a href="https://twitter.com/maxmelcher">@maxmelcher</a> If you use SP2013 search center w/SP2010 doc previews, you need this: <a href="http://t.co/Ef1v8fiY8t">http://t.co/Ef1v8fiY8t</a>
  </p>
  
  <p>
    &mdash; Bob German (@Bob1German) <a href="https://twitter.com/Bob1German/statuses/403716495663841280">November 22, 2013</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    <a href="https://twitter.com/maxmelcher">@maxmelcher</a> <a href="https://twitter.com/jimmywim">@jimmywim</a> <a href="https://twitter.com/HughAJWood">@HughAJWood</a> if that's the case, you can't highjack another app's token. Can create custom WOPI?
  </p>
  
  <p>
    &mdash; Kirk Evans (@kaevans) <a href="https://twitter.com/kaevans/statuses/403598439843659777">November 21, 2013</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    <a href="https://twitter.com/maxmelcher">@maxmelcher</a> <a href="https://twitter.com/HughAJWood">@HughAJWood</a> OR you will need a handler, like your idea, which asks a web service hosted in 2013 if the token is good
  </p>
  
  <p>
    &mdash; James Love (@jimmywim) <a href="https://twitter.com/jimmywim/statuses/403156348999053312">November 20, 2013</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    <a href="https://twitter.com/maxmelcher">@maxmelcher</a> Steve Fox's book may have the answer. I put in the information from it for you. <a href="http://t.co/TdXZYyXlP4">http://t.co/TdXZYyXlP4</a>
  </p>
  
  <p>
    &mdash; Hugh Wood (@HughAJWood) <a href="https://twitter.com/HughAJWood/statuses/403114874214940672">November 20, 2013</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    <a href="https://twitter.com/jimmywim">@jimmywim</a> <a href="https://twitter.com/HughAJWood">@HughAJWood</a> "premature optimization is the root of all evil" 😀
  </p>
  
  <p>
    &mdash; Maximilian Melcher (@maxmelcher) <a href="https://twitter.com/maxmelcher/statuses/403157270239793153">November 20, 2013</a>
  </p>
</blockquote>



&nbsp;

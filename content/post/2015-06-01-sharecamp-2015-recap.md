---
title: ShareCamp 2015 – Recap
author: Max Melcher
aliases:
   - "/post/2015-06-01-sharecamp-2015-recap/"
2015: "06"
type: post
date: 2015-06-01T07:30:51+00:00
url: /2015/06/sharecamp-2015-recap/
yourls_shorturl:
  - http://melcher.it/s/5b
categories:
  - Apps
  - Azure
  - Azure Search
  - Community
  - Conference
  - Search
  - SharePoint 2013
  - SharePoint 2016
  - SharePoint Toolbox
  - Tools

---
Germany's latest and greatest SharePoint community event was last weekend (30.05.2015 & 31.05.2015 at Microsoft in Munich) - and it was awesome, once again!

{{< fancybox "/wp-content/uploads" "sharecamp_sessionvote2.jpg" "" "single_image" >}}

{{< fancybox "/wp-content/uploads" "sharecamp_sessionvote.jpg" "" "single_image" >}}

## 

## 

## 

## 

## <span style="line-height: 1.5;">ShareCamp & Community</span>

What is so special about [ShareCamp][1]? Easy question, it is entirely community-driven. On both days, Saturday and Sunday, there is a session vote before the "conference" starts. So the attendees prepare presentations and do a short intro during the vote - if more than 3 people raise their hand there will be a session and there were lots of em. **6 tracks** in parallel if I recall it right. And the concept works for many years now, **more than 200 attendees** had a good time this year! Not to mention the SharePint party. The good thing here? No only experienced and known speakers get the chance to present their ideas. And not only the mainstream sessions get voted - there were a lot of close to or far way from SharePoint sessions. And I met a lot of old SharePoint friends that are spread over the country - good to see ya! 🙂

{{< fancybox "/wp-content/uploads" "Alegri-Team.jpg" "" "single_image" >}}

## 

## 

## 

## 

## 

## Sessions & Discussions

So what sessions did we have this year? A lot of them. Here is a list of the sessions I attended or prepared.

### 1. Azure Search vs SharePoint Search (2x)

On Saturday I held a presentation about Azure Search. The title was on purpose a little bit baiting, you can't compare the incomparable here and that's good. But I started with a brief overview what SharePoint Search is, how it evolved and talked about its strength and weaknesses. Then I switched over to the brand new Azure Search I evaluated for a client project. And showed a demo app that is ([Sourcecode][2]) available here. Basically I showed the entire Azure Search workflow from service & index creation, pushing documents via SharePoint to Azure Search - and the options you have to get items back out of it. I had good fun. So much, that I presented the session again on Sunday 🙂 Here I showed a second demo (available [here][2]) that indexed a local folder and pushed the filenames and paths to Azure Search. Does that sound familiar? I tried to cover some of the typical SharePoint content sources: SharePoint Content and Fileshares. It's not even close what I showed but similar.

I received some good questions during the talk (out of my head in my words):

  * Where is the content? The content will be stored in Azure Search / Cloud.
  * Can you index Office Documents? Yes, but you need to extract the content of the files.
  * How about item security? If you want them, you have to build them. Azure Search has a different focus than SharePoint Search - keep that in mind. Different product, not a replacement!
  * Can you push items to the cloud? YES!!!
  * How you get the items back? You get them via the REST interface and they are transported as JSON.
  * Can you combine SharePoint Search and Azure Search? Not out of the box - you would need to create an opensearch provider that translates the JSON to opensearch compliant XML.
  * Is it ready yet? Yes, definitely. But I have the feeling Azure Search will improve rapidly in the near future.

My [slides][3] (German most of it) are available here - but as usual they are not as good without the demo.

Expect some blog posts here, I really like Azure Search!

### 2. Governance & JavaScript Solutions - how does that fit together?

My second session on Saturday with my colleagues Marco Schmucker and Matthias Edom - we talked about the blessings and curses of JavaScript solutions - what you can do and what it will cost you/your clients. The entire session was based on the scenario that you upgrade you SharePoint to a next version and should estimate how much effort you have to put into it - and what could essentially break. And we discussed with the audience, we gather a lot of different aspects and experiences. Good fun!

{{< fancybox "/wp-content/uploads" "ScriptingAndGovernance.jpg" "" "single_image" >}}

&nbsp;

&nbsp;

&nbsp;

&nbsp;

&nbsp;

Slides will be available once I get the link.

### 3. Provider-hosted App Framework

I am slightly interested into SharePoint Provider-hosted apps and all areas around it. Maybe because I recently started to learn MVC. Maybe because I like the idea of having all the great stuff outside of SharePoint. But in this session Christian Groß ([Solutions2Share][4]) showed what framework they use to create their apps. I was really surprised to hear what they experienced over the last year and what it means to build a product - and how important logging, supporting and ticketing is. Good stuff, I hope they will release it as open source sometime in the future&#8230;

### 4. SharePoint Toolbox

The ShareCamp evergreen, I think it's the 4th time that we had this session at a ShareCamp. I am into tools and this session is about tools - so what could go wrong?! My friend [Henning Eiben][5] moderated a really entertaining session with lots of idea sharing and tool discussions. I think we gathered and introduced about 50 tools - commercial or Open Source that every SharePoint developer or IT-PRO should know. [ULSViewer][6], [SPDockit][7], [CamlDesigner][8], [SPServices][9], [CKSDev][10], [SearchQueryTool][11], [LogParser][12], [AutoSPInstaller][12] family, [SharePoint Patch Service][13] - just to name a bunch!

> Dont be a fool - use a tool!

Henning collected a lot of the tools in a [delicious feed][14] - go take a look!

### 6. Provider Hosted Apps Hackathon

I prepared nothing for it - and expected a lot of this session - fun most importantly. We only had one hour to "create" something that looks like an SharePoint app. So what did we do? We decided do a simple app that shows two buttons and asks the key question: "How was your day today?" So we had two buttons with good and bad. The strech goal here was to ship a minimal viable product that simply stored the value in a SharePoint list - in one hour impossible? Damn right. But during the hour we talked and discuss a lot about the problems we face with Provider-hosted apps, whats good and bad - and what challenges & opportunities we see. We almost got it working tho, very close to storing the results - soooo close! 🙂

### 6. Azure Workshop

I only attended the very last 15 minutes. Too bad, it must have been awesome. At least I heard that many of the attendees said it was their highlight. Okay [Patrick Heyde][15] (Microsoft) had some advantages: Firstly he had 3 hours to show how to provision a SharePoint environment on Azure and the experiences he collected over the past 4 years in his role - and he "bribed" the attendees with 75€ Azure vouchers to play with it. Too bad there were so many sessions in parallel - there will hopefully be a next time!

In general I think there should be more sessions that have more time - I would love to talk about SharePoint/Azure Search for a day&#8230; or two 🙂

## Summary

The weekend was packed and I learned a lot - I totally enjoyed it. I am really looking forward for next year!

Thanks again to all sponsors, organizers and speakers - Germany's SharePoint community would not work without you!

{{< fancybox "/wp-content/uploads" "Raffle.jpg" "" "single_image" >}}

 [1]: http://melcher.it/s/50
 [2]: http://melcher.it/s/4X
 [3]: http://melcher.it/s/4Y
 [4]: http://melcher.it/s/51
 [5]: https://twitter.com/nyn3x
 [6]: http://melcher.it/s/53
 [7]: http://melcher.it/s/54
 [8]: http://melcher.it/s/55
 [9]: http://melcher.it/s/56
 [10]: http://melcher.it/s/57
 [11]: http://melcher.it/s/3P
 [12]: http://melcher.it/s/58
 [13]: http://melcher.it/s/5a
 [14]: http://melcher.it/s/5c
 [15]: http://blogs.technet.com/b/patrick_heyde/

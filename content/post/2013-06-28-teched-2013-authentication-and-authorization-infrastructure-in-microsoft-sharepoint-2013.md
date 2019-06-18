---
title: 'TechEd 2013: Authentication and Authorization Infrastructure in Microsoft SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2013-06-28-teched-2013-authentication-and-authorization-infrastructure-in-microsoft-sharepoint-2013/"
2013: "06"
type: post
date: 2013-06-28T11:12:11+00:00
url: /2013/06/teched-2013-authentication-and-authorization-infrastructure-in-microsoft-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/12
categories:
  - TechEd

---
Session by [Paolo Pialorsi][1] ([@PaoloPia][2])

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb21.png" width="244" height="139" border="0" />][3]

> In this session, you learn how authentication and authorization work in SharePoint 2013, either when handling direct users’ requests, or running requests for SharePoint apps. In particular, see how to federate with an external Identity Provider like Windows Azure ACS to authenticate users and then authorize them in SharePoint, leveraging claims.

There is one Level 400 session (highest) – guess what's it about? Right, Authentication.

Here are my session notes.

<!--more-->

## Authentication

Classic Authentication is deprecated in SharePoint 2013. So its all about Claims now. The though thing is to map the incoming tokens from the authentication provider to the ones SharePoint use.

## Identity Provider

Paolo showed an example how to utilize Facebook to log into SharePoint via Azure ACS. As said, he had to map the incoming claims token to SharePoint properties – trust the certificate on the SharePoint site and that’s it basically.

You can create a custom Identity Provider, there is a every well documented example by [Steve Peschka][4].

## Apps

After the theory Paolo showed us how to utilize this knowledge in combination with apps. This is my favorite diagram about this:

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="OAuth Authentication flow" alt="Copied from the slides: http://video.ch9.ms/sessions/teched/eu/2013/SES-B402.pptx" src="http://melcher.it/wp-content/uploads/image_thumb22.png" width="244" height="139" border="0" />][5]

This is crazy stuff – but very powerful.

## Session Slides and Recording

The [presentation][6] and the [recording][7] will be available at the Chanel 9 site. I recommend you to watch the recording, the demos are not visible in the slides at all.

## My evaluation

Authentication/Security is tough stuff: I did something similar with [ADFS][8] for a client, I wish I had this information earlier – it helped me understand what’s happening under the hood. Too bad that there are not that many advanced sessions, I wish there were more. Thanks Paolo for my better understanding about this topic!

 [1]: http://channel9.msdn.com/Events/Speakers/paolo-pialorsi
 [2]: https://twitter.com/PaoloPia
 [3]: http://melcher.it/wp-content/uploads/image21.png
 [4]: http://blogs.technet.com/b/speschka/archive/2010/03/13/writing-a-custom-claims-provider-for-sharepoint-2010-part-1.aspx
 [5]: http://melcher.it/wp-content/uploads/image22.png
 [6]: http://video.ch9.ms/sessions/teched/eu/2013/SES-B402.pptx
 [7]: http://channel9.msdn.com/Events/TechEd/Europe/2013/SES-B402#fbid=brbMsfI4lBZ
 [8]: http://blogs.technet.com/b/speschka/archive/2010/07/30/configuring-sharepoint-2010-and-adfs-v2-end-to-end.aspx

---
title: 'SPC14: Migrating Traditional SharePoint Solutions to the App Model'
author: Max Melcher
aliases:
   - "/post/2014-03-02-spc14-migrating-traditional-sharepoint-solutions-app-model/"
2014: "03"
type: post
date: 2014-03-02T19:05:14+00:00
url: /2014/03/spc14-migrating-traditional-sharepoint-solutions-app-model/
yourls_shorturl:
  - http://melcher.it/s/1X
categories:
  - Apps
  - Development
  - SharePoint 2013

---
> There are many business scenarios and [solutions][1] that have been built on the SharePoint 2010 platform that are critical to customers. As companies, partners, and solution providers look to move to the SharePoint 2013 platform, these solutions should be reimagined to leverage the new cloud app model and apps for SharePoint. This session will deep dive into the key scenarios and techniques of migrating the most common customization patterns from SharePoint 2010 solutions to apps for SharePoint.

Very first session at SPC 2014 "Migrating Traditional SharePoint Solutions to the App Model" – by [Steve Walker][2], [Suman Chakrabarti][3] , [Kirk Evans][4] and [Richard diZerega][5] – nice setting.

> Who is carrying a gigantic, neck breaking laptop? This session is changing your life!

Richard diZerega sets some nice expectations.

The slides will be available afterwards but if you are willing to spend some time, please continue reading my notes.

# Overview

> What does deprecated mean?

Deprecated means “we are going to turn it off” – creating Apps now means you are settled to create applications that work in the future.

### Full trust –> Sandbox –> Apps

This is the standard approach, 50% of the audience started to dev with the App Model – and on of the reason behind is that there are not enough SharePoint Devs (try to hire one…)

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/20140302_171018052_iOS.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_171018052_iOS" alt="20140302_171018052_iOS" src="http://melcher.it/wp-content/uploads/20140302_171018052_iOS_thumb.jpg" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    Vision: Create higher developer adaption because of usage of web standards.
  </p>
</div>

&nbsp;

<div style="width: 358px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/20140302_171152393_iOS.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_171152393_iOS" alt="20140302_171152393_iOS" src="http://melcher.it/wp-content/uploads/20140302_171152393_iOS_thumb.jpg" width="348" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    App Model: Past, Present and Future
  </p>
</div>

<span style="line-height: 1.5em;">Reference to read: </span><a style="line-height: 1.5em;" title="http://www.andrewconnell.com/blog/sharepoint-hosted-apps-in-sp-2013-as-single-page-apps" href="http://www.andrewconnell.com/blog/sharepoint-hosted-apps-in-sp-2013-as-single-page-apps">http://www.andrewconnell.com/blog/sharepoint-hosted-apps-in-sp-2013-as-single-page-apps</a>

## Migrations

> There is no magic migration button that migrates your code to an App.

Apparently, because this is utterly complex – there is no automatic migration.

> Question: We are on SP2010 – is there guidance how to continue development so that you are ready for Apps?

There is not. Suggestion was to abstract not supported calls (like User Profile Service calls) so that you later can switch.

> I am on-prem – do I need to leave?

Great question! It points out that many of us are still on SP2010 and there is a lack of guidance how to create maintainable solutions that will work without rewriting the whole stuff again (some good examples: Custom Field Types, Custom Service Applications, Webhandlers, … ) – don’t do this.

<div style="width: 358px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/20140302_171623025_iOS.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_171623025_iOS" alt="20140302_171623025_iOS" src="http://melcher.it/wp-content/uploads/20140302_171623025_iOS_thumb.jpg" width="348" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    Hosting options
  </p>
</div>

&nbsp;

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/20140302_175142593_iOS.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_175142593_iOS" alt="20140302_175142593_iOS" src="http://melcher.it/wp-content/uploads/20140302_175142593_iOS_thumb.jpg" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    App Model
  </p>
</div>

&nbsp;

<div style="width: 358px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/20140302_180014499_iOS.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_180014499_iOS" alt="20140302_180014499_iOS" src="http://melcher.it/wp-content/uploads/20140302_180014499_iOS_thumb.jpg" width="348" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    App lifecycle with focus on authentication
  </p>
</div>

&nbsp;

## Code

As a start, Kirk showed how to get properties of webs and lists over oData – calling the _api stuff (that is known to me already, that’s why I skip this here).

### TokenHelper

You tried to use app authorization or ADFS –. then you know this guy and I skip this for brevity.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="20140302_182554245_iOS" alt="20140302_182554245_iOS" src="http://melcher.it/wp-content/uploads/20140302_182554245_iOS_thumb.jpg" width="348" height="185" border="0" />][6]

### 

### Timerjob as App

That’s a new one for me – App and Timerjob? How that is working out? Kirk shows the code. Honestly this was so fast I did not catch it, I just a saw Thread.Sleep – need to check this one afterwards (damn you Twitter!). During the session Kirk [posted this as my homework][7].

### SSL Certificate vs Azure ACL

During creation of a SharePoint App Project you can now choose to use MVC – that’s is cool. More challenging will be the discussion with the IT department to provide a ssl certificate for an app. I really looking forward to explain the IT guys what they should do, that it does not hurt and much more. Description of setting up things is [here][8].

### Permissions

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="20140302_185926193_iOS" alt="20140302_185926193_iOS" src="http://melcher.it/wp-content/uploads/20140302_185926193_iOS_thumb.jpg" width="348" height="185" border="0" />][9]

Effective Permissions: Apps + User or App only

Kirk explained that permissions are a tough area – you need a lot time to figure out how things are connected and what permissions you need. And the “App-only permission” flag is making things more interesting. Read more on Kirk’s [blog post about that][10].

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="20140302_192204788_iOS" alt="20140302_192204788_iOS" src="http://melcher.it/wp-content/uploads/20140302_192204788_iOS_thumb.jpg" width="348" height="185" border="0" />][11]

### Feature Stapling with an App

Richard showed a quick demo where he added an app part on a page that brands his mysite to show that you can use this concept to apply branding.

> Client Web Part – or as I say “glorified iFrame”

Quite simple to implement, need to keep that in mind.

### Site Provisioning

Richard showed a way to override the “Create new subsite” link to redirect to an app page that renders a form. On that form you can then specify metadata about the subweb (e.g. business impact or create yammer group) – good stuff, many clients requests that. There are different approaches – you can grab the code [here][12] or [here][13].

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="20140302_200145130_iOS" alt="20140302_200145130_iOS" src="http://melcher.it/wp-content/uploads/20140302_200145130_iOS_thumb.jpg" width="244" height="184" border="0" />][14]

### Workflows

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_201945699_iOS" alt="20140302_201945699_iOS" src="http://melcher.it/wp-content/uploads/20140302_201945699_iOS_thumb1.jpg" width="348" height="185" border="0" />][15]

There are several activities to get values from a web service. In this example Suman showed how to use the _api endpoint to fetches values and then set values on a list item.

## Quotes

<blockquote class="twitter-tweet" width="500">
  <p>
    "I can show you code or PowerPoint - with the same exact experience. The PowerPoint shows the code&#8230;" by <a href="https://twitter.com/kaevans">@kaevans</a> <a href="https://twitter.com/search?q=%23spapps&src=hash">#spapps</a> <a href="https://twitter.com/search?q=%23SPC14&src=hash">#SPC14</a>
  </p>
  
  <p>
    &mdash; Maximilian Melcher (@maxmelcher) <a href="https://twitter.com/maxmelcher/statuses/440200653185351681">March 2, 2014</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    "I am on-prem - do I need to leave" - good one :)&#10;<a href="https://twitter.com/search?q=%23spapps&src=hash">#spapps</a> <a href="https://twitter.com/search?q=%23spc14&src=hash">#spc14</a>
  </p>
  
  <p>
    &mdash; Maximilian Melcher (@maxmelcher) <a href="https://twitter.com/maxmelcher/statuses/440179871289835520">March 2, 2014</a>
  </p>
</blockquote>



<blockquote class="twitter-tweet" width="500">
  <p>
    Make Apps not war <a href="https://twitter.com/search?q=%23spc14&src=hash">#spc14</a> <a href="https://twitter.com/search?q=%23sharepoint&src=hash">#sharepoint</a>
  </p>
  
  <p>
    &mdash; Dan Barker (@barkingd) <a href="https://twitter.com/barkingd/statuses/440212027932286976">March 2, 2014</a>
  </p>
</blockquote>



## Summary

So this was a good, fun and informative start for my first SPC. Saw some code, but nothing spectacular (key concepts were promised and I spotted them). The debates were great, too.

 [1]: http://www.sharepointconference.com/content/pre-post-days
 [2]: https://twitter.com/sharepointing
 [3]: https://twitter.com/sumanch
 [4]: https://twitter.com/kaevans
 [5]: https://twitter.com/richdizz
 [6]: http://melcher.it/wp-content/uploads/20140302_182554245_iOS.jpg
 [7]: http://t.co/1ETVFwOQyT
 [8]: http://bit.ly/spcs2s
 [9]: http://melcher.it/wp-content/uploads/20140302_185926193_iOS.jpg
 [10]: http://blogs.msdn.com/b/kaevans/archive/2013/02/23/sharepoint-2013-app-only-policy-made-easy.aspx
 [11]: http://melcher.it/wp-content/uploads/20140302_192204788_iOS.jpg
 [12]: http://melcher.it/s/1V
 [13]: http://melcher.it/s/1W
 [14]: http://melcher.it/wp-content/uploads/20140302_200145130_iOS.jpg
 [15]: http://melcher.it/wp-content/uploads/20140302_201945699_iOS1.jpg

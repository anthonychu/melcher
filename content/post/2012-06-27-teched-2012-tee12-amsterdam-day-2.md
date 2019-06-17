---
title: 'TechEd 2012 (#TEE12), Amsterdam —- Day 2'
author: Max Melcher
aliases:
   - "/post/2012-06-27-teched-2012-tee12-amsterdam-day-2/"
2012: "06"
type: post
date: 2012-06-27T18:00:18+00:00
url: /2012/06/teched-2012-tee12-amsterdam-day-2/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/i
categories:
  - Development
  - Misc
  - SharePoint 2010
  - TechEd 2012

---
Second day at Teched.

## Keynote: Windows 8

Lots of different features of the new Windows 8 are shown. Windows 2 GO demo was cool – you can boot an entire Windows from usb 3.0 stick. If you unplug the stick you have 60 seconds to replug it and everything continues to work. 

## First Session: Introducing the New Visual Studio 2012 Unit Testing Experience (Peter Provost)

Peter showed some new features of the new Visual Studio – looks great. Hoping that new SharePoint has proper support of the new Fakes/Shim test stuff. Would bring SharePoint development to a new level – higher quality for many of us. Many of this you could have used with some effort, it seems like things are getting much easier and faster.

As I am live writting – at the end Peter told the audience that there will be a Test Emulation Library for SharePoint Unit Testing – this is good news!!!

## Second Session: From Development To Production: Optimizing For Continuous Delivery (Chris Patterson)

Developer talk focused on Azure and TFS 2012 (Preview).

Key messages:

  1. Use the framework you want to use 
      1. MSTEST, Nunit, xUnit and Others 
  2. Unit tests drive quality 
  3. Use Isolation Framework (“Fakes” is deeply integrated into VS2012) 
  4. Iterate everything (Plan, Develop, Test) 

Take aways: Lots of new features for Devs - all will profit from that.

## Lunch session: Integrating SharePoint and Project Server 2010 – Deployment Approaches, Integration Options and making the most of the SharePoint Enterprise Features.

Lunch was short for this session but I wanted to see what you can do with that powerful combo. At Alegri we are using Project 2010 and SharePoint together but I have the feeling we are only using 20% - it seems like we are.

Key take aways: Change the master page and loose support! Workarround is to use the delegate control in the page head to add css/jquery to style stuff. Lots of additional work.

## Fifth session: Advanced SharePoint 2010 Upgrade Troubleshooting (Todd Klindt)

One of the most anticipated sessions for me.

Different upgrade scenarios, db attached upgrade deliveres good results. Start with SP2007 SP2 - for SP2010 most recent is CU Feb 2012 (start slipstreamed, except language packs!). Important if you attach UserProfile start with RTM (rumors ("smart people told me") are there are problems with it if you go post SP1). 

Always run preupgradecheck - large list issues (workflow history could be very large and prevents workflows to start in SP2010). 

Orphans: Delete them on SP2007 (several times with stsadm) then test-spcontentdatabase 

Use MSDN ULSViewer to analyze problems - time for a logging feature at www.sharepointtoolbox.de   
Use powershell for everything - Todd loves powershell and he is not a Dev!

If you see ID 75802 its Fab40 - check if you can delete it on the SP2007 side. DONT move them to SP2010 - huge side-effects if you do so.

Upgrade performance is limited by IO - fast disks => fast upgrade.

Get rid of unused document versions.

Themes: Install themes in SP2007 before mounting content database, otherwise you cant change your MasterPage in SP2010.

**Memo to myself:** Listen to Todds <a href="http://www.toddklindt.com/netcast/default.aspx" target="_blank">podcast</a> frequently - that was the best session so far at TechEd 2012.

## Sixth session: Exploring the Power of Page Layouts in SharePoint 2010 WCM Sites (John Ross, Randy Drisgill)

Page layouts are a powerful concept for SharePoint.

Pros: Encapsuling data based on a contenttype, inheritance if you want it, deployable, searchable.

Cons: No versioning

If you crate it with SharePoint Designer, things tend to be created in the content database and you pay a performance price for that. 

If you create it with Visual Studio take care that the contenttype id is correct (wow, very long),&#160; copy it from the url in the content type gallery or with CKSDEV in Visual Studio.

## Next session: Microsoft delegate party.

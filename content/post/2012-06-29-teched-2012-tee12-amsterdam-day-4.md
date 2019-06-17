---
title: 'TechEd 2012 (#TEE12), Amsterdam — Day 4'
author: Max Melcher
aliases:
   - "/post/2012-06-29-teched-2012-tee12-amsterdam-day-4/"
2012: "06"
type: post
date: 2012-06-29T15:47:41+00:00
url: /2012/06/teched-2012-tee12-amsterdam-day-4/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/z
categories:
  - Development
  - TechEd 2012

---
Last day at TechEd – today it will be an asp.net-ish day!

## First Session: Microsoft ASP.NET and the Realtime Web (Brady Gaster)

This gotta be SignalR – hopefully with cool demos. Actually they forgot the SignalR part in the title, the whole thing is about it.

Okay, first demo is SignalR with Kinect. Kinect detects a person, takes a picture, the picture is uploaded to azure and the link to the picture is pushed to “subscribed”, open browser.

9 demos.

Supported clients: JQuery, Native .NET, WP7, iOS, Silverlight, WinRT, Android.

Supported hosts: ASP.NET, OWIN, Self-hosted

Supported backplanes: SQL, Redis, Service Bus

Benchmarks: 40.000 persistent connections (40% CPU utilization) – goal for version 1.0 is 100.000 concurrent open connections.

The demos showed how to build basic applications (totally easy), use diffrent hosts and scale it on Azure.

Brady rocked the stage, really like his style – infotainment on a very high level!

## Second Session: Identify & Fix Performance Problems with Visual Studio 2012 Ultimate (Benjamin Day)

Session about the different methods to stress test a Web Application.

Web Performance Test => record actions and play them back

Load Test => mix of Web Performance Tests and Unit Tests (important: The Browser Mix just changes the User Agent, they are not using a real browser)

Limits if you run it from Visual Studio: 250 simultanious user, limited to 1 CPU. If you need more get Test Controller and Test Agents.

I used the Load/Performance Tests in VS2010 and I couldn’t identify a lot of new stuff.

## Last Session:  ASP.NET Roadmap: One ASP.NET - Web Forms, MVC, Web API and more (Brady Gaster)

MVC, Web Forms and Web Pages will have the same featureset. There will be a new Visual Studio Web Project template where you can choose what you want and after that nuget will pull the current version and create your project.

Async everwhere => Threads will be released and IIS can serve more requests.

Validation: UnobstrusiveValidationMode property of a page can enable html5 validation

Optimization: CSS / JS  Bundle & Minification: just set debug=false in the web.config and things are compressed, bundled. Supports Coffeescript and LESS.

Model-Binding: ASP.NET controls get a property ItemType to bind strongly typed entities. No more EVAL, good.

DynamicControl => bind it against a string property and it creates a label, an input field and validation. If you bind it against a DateTime prop, guess what its an DateTimeControl then  – slick.

## Final notes - TechEd 2012 is over!

TechEd was awesome as expected. Saw a lot of new technologies, new products – that will help me a lot in the future. The location and everything around was decent – very good speakers & sessions, too!

**Next TechEd will be booked – thats for sure!**

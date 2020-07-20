---
title: An Overview of the Microsoft Application Platform for Developers
author: Max Melcher
aliases:
   - "/post/2016-09-27-an-overview-of-the-microsoft-application-platform-for-developers/"
2016: "09"
type: post
date: 2016-09-27T02:17:44+00:00
url: /2016/09/an-overview-of-the-microsoft-application-platform-for-developers/
yourls_fetching:
  - "1"
categories:
  - Apps
  - Azure
  - Conference
  - Ignite 2016

---
Watch out, I am attending a developer session! Mainly because [Scott Hanselman][1] is the speaker and I totally love his style. Developers!

[{{< fancybox "/wp-content/uploads" "WP_20160926_11_17_42_Rich-e1474941906835.jpg" "" "single_image" >}}][2]

This session will give us a broad overview of all the new things for devs - so we start with the current options of Visual Studio:

12.7 Mio downloads of Visual Studio
  
2 Mio Visual Studio Code
  
4 Mio users of Visual Studio Team Services

{{< fancybox "/wp-content/uploads" "WP_20160926_11_18_17_Rich-e1474941951292.jpg" "" "single_image" >}}

&nbsp;

{{< fancybox "/wp-content/uploads" "WP_20160926_11_21_04_Rich-e1474941979782.jpg" "" "single_image" >}}

## Demo 1: Modernization

Porting sounds boring, modernization is a cooler word for it.

Transition from .NET Framework 2, 3, 4 to .NET Core - Visual Studio support all of them.

First demo on a Mac, running the CLI to create projects, restore packages - awesome.

{{< fancybox "/wp-content/uploads" "WP_20160926_11_26_47_Rich.jpg" "" "single_image" >}}

## Demo 2: Visual Studio 2015 and future improvements

Run with multiple browser. Browser link now syncs scrolling and user inputs across browsers - that is cool.

## Demo 3: Containers

Docker is confusing for most enterprises, but with the windows version it is much easier to run. Even integrated in Visual Studio into the "run with" dialog. The solution is then built and put into a docker image - even with debugging support.

## Demo 4: Azure Integration

Staging slots - run copies of your website in parallel and switch them back and forth into production aka. hot swaps. Then he shows "testing in production" where you can load balance e.g. 25% of all the traffic will be directed to staging instead of production. You can even automate that with powershell, eg. send them to staging, check for errors and in that case send them back to production. What could go wrong?!

Because so many viewers accessed Scott's public website, he did a live scale out with the push of a button. Awesome.

{{< fancybox "/wp-content/uploads" "WP_20160926_11_37_30_Rich-e1474942017807.jpg" "" "single_image" >}}

## Demo 5: Portable Code and native apps

Scott shows another demo were 90% of his code is in a portable class library. The rest of the code is device specific and stored in separate projects for IOS, Androws, Windows Phone or UWP. Live debug run on an iPhone simulator running iOS 10.

## Demo 6: Xamarin Test Cloud

Testing your app on multiple devices is effortless with Xamarin test cloud, you get memory consumption, error logs, videos of your tests - crazy stuff.

{{< fancybox "/wp-content/uploads" "WP_20160926_11_53_05_Rich.jpg" "" "single_image" >}}

## Demo 7: SharePoint Online

Scott show a document stored on SharePoint (!!!). Once the document is saved it will trigger an Azure Function app (server-less code) to notify clients that the document has changed. Automate the processes here is the main point.

{{< fancybox "/wp-content/uploads" "WP_20160926_11_55_21_Rich-e1474942045961.jpg" "" "single_image" >}}

## Demo 8: Azure Functions & Azure Cognitive Services

Drop an image to Azure blog storage, it gets processed by the azure function, sent to Azure Cognitive Service and alter the image to detect emotions.

{{< fancybox "/wp-content/uploads" "WP_20160926_12_15_13_Rich.jpg" "" "single_image" >}}

## Demo 9: Visual Studio Installer

Goal is to create a new installing experience with reduced installation time.

## Demo 10: Desktop App Converter

Brief introduction how to convert an existing application to a windows 10 store apps.

## Summary

Scott presented so fast and friction-less, it is tough to capture 10% in this post. Developer's life is so much more fun right now.
  
This session was super enlightening, go watch it once its online!

 [1]: http://www.hanselman.com/
 [2]: https://melcher.it/wp-content/uploads/WP_20160926_11_17_42_Rich-e1474941906835.jpg

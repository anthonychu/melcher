---
title: 'SPC14: Refactoring Business Solutions into Apps for Office'
author: Max Melcher
aliases:
   - "/post/2014-03-02-spc14-refactoring-business-solutions-apps-office/"
2014: "03"
type: post
date: 2014-03-02T22:03:24+00:00
url: /2014/03/spc14-refactoring-business-solutions-apps-office/
yourls_shorturl:
  - http://melcher.it/s/1Y
categories:
  - Apps
  - Conference
  - Deep Dive
  - Development
  - SharePoint 2013

---
> This session will focus in deep detail on one top 10 business scenario and showcase how it can be enabled with apps for Office. We will review the business scenario, the architectural considerations to enable this scenario in Windows Azure and apps for Office, as well as delving into the code behind the solution. Expect to see a lot and have experts available to you to answer any of your questions and concerns.

Another pre-conf session "Refactoring Business Solutions into Apps for Office" by [Richard diZerega][1], [Kirk Evans][2] and [Sonya Koptyev][3].

Here are my notes:

## Overview

Richard showed the options you have to deploy apps in a corporate environment – from cloud to corporate marketplace - and showed the different types of Office Apps – from Word to Excel.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_220146928_iOS" alt="20140302_220146928_iOS" src="http://melcher.it/wp-content/uploads/20140302_220146928_iOS_thumb.jpg" width="348" height="185" border="0" />][4]{.thickbox}

> When you use copy & paste something to Outlook – it’s a good candidate for a Mail App.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_220853244_iOS" alt="20140302_220853244_iOS" src="http://melcher.it/wp-content/uploads/20140302_220853244_iOS_thumb.jpg" width="348" height="185" border="0" />][5]{.thickbox}

## Demo

Richard created a Word App that triggers on a selection and can replace the selection with a link.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140302_224536861_iOS" alt="20140302_224536861_iOS" src="http://melcher.it/wp-content/uploads/20140302_224536861_iOS_thumb.jpg" width="244" height="184" border="0" />][6]{.thickbox}

He showed that in order to publish an Office App Project you basically need to publish twice. One time for the service (e.g. hosted on azure) and the second time for the App Manifest (xml file) where you tell Office how to reach the service and what type of office app it is.

## Binding

So that was a new thing to me – you can create bindings (subscriptions) to lets say a table – then if a condition changes my table gets updated automatically. Read more [here][7].

## Mail App

Kirk showed a Mail App and plenty of options how to get known entities out of emails – discovery of element inside an email (addresses, phone numbers and more) – good stuff.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140303_005018025_iOS" alt="20140303_005018025_iOS" src="http://melcher.it/wp-content/uploads/20140303_005018025_iOS_thumb.jpg" width="348" height="185" border="0" />][8]{.thickbox}

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140303_005104277_iOS" alt="20140303_005104277_iOS" src="http://melcher.it/wp-content/uploads/20140303_005104277_iOS_thumb.jpg" width="348" height="185" border="0" />][9]{.thickbox}

## Call to Action

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20140303_010315882_iOS" alt="20140303_010315882_iOS" src="http://melcher.it/wp-content/uploads/20140303_010315882_iOS_thumb.jpg" width="348" height="185" border="0" />][10]{.thickbox}

Kirk said there is more to come and more to announced during this SPC.

## Summary

Excel App & Mail App – would love to try that at a client but most of them are still on Office 2010. This session gave me a very good understanding what is possible and what not. Really liked the session, when Richard & Kirk present it always looks so easy <img class="wlEmoticon wlEmoticon-smile" style="border-style: none;" alt="Smiley" src="http://melcher.it/wp-content/uploads/wlEmoticon-smile1.png" />

 [1]: https://twitter.com/richdizz
 [2]: https://twitter.com/kaevans
 [3]: https://twitter.com/SonyaKoptyev
 [4]: http://melcher.it/wp-content/uploads/20140302_220146928_iOS.jpg
 [5]: http://melcher.it/wp-content/uploads/20140302_220853244_iOS.jpg
 [6]: http://melcher.it/wp-content/uploads/20140302_224536861_iOS.jpg
 [7]: http://msdn.microsoft.com/en-us/library/office/jj220067.aspx
 [8]: http://melcher.it/wp-content/uploads/20140303_005018025_iOS.jpg
 [9]: http://melcher.it/wp-content/uploads/20140303_005104277_iOS.jpg
 [10]: http://melcher.it/wp-content/uploads/20140303_010315882_iOS.jpg

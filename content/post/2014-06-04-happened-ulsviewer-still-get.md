---
title: What happened to ‘the’ ULSViewer and how to still get it?
author: Max Melcher
aliases:
   - "/post/2014-06-04-happened-ulsviewer-still-get/"
2014: "06"
type: post
date: 2014-06-04T08:55:23+00:00
url: /2014/06/happened-ulsviewer-still-get/
yourls_shorturl:
  - http://melcher.it/s/2L
categories:
  - Community
  - Tools

---
MSDN Archive has been retired this week - I do not know why they retired it before there is an adequate replacement for the majority of the tools, but it has a huge impact on my work. One of my favorite tool, the famous **ULSViewer** <del>is</del> was hosted there.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/http___archive.msdn_.microsoft.com_-Internet-Explorer_2014-06-04_10-32-05.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" src="http://melcher.it/wp-content/uploads/http___archive.msdn_.microsoft.com_-Internet-Explorer_2014-06-04_10-32-05_thumb.png" alt="You will be greeted with this beautiful page when you try to download the ULSViewer" width="244" height="203" border="0" /></a>
  
  <p class="wp-caption-text">
    You will be greeted with this beautiful page when you try to download the ULSViewer - no alternative download location so far!
  </p>
</div>

## ULSViewer - why would you miss it?

Why I love the tool?

  1. **its tiny** - with just 487kb you can grab it, copy it over the slowest RDP connection and start working in less than a minute.
  2. **its super fast** - even with the biggest ULS Logs you can still filter and search for correlations, full text and what not.
  3. **its just one file** - no installation, plain .exe file, it can not be simpler.
  4. **the filtering and coloring is superb** - reading the uls can be very challenging (sometimes you need true SharePoint Ninja Skills), but the filtering and coloring really helps me a lot.
  5. **it has real-time support** - watching what happens right when it happens - I hate wait times.
  6. **it supports all versions** - support for SharePoint 2007 - 2013 is just great!
  7. **its free** - I  used it for roughly 30 clients - no licensing costs helps quite a lot.

Additionally, just yesterday I solved an issue with the ULSViewer where the coloring and the real-time functionally was a major part of the issue identification.

{{< fancybox "/wp-content/uploads" "SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-06-03_10-55-30.png" "" "single_image" >}}

## BringBackULSViewer.com

Trevor Seward ([@NaupliusTrevor][1]) launched a [page][2] to express that we want the ULSViewer back - most favorably released with an Open Source license hosted on Github or Codeplex.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Bring Back ULSViewer! - Internet Explorer_2014-06-04_10-30-57" src="http://melcher.it/wp-content/uploads/Bring-Back-ULSViewer-Internet-Explorer_2014-06-04_10-30-57_thumb.png" alt="Bring Back ULSViewer! - Internet Explorer_2014-06-04_10-30-57" width="244" height="173" border="0" />][3]

If you did not participate in the [survey][4] - please do so now! Collecting our voices helps!

{{< fancybox "/wp-content/uploads" "https___onedrive.live_.com_survey_residCBCE97C71A32BCAE7278authkeyAPsm6fKZjm_2014-06-04_11-16-53.png" "" "single_image" >}}

## How to still get it?

There are three options:

### 1. You downloaded it already

Easy one - just don’t loose the file. OneDrive it and you cant loose it, right ?

### 2. You can download it from Todd Klindt

If Tood uses ULSViewer, it has to be good, right? Todd mirrors the ULSViewer on his blog - download it [here][5].

### 3. Coolest solution: Download it with PowerShell

Install [chocolatey][6] (takes 30 seconds) and use the following command

<pre>cinst ulsviewer</pre>

This downloads the ulsviewer and creates a shortcut on your desktop - <span style="text-decoration: underline;">in less than a minute in total</span> - quite handy and super fast!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Clipboard_2014-06-04_10-50-24" src="http://melcher.it/wp-content/uploads/Clipboard_2014-06-04_10-50-24_thumb.png" alt="Clipboard_2014-06-04_10-50-24" width="244" height="144" border="0" />][7]

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="_2014-06-04_10-53-23" src="http://melcher.it/wp-content/uploads/2014-06-04_10-53-23_thumb.png" alt="_2014-06-04_10-53-23" width="244" height="184" border="0" />][8]

## More chocolatey?

  1. [Install SharePoint Designer with Chocolatey][9]
  2. [Updated Chocolatey with more tools][10]
  3. [Little helpers for "lazy" developers][11]
  4. [Install ULSViewer with Powershell][12]

 [1]: https://twitter.com/NaupliusTrevor "NaupliusTrevor on Twitter"
 [2]: http://bringbackulsviewer.com/
 [3]: http://melcher.it/wp-content/uploads/Bring-Back-ULSViewer-Internet-Explorer_2014-06-04_10-30-57.png
 [4]: http://1drv.ms/1rFbVUf
 [5]: http://www.toddklindt.com/ulsviewer
 [6]: http://chocolatey.org
 [7]: http://melcher.it/wp-content/uploads/Clipboard_2014-06-04_10-50-24.png
 [8]: http://melcher.it/wp-content/uploads/2014-06-04_10-53-23.png
 [9]: http://melcher.it/2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/
 [10]: http://melcher.it/2013/06/updated-chocolatey-with-more-tools/
 [11]: http://melcher.it/2013/03/chocolatey-created-two-new-sharepoint-helpers/
 [12]: http://melcher.it/2014/01/install-sharepointlogviewer-powershell/

---
title: 'Get ALL your #SharePoint tools installed in 20 minutes'
author: Max Melcher
aliases:
   - "/post/2012-11-12-get-all-your-sharepoint-tools-installed-in-20-minutes/"
2012: "11"
type: post
date: 2012-11-12T14:43:42+00:00
url: /2012/11/get-all-your-sharepoint-tools-installed-in-20-minutes/
yourls_shorturl:
  - http://melcher.it/s/q
categories:
  - Development
  - ITPro
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013
  - Tools

---
A [while ago I wrote][1] about <a title="chocolatey.org" href="http://chocolatey.org" target="_blank">chocolatey</a> and how to install a lot tools automatically. Thats especially handy if you have to set up a new environment for SharePoint 2013 RTM&#8230;

## Now even more

Today and yesterday I added two more packages - two tools that I always use and now I can add them in my scripted setup: <a title="ULSViewer" href="http://archive.msdn.microsoft.com/ULSViewer" target="_blank">ULSViewer</a> and <a title="CKSDev Server" href="http://cksdev.codeplex.com/" target="_blank">CKSDEV (Server)</a>

## CKSDev

The Visual Studio Extension is installed if you have a Visual Studio 2010 or 2012 installed. This is the server version of cksdev.

Install with:

<pre>cinst cksdevserver</pre>

## ULSViewer

The ULSViewer is installed and a shortcut is added on your desktop - quite handy. Please keep in mind that this is the microsoft ulsviewer not the one from codeplex.

Install with:

<pre>cinst ulsviewer</pre>

## Add new packages!

Adding of packages was not that easy (<a title="Create Chocolatey Packages" href="https://github.com/chocolatey/chocolatey/wiki/CreatePackages" target="_blank">start here</a>), but after one hour or two you get used to it - basically its powershell and some nuget related stuff. Go for it!

## MyGet Feed

I updated my MyGet Feed and with

<pre>cinst all -source https://www.myget.org/F/sharepointdev</pre>

you install now:

  * 7zip
  * Adobe Reader
  * Fiddler
  * git
  * gitextensions
  * github for Windows
  * notepad++
  * GoogleChrome
  * dotPeek
  * smtp4dev
  * ULSViewer
  * CKSDevServer

 [1]: http://melcher.it/2012/08/install-all-the-good-sharepoint-tools-with-one-line-of-powershell-chocolatey/ "Install all the good SharePoint tools with one line of powershell – #chocolatey"

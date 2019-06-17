---
title: 'Install all the good SharePoint tools with one line of powershell – #chocolatey'
author: Max Melcher
aliases:
   - "/post/2012-08-17-install-all-the-good-sharepoint-tools-with-one-line-of-powershell-chocolatey/"
2012: "08"
type: post
date: 2012-08-17T13:07:54+00:00
url: /2012/08/install-all-the-good-sharepoint-tools-with-one-line-of-powershell-chocolatey/
yourls_shorturl:
  - http://melcher.it/s/E
categories:
  - Development
  - Tools

---
Okay I am in love with a new tool called <a href="http://chocolatey.org/" target="_blank">chocolatey</a> – its a package manager like “apt-get” for windows systems based on the very awesome nuget – and this neat piece of software can install other software. Its very easy to add software or packages and there are even galleries (340 packages in the main gallery yet) or feeds where you get a good start.

## 

## Chocolatey

So installation of this package manager must be very complicated…. nope – one line, just copy it to a command line (CMD):

<pre lang="text" line="1">@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin</pre>

You can get more information about chocolatey <a href="http://chocolatey.org" target="_blank">here</a>.

## myget

With <a href="http://www.myget.org/" target="_blank">myget</a> you can manage packages (basic plan is free) and the cool thing is you can install a lot of packages/software in one go.

## 

## myget Feed for SharePoint Development

Recently I installed a lot of SharePoint Dev- and Demo-Rigs, both SharePoint 2010 and SharePoint 2013 – and I always install the same toolset. With chocolatey/myget I am able to automate and manage my basic tools in a very comfortable way, installed 10 tools in roughly 15 minutes. I like that.

If you wanna install my SharePoint development tools feed (not yet complete but I will update the feed and this blog post). Would love feedback about the collection!

<pre lang="powershell" line="1">cinst all -source https://www.myget.org/F/sharepointdev</pre>

## 

## Packages in my feed

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

## 

## Packages I am missing

I would love more SharePoint tools like ULSViewer, CKSDev, SharePoint Manager, SharePoint dispose checker… what do you think? Should we add them?

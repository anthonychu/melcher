---
title: 'Chocolatey Package: SharePoint 2013 Search Query Tool'
author: Max Melcher
aliases:
   - "/post/2013-02-09-chocolatey-package-sharepoint-2013-search-query-tool/"
2013: "02"
type: post
date: 2013-02-09T10:00:04+00:00
url: /2013/02/chocolatey-package-sharepoint-2013-search-query-tool/
yourls_shorturl:
  - http://melcher.it/s/l
categories:
  - Customization
  - Development
  - Powershell
  - SharePoint 2013
  - Tools

---
I am a huge fan of automation and powershell  - this should explain why I really love <a title="chocolatey" href="http://chocolatey.org/" target="_blank">chocolatey </a>(a package manager to install software with powershell).

Today I created a new feed for SharePoint 2013 Development Tools: [http://www.myget.org/feed/Packages/sharepoint2013dev][1] and uploaded the very cool <a title="Search Query Tool" href="http://sp2013searchtool.codeplex.com/" target="_blank">SharePoint 2013 Search Query Tool</a> to the chocolatey <a title="Gallery" href="http://chocolatey.org/packages" target="_blank">gallery</a>. This tool helps creating and testing search querries - and search is everywhere in SharePoint 2013!

&nbsp;

After installing chocolatey you can get a great starter toolset with one line of powershell:

<pre>cinst all -source <a href="http://www.myget.org/F/sharepoint2013dev">https://www.myget.org/F/sharepoint2013dev</a></pre>

This installs 18 tools for SharePoint 2013 development - all of my favorites are included. I maintain a [second feed][2] on MyGet for SharePoint 2010 tools, I guess the SP2013 feed will grow and diverge over time.

 [1]: http://www.myget.org/F/sharepoint2013dev/ "http://www.myget.org/feed/Packages/sp2013dev"
 [2]: http://www.myget.org/F/sharepointdev/ "SharePoint 2010 MyGet feed"

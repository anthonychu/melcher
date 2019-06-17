---
title: Install SharePointLogViewer with PowerShell
author: Max Melcher
aliases:
   - "/post/2014-01-13-install-sharepointlogviewer-powershell/"
2014: "01"
type: post
date: 2014-01-13T12:45:54+00:00
url: /2014/01/install-sharepointlogviewer-powershell/
yourls_shorturl:
  - http://melcher.it/s/1G
categories:
  - Powershell
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013
  - Tools

---
Another essential SharePoint tool found its way to the [chocolatey gallery][1] – this time it’s the awesome and feature-rich [SharePointLogViewer][2].

![SharePoint Log Viewer][3]

**Key Features:**

  * View multiple SharePoint log files at once
  * Search by any field
  * Filter the log by any field
  * File drag & drop support
  * Live monitoring for <span style="text-decoration: underline;">entire farm</span>
  * Export filtered log entries
  * Bookmark log entries
  * Get popup notification of SharePoint log events from system tray
  * Receive email notifications on errors
  * Redirect log entries to event log
  * Supports SharePoint 2007, 2010 and 2013

## Installation

After [installing chocolatey][4] you can install SharePointLogViewer with one line of Powershell:

<pre lang="powershell">cinst SharePointLogViewer</pre>

<span style="line-height: 1.5em;">as you can see in this screenshot:</span>

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb29.png" width="244" height="96" border="0" />][5]{.thickbox}

&nbsp;

The result is a nice shortcut on your desktop - everything ready to go.

## Chocolatey?

> Chocolatey NuGet is a Machine Package Manager, somewhat like apt-get, but built with Windows in mind.

In other words: You can install tools/software with this tool.

I wrote several blog posts about this:

  1. [Install SharePoint Designer with Chocolatey][6]
  2. [Chocolatey and SharePoint][7]
  3. [SharePoint Search Query Tool][8]
  4. [Install all the great SharePoint Tools with one line of PowerShell][9]

and even created a video:

<span class="embed-youtube" style="text-align:center; display: block;"></span>

## Do you miss a tool?

If you miss a tool, I would be happy to add it. Please leave a comment.

 [1]: http://chocolatey.org
 [2]: https://sharepointlogviewer.codeplex.com/
 [3]: http://download-codeplex.sec.s-msft.com/Download?ProjectName=sharepointlogviewer&DownloadId=124419
 [4]: http://chocolatey.org/ "Install chocolatey"
 [5]: http://melcher.it/wp-content/uploads/image29.png
 [6]: http://melcher.it/2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/
 [7]: http://melcher.it/2013/06/updated-chocolatey-with-more-tools/
 [8]: http://melcher.it/2013/02/chocolatey-package-sharepoint-2013-search-query-tool/
 [9]: http://melcher.it/2012/08/install-all-the-good-sharepoint-tools-with-one-line-of-powershell-chocolatey/

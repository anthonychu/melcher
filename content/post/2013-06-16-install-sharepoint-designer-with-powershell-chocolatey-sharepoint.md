---
title: Install SharePoint Designer with PowerShell – Chocolatey SharePoint
author: Max Melcher
aliases:
   - "/post/2013-06-16-install-sharepoint-designer-with-powershell-chocolatey-sharepoint/"
2013: "06"
type: post
date: 2013-06-16T15:20:49+00:00
url: /2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/
yourls_shorturl:
  - http://melcher.it/s/f
categories:
  - Powershell
  - SharePoint 2010
  - SharePoint 2013
  - Tools

---
Almost weekly there is a new tool that you can install with the very awesome chocolatey. In the case you have not heard about chocolatey, its a package manager for Windows similar to apt-get for linux - in other words: You can install tools/software with 1 line of Powershell. <!--more--> This week @

<a href="https://twitter.com/avishnyakov" rel="contributor" data-skip-pjax="true">avishnyakov</a>&nbsp;created 4 packages to install SharePoint Designer. You can choose to install it for SharePoint 2010 or SharePoint 2013. Its recommended to install SharePoint Designer in the same bitness as you have installed Office (in the case you have) - so you can pick the 32bit or 64bit version.

## How?

Installing software with chocolatey is quite simple - just open a CMD and copy this line in:

<pre>@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin</pre>

Thats it - you now can install packages with Powershell. Pretty easy! Currently there are over 1000 packages available - I automated my whole environment with it. For the SharePoint Tooling its a little different, but at least 19 tools are available, yet.

<div id="attachment_717" style="width: 515px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20.png"><img data-attachment-id="717" data-permalink="https://melcher.it/2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/chocolatey-gallery-_-packages_2013-06-16_16-50-20/" data-orig-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20.png" data-orig-size="1011,605" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Chocolatey Gallery" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20-300x179.png" data-large-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20.png" class=" wp-image-717 " alt="1067 packages are waiting for you! " src="http://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20.png" width="505" height="302" srcset="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20.png 1011w, https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20-300x179.png 300w, https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20-930x556.png 930w, https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages_2013-06-16_16-50-20-765x457.png 765w" sizes="(max-width: 505px) 100vw, 505px" /></a>
  
  <p class="wp-caption-text">
    1067 packages are waiting for you!
  </p>
</div>

## SharePoint Packages

You can install:

  * [Microsoft Sharepoint 2010 Software Development Kit][1]
  * [SharePoint Hive Short Cut (Desktop)][2]
  * [SharePoint Manager 2013][3]
  * [SharePoint Hive Short Cut (Explorer)][4]
  * [SharePoint Manager 2010][5]
  * [ULSViewer][6]
  * [SharePoint Manager 2007][7]
  * [CKS Dev Server][8]
  * [SharePoint Code Quality Tools (Online)][9]
  * [SharePoint Software Factory (SPSF)][10]
  * [SearchQueryTool][11]
  * [SharePoint 2013 Prerequisites Downloader (Online)][12]
  * [CKS Dev][13]
  * [CAML Designer][14]
  * [CAML Designer 2013][15]
  * [SharePoint Designer 2010 32bit][16]
  * [SharePoint Designer 2010 64bit][17]
  * [SharePoint Designer 2013 32bit][18]
  * [SharePoint Designer 2013 64bit][19]

<div id="attachment_719" style="width: 515px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages-matching-sharepoint_2013-06-16_17-08-25.png"><img data-attachment-id="719" data-permalink="https://melcher.it/2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/chocolatey-gallery-_-packages-matching-sharepoint_2013-06-16_17-08-25/" data-orig-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages-matching-sharepoint_2013-06-16_17-08-25.png" data-orig-size="1017,605" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Chocolatey Gallery SharePoint Packages" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages-matching-sharepoint_2013-06-16_17-08-25-300x178.png" data-large-file="https://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages-matching-sharepoint_2013-06-16_17-08-25.png" class=" wp-image-719 " alt="19 SharePoint Packages are installable with 1 line of Powershell" src="http://melcher.it/wp-content/uploads/Chocolatey-Gallery-_-Packages-matching-sharepoint_2013-06-16_17-08-25.png" width="505" height="302" /></a>
  
  <p class="wp-caption-text">
    19 SharePoint Packages are installable with 1 line of Powershell
  </p>
</div>


  
This list gets bigger and bigger!

After running the command from above, open a new PowerShell and type

<pre>cinst SharePointDesigner2013x64</pre>

and SharePoint Designer is installed for you:
  
[<img data-attachment-id="725" data-permalink="https://melcher.it/2013/06/install-sharepoint-designer-with-powershell-chocolatey-sharepoint/sharepoint2013-remote-desktop-connection_2013-06-16_17-16-47/" data-orig-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47.png" data-orig-size="1407,268" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Install SharePoint Designer with PowerShell" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-300x57.png" data-large-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-1024x195.png" class="aligncenter size-full wp-image-725" alt="Install SharePoint Designer with PowerShell" src="http://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47.png" width="1407" height="268" srcset="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47.png 1407w, https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-300x57.png 300w, https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-1024x195.png 1024w, https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-930x177.png 930w, https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47-765x145.png 765w" sizes="(max-width: 1407px) 100vw, 1407px" />][20]

## Something missing?

Is your favorite tool missing? If so, please leave a comment!

 [1]: http://chocolatey.org/packages/sharepoint.2010.sdk
 [2]: http://chocolatey.org/packages/SharePoint.HiveShortcut.Desktop
 [3]: http://chocolatey.org/packages/SharePointManager2013
 [4]: http://chocolatey.org/packages/SharePoint.HiveShortcut.Explorer
 [5]: http://chocolatey.org/packages/SharePointManager2010
 [6]: http://chocolatey.org/packages/ulsviewer
 [7]: http://chocolatey.org/packages/SharePointManager2007
 [8]: http://chocolatey.org/packages/cksdevserver
 [9]: http://chocolatey.org/packages/SPCAF
 [10]: http://chocolatey.org/packages/SPSF
 [11]: http://chocolatey.org/packages/SearchQueryTool
 [12]: http://chocolatey.org/packages/SP2013PreReqs
 [13]: http://chocolatey.org/packages/cksdev11
 [14]: http://chocolatey.org/packages/CAMLDesigner2013
 [15]: http://chocolatey.org/packages/CAMLDesigner2010
 [16]: http://chocolatey.org/packages/SharePointDesigner2010x32
 [17]: http://chocolatey.org/packages/SharePointDesigner2010x64
 [18]: http://chocolatey.org/packages/SharePointDesigner2013x32
 [19]: http://chocolatey.org/packages/SharePointDesigner2013x64
 [20]: http://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-16_17-16-47.png

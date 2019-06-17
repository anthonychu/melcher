---
title: '#SharePoint 2013 Search – The gatherer service cannot be initialized'
author: Max Melcher
aliases:
   - "/post/2013-03-19-sharepoint-2013-search-the-gatherer-service-cannot-be-initialized/"
2013: "03"
type: post
date: 2013-03-19T16:30:25+00:00
url: /2013/03/sharepoint-2013-search-the-gatherer-service-cannot-be-initialized/
yourls_shorturl:
  - http://melcher.it/s/8
categories:
  - ITPro
  - Search
  - SharePoint 2013

---
I installed SharePoint 2013 on a test system yesterday and was faced with the problem that the search, after successfully provisioning it - did not work. Boo!

## Symptoms

There are several noticeable Symptoms

The crawl log shows 1 Top Level Error and 1 Error:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image10.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb10.png" width="244" height="61" border="0" /></a>
  
  <p class="wp-caption-text">
    Crawl log with 1 Top Level Error and 1 Error
  </p>
</div>

The Eventlog shows some warnings and an error

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Error_2.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Error_2" alt="Error_2" src="http://melcher.it/wp-content/uploads/Error_2_thumb.png" width="244" height="192" border="0" /></a>
  
  <p class="wp-caption-text">
    Eventlog with the error "The gatherer service cannot be initialized"
  </p>
</div>

with the following text – not the best error description (again):

<pre>The gatherer service cannot be initialized.
Details:
The Temp folder is on a drive that is full or is inaccessible. Free up space on the drive or verify that you have write permission on the Temp folder.   (0x80070660)</pre>

## Solution

In my case the solution was quite simple. The Temp folder is not the **%WINDIR%\Temp** or **C:\Temp** folder – it’s the location of the search index. I installed SP2013 with [AutoSPInstaller][1] (<= highly recommended!) with default values, then the index is located in **C:\Program Files\Microsoft Office Servers\14.0\Data\Office Server\Applications** 

If you provisioned the Search Service with my [powershell script][2] – then you can customized the Index Location with the $IndexLocation variable in the settings region.

I can’t tell yet if that problem is related to my installation –. I tried to get more information about this problem and it seems like this could happen if you relocated your index, too.

Now to fix the problem, **modify the permissions** of the Applications folder or the parent folder of your search location.

Grant the local **WSS_WPG** group at least modify permissions on the folder – in my screenshot I granted full control, it's just a test system…

Then restart the Search Service, easiest with PowerShell:

<pre lang="powershell">Restart-Service osearch15</pre>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Permissions.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Permissions" alt="Permissions" src="http://melcher.it/wp-content/uploads/Permissions_thumb.png" width="244" height="145" border="0" /></a>
  
  <p class="wp-caption-text">
    Altered permissions to fix the issue
  </p>
</div>

## 

## Did it work for you?

If (not) – would love to hear your feedback!

 [1]: http://autospinstaller.codeplex.com
 [2]: http://melcher.it/2012/07/sharepoint-2013-create-a-search-service-application-and-topology-with-powershell/

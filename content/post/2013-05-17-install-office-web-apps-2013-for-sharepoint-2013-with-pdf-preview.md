---
title: Install Office Web Apps 2013 for SharePoint 2013 – with PDF Preview
author: Max Melcher
aliases:
   - "/post/2013-05-17-install-office-web-apps-2013-for-sharepoint-2013-with-pdf-preview/"
2013: "05"
type: post
date: 2013-05-17T17:57:58+00:00
url: /2013/05/install-office-web-apps-2013-for-sharepoint-2013-with-pdf-preview/
yourls_shorturl:
  - http://melcher.it/s/4
categories:
  - Office Web Apps 2013

---
Preview of Office Documents (this includes PDF) is a huge benefit when you are searching for information – you can quickly identify if the document is the one you are looking for or skimming/scanning a document efficiently. To get the preview up and running you have to install Office Web Apps 2013 – PDF preview was added in March Public Update 2013 – that’s great, many clients have asked me why there is no support in the 2010 stack. But its 2013 – so let’s install Office Web Apps 2013 for SharePoint 2013!

## Overview

I did the following steps on my SharePoint 2013 DEV environment. The SP2013 environment was already on March PU because of the awesome <a href="http://autospinstaller.codeplex.com/" target="_blank">AutoSPInstaller</a>/<a href="http://autospsourcebuilder.codeplex.com/" target="_blank">AutoSPSourceBuilder</a> combo. As host I used a virtualized (Hyper-V) Windows Server 2012 with 4 cores and 5gb RAM on my Notebook (Lenovo W520).

## Requirements

You can’t install Office Web Apps on a SharePoint or SQL Server. Additionally the SharePoint Server has to use claims-based authentication. Read all the requirements <a href="http://technet.microsoft.com/en-us/library/jj219435.aspx#software" target="_blank">here</a>.

## 7 easy steps!

  1. Install the PreRequisites
  2. Restart the computer
  3. Download and install Office Web Apps 2013
  4. Download and install March Public Update for OWA 2013
  5. Create the OWA Farm
  6. Configure the binding on the SharePoint side
  7. Do a full crawl

## PreRequisites for Server 2012

<div class="avia-box alert    ">
  <span class="avia-innerbox" >Note: For PreRequisites of Server 2008 R2 read the <a href="http://technet.microsoft.com/de-de/library/jj219455.aspx">technet</a> article. If you can not install KB2592525 read this <a href="http://erpcoder.wordpress.com/2013/03/04/office-web-apps-server-kb2592525-installation-failed/">blog post</a> by Markus Nöbauer.</span>
</div>

<span style="line-height: 1.5em;">The installer of the Office Web Apps 2013 is a little bit limited – other than the SharePoint 2013 it does not configure the host. But at least you can automate the whole process. Run PowerShell as admin on the OWA server:</span>

<pre lang="powershell">Import-Module servermanager
Add-WindowsFeature Web-Server, Web-WebServer, Web-Common-Http, Web-Static-Content, Web-App-Dev, Web-Asp-Net, Web-Net-Ext, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Includes, Web-Security, Web-Windows-Auth, Web-Filtering, Web-Stat-Compression, Web-Dyn-Compression, Web-Mgmt-Console, InkAndHandwritingServices, Web-Net-Ext45, Web-Asp-Net45</pre>

Restart the computer afterwards.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-02-331.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Starting to automate the Prerequisites" src="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-02-33_thumb1.png" alt="" width="244" height="144" border="0" /></a>
  
  <p class="wp-caption-text">
    PowerShell addicted - starting to automate the PreRequisites installation.
  </p>
</div>

## Download and install Office Web Apps 2013

The installation is quite simple, hit next several times – nothing magic here.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-09-181.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="OWA installation folder" src="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-09-18_thumb1.png" alt="" width="244" height="99" border="0" /></a>
  
  <p class="wp-caption-text">
    OWA installation folder
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-09-011.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="OWA installation in progress" src="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_18-09-01_thumb1.png" alt="OWA installation in progress" width="244" height="223" border="0" /></a>
  
  <p class="wp-caption-text">
    OWA installation in progress
  </p>
</div>

## Download and install the March Public Update

After the installation just copy the <a href="http://www.microsoft.com/en-us/download/details.aspx?id=36981" target="_blank">OWA March 2013 PU</a> on the box and install it. Again, an easy task.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_19-02-561.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Installing March PU 2013" src="http://melcher.it/wp-content/uploads/192.168.137.50-Remote-Desktop-Connection_2013-05-17_19-02-56_thumb1.png" alt="" width="244" height="81" border="0" /></a>
  
  <p class="wp-caption-text">
    Installing March PU 2013
  </p>
</div>

## Create the OWA Farm

After installation and patching, we have to use PowerShell again:

<pre lang="powershell">New-OfficeWebAppsFarm -InternalURL http://owa2013.demo.com -AllowHttp –EditingEnabled</pre>

With New-OfficeWebAppsFarm – you have certainly guessed it - we created the first node of our OWA farm, just replace the internal url with your hostname/FQDN. Because I have a simple DEV environment I did not use https and allowed editing – for editing you need Office licenses, **view-only is free** (awesome, thanks!). Add the OWA binding on the <span style="text-decoration: underline;">SharePoint machine</span>, run this in a SharePoint Powershell:

<pre lang="powershell">New-SPWOPIBinding -ServerName owa2013.demo.com –AllowHTTP 
Set-SPWopiZone -zone "internal-http"</pre>

Two commands and the two are coupled - great.

## Preview

In my opinion seeing the document upfront is huge - a picture worth a thousand words - sooo true! Lets look at the result:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sp2013-Remote-Desktop-Connection_2013-05-17_19-54-381.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="A preview in a document library" src="http://melcher.it/wp-content/uploads/sp2013-Remote-Desktop-Connection_2013-05-17_19-54-38_thumb1.png" alt="A preview in a document library" width="244" height="86" border="0" /></a>
  
  <p class="wp-caption-text">
    A picture is worth a thousand words - I like the preview.
  </p>
</div>

## Enable PDF Preview in Search results

[Wictor][1] wrote a nice article about how to enable the PDF-Preview - if you followed my guide you do not need to enable it, it's already set. The only part that is missing is the Display Template.

The quick and dirty Powershell approach to enable PDF Previews in search results:

<pre lang="powershell">$tenantOwner = Get-SPEnterpriseSearchOwner -Level SSA
$ssa = "Search Service Application" #adjust if you renamed the service application

$rule = get-SPEnterpriseSearchPropertyRule -PropertyName "FileType" -Operator "IsEqual"
$rule.AddValue( "pdf" )
$ruleCollection = Get-SPEnterpriseSearchPropertyRuleCollection
$ruleCollection.Add($rule)

$item = new-SPEnterpriseSearchResultItemType -Owner $tenantOwner -SearchApplication $ssa -Name "PDF with Preview" -Rules $ruleCollection -RulePriority 1 -DisplayProperties "Title,Author,Size,Path,Description,EditorOWSUSER,LastModifiedTime,CollapsingStatus,DocId,HitHighlightedSummary,HitHighlightedProperties,FileExtension,ViewsLifeTime,P
arentLink,ViewsRecent,FileType,IsContainer,SecondaryFileExtension,DisplayAuthor,docaclmeta,ServerRedirectedURL,SectionNames,SectionIndexes,ServerRedirectedEmbedURL,S
erverRedirectedPreviewURL" -DisplayTemplateUrl "~sitecollection/_catalogs/masterpage/Display Templates/Search/Item_Word.js" -OptimizeForFrequentUse $true</pre>

## Do a full crawl

There is one managed property containing the link how to embed the preview of the document - this one is built during a crawl. So just do a full crawl and everything should be set.

## Short video

If you wanna see the Preview in action, watch the following video:

<span class="embed-youtube" style="text-align:center; display: block;"></span>

## References:

The Server must be joined to a domain: <http://bernado-nguyen-hoan.com/2013/01/22/cant-create-new-office-web-apps-farm-the-server-must-be-joined-to-a-domain/>

Install PreReqs for OWA RC: <http://blogs.itacs.de/Consulting/Lists/Beitraege/Post.aspx?ID=70>

New-OfficeWebAppFarm: <http://technet.microsoft.com/en-us/library/jj219436.aspx>

New-SPWOPIBinding: <http://technet.microsoft.com/en-us/library/jj219441.aspx>

Set-SPWopiZone: <http://technet.microsoft.com/en-us/library/jj219439.aspx>

Office Web Apps Powershell cmdlets: <http://technet.microsoft.com/en-us/library/jj219457.aspx>

## Do you like it?

Questions, comments or feedback, just hit the comments!

 [1]: http://www.wictorwilen.se/sharepoint-2013-enabling-pdf-previews-with-office-web-apps-2013-march-2013-update "Wictor Wilen"

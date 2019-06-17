---
title: 'SharePoint 2013: Replace the PDF icon'
author: Max Melcher
aliases:
   - "/post/2012-09-18-sharepoint-2013-replace-the-pdf-icon/"
2012: "09"
type: post
date: 2012-09-18T11:55:13+00:00
url: /2012/09/sharepoint-2013-replace-the-pdf-icon/
yourls_shorturl:
  - http://melcher.it/s/v
categories:
  - Customization
  - Search
  - SharePoint 2013

---
## Icon madness

I uploaded a PDF to SharePoint 2013 and noticed that the PDD icon is not the official and recognizable Adobe PDF icon. In this article I will tell you how to replace the SharePoint 2013 PDF icon.

<div style="width: 86px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/MS_PDF_ICON.png" rel="lightbox"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="MS_PDF_ICON" src="http://melcher.it/wp-content/uploads/MS_PDF_ICON_thumb.png" alt="MS_PDF_ICON" width="76" height="76" border="0" /></a>
  
  <p class="wp-caption-text">
    OOTB PDF icon from SharePoint 2013
  </p>
</div>

Is it a document with a belt or what ? Nevermind I don’t like it and I am very certain that most of the users out there do not recognize the icon – and that is the main purpose of the icon right?

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Search_WithMSPDF.png" rel="lightbox"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="PDF Icon with SP2013 OOTB" src="http://melcher.it/wp-content/uploads/Search_WithMSPDF_thumb.png" alt="Search_WithMSPDF" width="244" height="188" border="0" /></a>
  
  <p class="wp-caption-text">
    Search result with out-of-the-box SharePoint 2013 PDF icon
  </p>
</div>

With SharePoint 2010 there was no PDF support out of the box – afaik there was no icon at all. I should be happy and quite right? Nope, created a small powershell that replaced the icon (either you place it next to the script or the script downloads it from the Adobe page).

The result will look like this – way better if you ask me.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Search_WithOriginalPDF.png" rel="lightbox"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Search results with original Adobe PDF icon" src="http://melcher.it/wp-content/uploads/Search_WithOriginalPDF_thumb.png" alt="Search_WithOriginalPDF" width="244" height="182" border="0" /></a>
  
  <p class="wp-caption-text">
    Original PDF icon - as expected!
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/PDF_Doclib.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="SharePoint 2013 Doclib with original Adobe PDF icon" src="http://melcher.it/wp-content/uploads/PDF_Doclib_thumb.png" alt="PDF_Doclib" width="244" height="62" border="0" /></a>
  
  <p class="wp-caption-text">
    Same icon in a document library
  </p>
</div>

&nbsp;

## Powershell to the rescue - once again!

And here comes the small script:

<pre lang="powershell" line="1" class="">#########################################################################################
# by Max Melcher, http://melcher.it, @maxmelcher
# Feel free to change and reuse as you wish - use on your own risk

# Script that replaces the OOTB SharePoint 2013 PDF icon with the orignal Adobe PDF icon.
# Execute on each webfrontend
#########################################################################################

#settings
$destination = "C:\Program Files\Common Files\microsoft shared\Web Server Extensions\15\TEMPLATE\IMAGES\icpdf.png"

#Check if the icon exists otherwise download it
$item = Get-ChildItem pdficon_small.png -ErrorAction SilentlyContinue

#Helper
function download{
 # usage: download http://url c:\temp
 param([string]$URL, [string]$destination)
 Write-Host "Downloading $URL ..." 
 $clnt = new-object System.Net.WebClient -ErrorVariable err -ErrorAction "SilentlyContinue" 
 $clnt.DownloadFile($url,$destination) 
 
 if ([String]::IsNullOrEmpty($err) -eq $true) 
 { 
 Write-Output " - Download completed."
 } 
 else 
 { 
 Write-Error "Download ERROR - Check URL: $err" 
 }
}

function RestartIIS(){
$title = "Restart IIS"
$message = "Do you want to restart the local IIS?"
$yes = New-Object System.Management.Automation.Host.ChoiceDescription "Yes","Restarts IIS."
$no = New-Object System.Management.Automation.Host.ChoiceDescription "No","Silently continues..."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$result = $host.ui.PromptForChoice($title, $message, $options, 0) 
 if ($result -eq 0){
 Write-Host -ForegroundColor Yellow "Restarting IIS"
 iisreset /noforce
 }
}


if ($item)
{ 
 Write-Host -ForegroundColor Yellow "Supplied icon found - overwriting"
 Copy-Item $item -Destination $destination -Force
}
else
{
 Write-Host -ForegroundColor Yellow "Downloading icon from Adobe"
 Download "http://www.adobe.com/images/pdficon_small.png" $destination
}

Write-Host -ForegroundColor Green "Icon replaced"

#Icon will only be changed after iisreset or reboot
RestartIIS


Write-Host -ForegroundColor Green "done!"</pre>

&nbsp;

## Thats it – go try it!

As always, would love to hear your feedback.

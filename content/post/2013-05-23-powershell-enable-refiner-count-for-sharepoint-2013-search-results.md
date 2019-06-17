---
title: 'Powershell: Enable Refiner Count for SharePoint 2013 Search Results'
author: Max Melcher
aliases:
   - "/post/2013-05-23-powershell-enable-refiner-count-for-sharepoint-2013-search-results/"
2013: "05"
type: post
date: 2013-05-23T16:30:58+00:00
url: /2013/05/powershell-enable-refiner-count-for-sharepoint-2013-search-results/
yourls_shorturl:
  - http://melcher.it/s/3
categories:
  - Powershell
  - Search
  - SharePoint 2013

---
The refiner count is a very useful indicator in the Search Center whether the click on the refinement is worth it or nor – and the implementation is so intuitive that even end-users understands it. But: It is **disabled** by default in SharePoint 2013. This post shows you how to enable the Refiner Count for SharePoint 2013 - manually and with PowerShell.

## Refiner Count in SharePoint 2010

The refiner count was introduced in SharePoint 2010 and is a FAST for SharePoint feature. If you don’t have FAST installed and enabled the Refiner Count, the count is estimated roughly with the first 50 results because SharePoint Search was not capable of deep refinement.

> **Deep refinement** is based on the aggregation of managed property statistics for all of the results of a search query. The indexer creates aggregation data that is used in the query matching process. The advantage of using this kind of query refinement is that the refinement options reflect all the items matching a query.
> 
> <a href="http://msdn.microsoft.com/en-us/library/ff394639(v=office.14).aspx" target="_blank">Query Refinement (FAST Search Server 2010 for SharePoint)</a>

In other words, the refiner count could change after you click on a refiner which is very confusing for end-users.

If you have FAST for SharePoint installed the refiner count worked flawlessly but had to be enabled with a xml modification in the refiner webpart.

<div style="width: 96px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image11.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Refiner Count in SharePoint 2010 + FAST for SharePoint 2010" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb11.png" width="86" height="244" border="0" /></a>
  
  <p class="wp-caption-text">
    Refiner Count in SharePoint 2010 + FAST for SharePoint 2010
  </p>
</div>

## Refiner Count for SharePoint 2013

The refiner count is still possible with SharePoint 2013 – the concept is not new but the implementation has changed. And as already mentioned, the count is disabled by default:

<div id="attachment_683" style="width: 830px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/refinercount_disabled.png"><img data-attachment-id="683" data-permalink="https://melcher.it/2013/05/powershell-enable-refiner-count-for-sharepoint-2013-search-results/refinercount_disabled/" data-orig-file="https://melcher.it/wp-content/uploads/refinercount_disabled.png" data-orig-size="820,689" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Refiner count not visible (default)" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/refinercount_disabled-300x252.png" data-large-file="https://melcher.it/wp-content/uploads/refinercount_disabled.png" class="size-full wp-image-683 " title="Refiner count not visible (default)" alt="Refiner Count for SharePoint 2013 not visible" src="http://melcher.it/wp-content/uploads/refinercount_disabled.png" width="820" height="689" srcset="https://melcher.it/wp-content/uploads/refinercount_disabled.png 820w, https://melcher.it/wp-content/uploads/refinercount_disabled-300x252.png 300w, https://melcher.it/wp-content/uploads/refinercount_disabled-765x642.png 765w" sizes="(max-width: 820px) 100vw, 820px" /></a>
  
  <p class="wp-caption-text">
    Refiner count not visible (default)
  </p>
</div>

As you might know, you can change the rendering/design of elements with Display Templates in SharePoint 2013, most importantly for search results – this also applies to refiners – which is great if you ask me. Basically all you have to do is change the Display Template for the Refiner Filter which is a html file and you are good to go.

The file is located in the site collections MasterPage gallery folder, /\_catalogs/masterpage/Display Templates/Filters/Filter\_Default.html and contains the definition for the refinement item.

If you open the file you can see in the very first lines of the file you can see those lines:

<pre lang="powershell">this.Options = {
        ShowClientPeoplePicker: false,
        ShowCounts: false
    };</pre>

Change the lines (replace the false with the true in line 2) to:

<pre lang="powershell">this.Options = {
        ShowClientPeoplePicker: false,
        ShowCounts: true
    };</pre>

And voila, the refiner count is visible:

<div id="attachment_682" style="width: 831px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/refinercount_visible.png"><img data-attachment-id="682" data-permalink="https://melcher.it/2013/05/powershell-enable-refiner-count-for-sharepoint-2013-search-results/refinercount_visible/" data-orig-file="https://melcher.it/wp-content/uploads/refinercount_visible.png" data-orig-size="821,748" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Refiner count is visible" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/refinercount_visible-300x273.png" data-large-file="https://melcher.it/wp-content/uploads/refinercount_visible.png" class="size-full wp-image-682 " alt="Refiner Count for SharePoint 2013 visible" src="http://melcher.it/wp-content/uploads/refinercount_visible.png" width="821" height="748" srcset="https://melcher.it/wp-content/uploads/refinercount_visible.png 821w, https://melcher.it/wp-content/uploads/refinercount_visible-300x273.png 300w, https://melcher.it/wp-content/uploads/refinercount_visible-765x696.png 765w" sizes="(max-width: 821px) 100vw, 821px" /></a>
  
  <p class="wp-caption-text">
    Refiner count for SharePoint 2013
  </p>
</div>

## 

## PowerShell approach:

You have to do it more than once? Automate it!

Here is my short PowerShell script which automates the step above:

<pre lang="powershell">param([Parameter(Mandatory = $true, Position = 0)][string] $siteUrl, [switch] $hide)

if ([string]::IsNullOrWhiteSpace($siteUrl))
{
    Write-Host -ForegroundColor red "Param -webUrl is required"
    return
}

Add-PSSnapin Microsoft.SharePoint.Powershell -Ea 0

$web = get-spweb $siteUrl

if (!$web)
{
    throw [string]::Format("Web {0} does not exist. ", $siteUrl)
}

try
{
    $file = $web.GetFile('/_catalogs/masterpage/Display Templates/Filters/Filter_Default.html')
    $filter = [System.Text.Encoding]::ASCII.GetString($file.OpenBinary())
}
catch
{
    throw [string]::Format("Refiner File does not exist. Exception: {0}", $_.Exception)
}
$regex = [regex] '(ShowCounts: )(true|false)'

if ($hide)
{
    $showCount = 'false'
}
else
{
    $showCount = 'true'
}

$filter = $filter -ireplace $regex, [string]::Concat('$1', $showCount)
$file.SaveBinary([System.Text.Encoding]::ASCII.GetBytes($filter))

if ($hide)
{
    $visibilty = "not visible"
}
else
{
    $visibilty = "visible"
}

Write-Host -ForegroundColor Green ([string]::Format( "Refiner Count is {1} for Site {0}", $web.Url, $visibilty));</pre>

&nbsp;

## Usage:

Just [download this script][1] and call it with the –siteUrl parameter to enable the Refiner count for the specified Site Collection:

<pre lang="&quot;powershell">Enable-RefinerCount.ps1 –siteUrl http://sharepoint2013</pre>

or add -hide to hide the refiner count again:

<pre lang="&quot;powershell">Enable-RefinerCount.ps1 –siteUrl http://sharepoint2013 –hide</pre>

<div id="attachment_684" style="width: 687px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/refinercount_powershell.png"><img data-attachment-id="684" data-permalink="https://melcher.it/2013/05/powershell-enable-refiner-count-for-sharepoint-2013-search-results/refinercount_powershell/" data-orig-file="https://melcher.it/wp-content/uploads/refinercount_powershell.png" data-orig-size="677,319" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Enable Refiner Count for SharePoint 2013 with PowerShell" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/refinercount_powershell-300x141.png" data-large-file="https://melcher.it/wp-content/uploads/refinercount_powershell.png" class="size-full wp-image-684  " alt="Enable the Refiner Count for SharePoint 2013 - automated with PowerShell" src="http://melcher.it/wp-content/uploads/refinercount_powershell.png" width="677" height="319" srcset="https://melcher.it/wp-content/uploads/refinercount_powershell.png 677w, https://melcher.it/wp-content/uploads/refinercount_powershell-300x141.png 300w" sizes="(max-width: 677px) 100vw, 677px" /></a>
  
  <p class="wp-caption-text">
    Enabling/Disabling the refiner count made easy!
  </p>
</div>

## Pretty easy, isn't it?

 [1]: http://melcher.it/wp-content/uploads/Enable-RefinerCount.zip

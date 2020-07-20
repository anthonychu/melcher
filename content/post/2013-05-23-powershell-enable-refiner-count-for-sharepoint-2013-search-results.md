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

{{< fancybox "/wp-content/uploads" "refinercount_disabled.png" "" "single_image" >}}

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

{{< fancybox "/wp-content/uploads" "refinercount_visible.png" "" "single_image" >}}

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

{{< fancybox "/wp-content/uploads" "refinercount_powershell.png" "" "single_image" >}}

## Pretty easy, isn't it?

 [1]: http://melcher.it/wp-content/uploads/Enable-RefinerCount.zip

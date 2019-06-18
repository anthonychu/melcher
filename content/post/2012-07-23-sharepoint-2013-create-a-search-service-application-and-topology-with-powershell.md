---
title: '#SharePoint 2013 – Create a Search Service Application and Search Topology with Powershell'
author: Max Melcher
aliases:
   - "/post/2012-07-23-sharepoint-2013-create-a-search-service-application-and-topology-with-powershell/"
2012: "07"
type: post
date: 2012-07-23T18:02:49+00:00
url: /2012/07/sharepoint-2013-create-a-search-service-application-and-topology-with-powershell/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/c
categories:
  - ITPro
  - SharePoint 2013

---
Writing **SharePoint 2013** feels very new to me, but I created my first Demo environment and tried to set up search.

## What needs to be done?

14 steps for a simple Search Topology - 1 powershell can do them all.

  1. Create a Service Application Pool for the Search Service Application (15-22)
  2. Create a Search Service Application (22-28)
  3. Create a Search Service Application Proxy (30-36)
  4. Get the current Search Instance (38)
  5. Save the current Search Topology for later use (39)
  6. Create a new Search Topology (40)
  7. Create all the Search Components (Analytics- , Content Processing, Query Processing, Crawler-, Admin Component) (42-46)
  8. Remove the Index-Folder and recreate it (50-51)
  9. Create a new Index Component (53)
 10. Activate the new Topology (56)
 11. Call the method synchronize on the old topology - this errors but forces an update on the old topology object (59)
 12. The "forced updated" Topology object becomes inactive and can be deleted. (62)
 13. Everything  done - start a full crawl oder set it to the new shiny continuous crawling. Enjoy!

The numbers in the braces are the line numbers in the powershell script following now.

&nbsp;

## Powershell to the rescue!

Here is my powershell script for creating the whole service application and creating a basic topology.

<span style="color: #ff0000;">Please keep in mind that the $IndexLocation folder will be deleted and recreated.</span>

Adjust the settings in the lines 4-11 to your needs.

<pre lang="powershell" line="1">Add-PsSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

#Settings
$IndexLocation = "C:\Search"  #Location must be empty, will be deleted during the process!
$SearchAppPoolName = "Search App Pool"
$SearchAppPoolAccountName = "demo\SPSearchAppPool"
$SearchServiceName = "Search SA"
$SearchServiceProxyName = "Search SA Proxy"

$DatabaseServer = "sp2013\sharepoint"
$DatabaseName = "SP2013 Search"

Write-Host -ForegroundColor Yellow "Checking if Search Application Pool exists"
$spAppPool = Get-SPServiceApplicationPool -Identity $SearchAppPoolName -ErrorAction SilentlyContinue

if (!$spAppPool)
{
    Write-Host -ForegroundColor Green "Creating Search Application Pool"
    $spAppPool = New-SPServiceApplicationPool -Name $SearchAppPoolName -Account $SearchAppPoolAccountName -Verbose
}

Write-Host -ForegroundColor Yellow "Checking if Search Service Application exists"
$ServiceApplication = Get-SPEnterpriseSearchServiceApplication -Identity $SearchServiceName -ErrorAction SilentlyContinue
if (!$ServiceApplication)
{
    Write-Host -ForegroundColor Green "Creating Search Service Application"
    $ServiceApplication = New-SPEnterpriseSearchServiceApplication -Name $SearchServiceName -ApplicationPool $spAppPool.Name -DatabaseServer  $DatabaseServer -DatabaseName $DatabaseName
}

Write-Host -ForegroundColor Yellow "Checking if Search Service Application Proxy exists"
$Proxy = Get-SPEnterpriseSearchServiceApplicationProxy -Identity $SearchServiceProxyName -ErrorAction SilentlyContinue
if (!$Proxy)
{
    Write-Host -ForegroundColor Green "Creating Search Service Application Proxy"
    New-SPEnterpriseSearchServiceApplicationProxy -Name $SearchServiceProxyName -SearchApplication $SearchServiceName
}

$searchInstance = Get-SPEnterpriseSearchServiceInstance -local 
$InitialSearchTopology = $ServiceApplication | Get-SPEnterpriseSearchTopology -Active 
$SearchTopology = $ServiceApplication | New-SPEnterpriseSearchTopology

New-SPEnterpriseSearchAnalyticsProcessingComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance
New-SPEnterpriseSearchContentProcessingComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance
New-SPEnterpriseSearchQueryProcessingComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance
New-SPEnterpriseSearchCrawlComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance 
New-SPEnterpriseSearchAdminComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance

set-SPEnterpriseSearchAdministrationComponent -SearchApplication $ServiceApplication -SearchServiceInstance  $searchInstance

Remove-Item -Recurse -Force -LiteralPath $IndexLocation -ErrorAction SilentlyContinue
mkdir -Path $IndexLocation -Force 

New-SPEnterpriseSearchIndexComponent -SearchTopology $SearchTopology -SearchServiceInstance $searchInstance -RootDirectory $IndexLocation 

Write-Host -ForegroundColor Green "Activating new topology"
$SearchTopology.Activate()

Write-Host -ForegroundColor Yellow "Next call will provoke an error but after that the old topology can be deleted - just ignore it!"
$InitialSearchTopology.Synchronize()

Write-Host -ForegroundColor Yellow "Deleting old topology"
Remove-SPEnterpriseSearchTopology -Identity $InitialSearchTopology -Confirm:$false
Write-Host -ForegroundColor Green "Old topology deleted"
Write-Host -ForegroundColor Green "Done - start a full crawl and you are good to go (search)."
</pre>

The whole script took about 3 minutes on my machine.

<div style="width: 310px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image.png" rel="lightbox"><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; padding-top: 0px; border-width: 0px;" title="image" src="http://melcher.it/wp-content/uploads/image_thumb.png" alt="image" width="300" border="0" /></a>
  
  <p class="wp-caption-text">
    ULSViewer showed me what timer job needs to be started
  </p>
</div>

&nbsp;

{{< fancybox "/wp-content/uploads/" "SharePoint-2013-Preview-VMware-Workstation_2012-07-23_15-39-40.png" "" "single_image" >}}

## References

I took some parts from <a href="http://sharepoint-tutorial.net/post/2012/07/22/sharepoint-2013-search-powershell.aspx" target="_blank">here</a>, but received some errors, some paramaters were missing so I adjusted the script for my needs.

The <a href="http://technet.microsoft.com/en-us/library/jj219705%28v=office.15%29" target="_blank">MSDN documentation</a> is missing that there is a timer job responsible for topology changes - ULSViewer helped me to figure that one out.

## Update 1, 24.07.2012 17:11

I exchanged some emails with <a href="http://alpesh.nakars.com/blog/" target="_blank">Alpesh Nakar</a> (funnily he created a script for the same thing) and he helped me reducing my script a lot. Thanks for that.

&nbsp;

## Did it work for you?

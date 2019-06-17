---
title: 'Powershell: Create the BDC Service Application for SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2013-01-02-powershell-create-the-bdc-service-application-for-sharepoint-2013/"
2013: "01"
type: post
date: 2013-01-02T12:40:42+00:00
url: /2013/01/powershell-create-the-bdc-service-application-for-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/p
categories:
  - ITPro
  - Powershell
  - SharePoint 2013

---
Here a small script to provision the Business Data Connectivity Service Application-without ugly GUID in the database name.

<pre lang="powershell">Add-PsSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

#Settings
$ServiceName = "BDC Service"
$ServiceProxyName = "BDC Proxy"
$AppPoolAccount = "demo\spservices"
$AppPoolName = "SharePoint Services App Pool"
$DatabaseServer = "sp2013"
$DatabaseName = "SP2013 BDC"

Write-Host -ForegroundColor Yellow "Checking if Application Pool Accounts exists"
$AppPoolAccount = Get-SPManagedAccount -Identity $AppPoolAccount -EA 0
if($AppPoolAccount -eq $null)
{
Write-Host "Please supply the password for the Service Account..."
$AppPoolCred = Get-Credential $AppPoolAccount
$AppPoolAccount = New-SPManagedAccount -Credential $AppPoolCred -EA 0
}

Write-Host -ForegroundColor Yellow "Checking wether the Application Pool exists"
$AppPool = Get-SPServiceApplicationPool -Identity $AppPoolName -ErrorAction SilentlyContinue

if (!$AppPool)
{
Write-Host -ForegroundColor Green "Creating Application Pool"
$AppPool = New-SPServiceApplicationPool -Name $AppPoolName -Account $AppPoolAccount -Verbose
}

Write-Host -ForegroundColor Yellow "Checking if BDC Service Application exists"
$ServiceApplication = Get-SPServiceApplication -Name $ServiceName -ErrorAction SilentlyContinue
if (!$ServiceApplication)
{
Write-Host -ForegroundColor Green "Creating BDC Service Application"
$ServiceApplication = New-SPBusinessDataCatalogServiceApplication –ApplicationPool $AppPool –DatabaseName $DatabaseName –DatabaseServer $DatabaseServer –Name $ServiceName
}

Write-Host -ForegroundColor Yellow "Starting the BDC Service"
$ServiceInstance = Get-SPServiceInstance | Where-Object { $_.TypeName -like "*Business*" }
Start-SPServiceInstance $ServiceInstance

Write-Host -ForegroundColor Green "Done - BDC Service is up and running."</pre>

Its basically an extended version of my [Provision Search Service Application][1] script, just a little cleaned-up. During the creation (some would say copy & paste) I wondered why the proxy is created automatically – at first I had two proxies.

## 

## Pictures

Pictures or it did not happen!

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sp2013_bdc_database.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="sp2013_bdc_database" alt="sp2013_bdc_database" src="http://melcher.it/wp-content/uploads/sp2013_bdc_database_thumb.png" width="244" height="235" border="0" /></a>
  
  <p class="wp-caption-text">
    Business Data Connectivity Database with a beautiful name (and you can see my Managed Metadata Service Database is still ugly)
  </p>
</div>

&nbsp;

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/sp2013_bdc_service.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Provisioned BDC Service Application" alt="SP2013 BDC Service Application" src="http://melcher.it/wp-content/uploads/sp2013_bdc_service_thumb.png" width="244" height="235" border="0" /></a>
  
  <p class="wp-caption-text">
    Provisioned BDC Service Application
  </p>
</div>

## References

  * [http://technet.microsoft.com/en-us/library/ff607899.aspx][2] – Create the BDC Service Application
  * [http://technet.microsoft.com/en-us/library/ff607952.aspx][3] – Create the Proxy

## 

## Questions / Issues ?

If I missed a thing or if you have questions – go for it!

 [1]: http://melcher.it/2012/07/sharepoint-2013-create-a-search-service-application-and-topology-with-powershell/
 [2]: http://technet.microsoft.com/en-us/library/ff607899.aspx "http://technet.microsoft.com/en-us/library/ff607899.aspx"
 [3]: http://technet.microsoft.com/en-us/library/ff607952.aspx "http://technet.microsoft.com/en-us/library/ff607952.aspx"

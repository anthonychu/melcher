---
title: 'Search First Migration: Use SP2013 Search in a SP2010 Farm'
author: Max Melcher
aliases:
   - "/post/2013-11-14-search-first-migration-use-sp2013-search-sp2010-farm/"
2013: "11"
type: post
date: 2013-11-14T15:31:24+00:00
draft: true
url: /?p=1000
categories:
  - Uncategorized

---
## Expected Benefits

This blog post took me a while to write – you need more steps than I expected for this “simple” task.

## Result

## Step by Step

  1. Export root certifcate on SP2010$rootCert = (Get-SPCertificateAuthority).RootCertificate 
    <pre>$rootCert.Export("Cert") | Set-Content &lt;C:\ConsumingFarmRoot.cer&gt; -Encoding byte</pre>
    
    &nbsp;</li> 
    
      * Export STS certificate on SP2010</ol> </ol> 
    
    <pre>$stsCert = (Get-SPSecurityTokenServiceConfig).LocalLoginProvider.SigningCertificate</pre>
    
    <http://technet.microsoft.com/en-us/library/ff700211(v=office.14).aspx>
    
    <http://technet.microsoft.com/en-us/library/ee704545(v=office.14).aspx>
    
    ## Questions?
    
    &nbsp;
    
    Many customers are excited about the new features that SharePoint 2013 brings to the table. Small or large organizations who have implemented any SharePoint implementation project size hesitate to upgrade for many reasons, but they want to take advantage of some the new features of 2013.
    
    Recently, I ran into a similar situation where I am working with a client who prefers to stay on SharePoint 2010 for content and collaboration, but instead of implementing FAST for SharePoint 2010, they decided to use SharePoint 2013 for search.
    
    As we all know, F4SP is part of the 2013 platform now and it is not a standalone product anymore. For this reason, my client’s vision was to better off use SharePoint 2013 for search, rather than F4SP then go through the headaches of migration F4SP to 2013 or any future release of the product.
    
    The introduction of the Service Applications in SharePoint 2010, made life easier to implement scalable architecture and to create large multi-tenants farms, where you can share and publish service applications across different SharePoint farms. The same architecture is carried to 2013, and now we have the ability to publish service applications from 2013 to 2010, allowing customers to take advantage of some new features of the 2013 platform.
    
    Note that 2010 can consume 2013 service applications and not the other way around.
    
    Here is a list of the service applications that you can publish in 2013 and consume in 2010:
    
    1. User Profile Service
    
    2. Search Service
    
    3. Managed Metadata Service
    
    4. Business Connectivity Services
    
    5. Secure Store Service
    
    In my case, I will be providing details on how to publish the Search Service Application in 2013, and consume it in 2010 using the Search Center.
    
    **First Step:** You need to establish a trust relationship between the two farms:
    
    1. Export the Farm and STS certificates from the SharePoint 2010 farm:
    
    $rootCertificate = (Get-SPCertificateAuthority).RootCertificate
    
    $rootCertificate.Export("Cert") | Set-Content C:\Certificates\2010FarmRoot.cer -Encoding byte
    
    $stsCertificate = (Get-SPSecurityTokenServiceConfig).LocalLoginProvider.SigningCertificate
    
    $stsCertificate.Export("Cert") | Set-Content C:\Certificates\2010FarmSTS.cer -Encoding byte
    
    2. Export the Farm certificate from the SharePoint 2013 farm:
    
    $rootCertificate = (Get-SPCertificateAuthority).RootCertificate
    
    $rootCertificate.Export("Cert") | Set-Content C:\Certificates\2013FarmRoot.cer -Encoding byte
    
    3. Import the SharePoint 2013 certificate into the SharePoint 2010 farm:
    
    $trustCertificate = Get-PfxCertificate C:\Certificates\2013FarmRoot.cer
    
    New-SPTrustedRootAuthority "2013 Trust"-Certificate $trustCertificate
    
    4. Import the SharePoint 2010 into the SharePoint 2013 farm:
    
    $trustCertificate = Get-PfxCertificate C:\Certificates\2010FarmRoot.cer
    
    New-SPTrustedRootAuthority "2013 Trust" -Certificate $trustCertificate
    
    $stsCertificate = Get-PfxCertificate C:\Certificates\2010FarmSTS.cer
    
    New-SPTrustedServiceTokenIssuer "2013 Trust" -Certificate $stsCertificate
    
    **Second Step:** You need to publish the Search Service Application and set the permissions:
    
    1. Go to Central Admin à Manage Service Applications
    
    2. Click on your Search Service Application
    
    3. Click Publish; make sure you select the checkbox next to "Publish this Service Application to other farms"
    
    4. From the SharePoint 2010 farm, run the following command to get the Farm ID:
    
    $farmID= Get-SPFarm
    
    $farmID.Id
    
    5. From the SharePoint 2013 farm, run the following commands:
    
    $security=Get-SPTopologyServiceApplication | Get-SPServiceApplicationSecurity
    
    $claimprovider=(Get-SPClaimProvider System).ClaimProvider
    
    $principal=New-SPClaimsPrincipal -ClaimType "http://schemas.microsoft.com/sharepoint/2009/08/claims/farmid" -ClaimProvider$claimprovider -ClaimValue [FarmID]
    
    Grant-SPObjectSecurity -Identity $security -Principal $principal -Rights "Full Control"
    
    Get-SPTopologyServiceApplication | Set-SPServiceApplicationSecurity -ObjectSecurity $security
    
    6. From the SharePoint 2013 SSA, give the SharePoint 2010 Farm ID “Full Control” permissions
    
    From 2010, you can connect to the 2013 SSA by providing the 2013 SSA published servive URL.
    
    Now, go into your 2013 SSA, add a SharePoint 2010 content source and run a full crawl. Once the crawl is completed, you will be able to search the content using your 2010 Search Center.
    
    Note: If you need to take advantage of the results preview feature, you will need to install and configure Office Web Apps 2013 against your SharePoint 2013 farm.

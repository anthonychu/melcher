---
title: Retrieve Managed Account Passwords for SharePoint 2010 / SharePoint 2013
author: Max Melcher
aliases:
   - "/post/2015-04-09-retrieve-managed-account-passwords-for-sharepoint-2010-sharepoint-2013/"
2015: "04"
type: post
date: 2015-04-09T08:15:14+00:00
url: /2015/04/retrieve-managed-account-passwords-for-sharepoint-2010-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/4l
categories:
  - ITPro
  - Powershell
  - SharePoint 2010
  - SharePoint 2013

---
In this post I show you a simple PowerShell script to retrieve Managed Account Passwords for SharePoint 2010 / SharePoint 2013.

This is actually a repost and I do not want to claim any credits for this post - see <a title="How to: Get your Managed Account passwords when they are changed automatically by SharePoint 2010" href="http://melcher.it/s/4j" target="_blank">the original here by Jason Himmelstein</a> (**<= thank you!!!**). Why do I repost? I never find the PowerShell when I need it, even tho I have it in my almighty OneNote!

## Challenge

Imagine the following: The Search Crawler is not able to index certain items in a SharePoint site. The ULS is full of access denied errors, the Crawl Log tells you:

> The sharepoint item being crawled returned an error when attempting to download the item

Basically nothing. So the first thing would be to access the site as Content Access account - but - nobody knows the password anymore. Maybe it was changed automatically, maybe the "one" guy left the company and there is no documentation - I have been in this situation countless times&#8230;!

## The solution: the password recovery script

Just copy the following script and paste it into an elevated/admin SharePoint PowerShell:

<pre lang="powershell" class="">function Bindings()
{
	return [System.Reflection.BindingFlags]::CreateInstance -bor
	[System.Reflection.BindingFlags]::GetField -bor
	[System.Reflection.BindingFlags]::Instance -bor
	[System.Reflection.BindingFlags]::NonPublic
}
function GetFieldValue([object]$o, [string]$fieldName)
{
	$bindings = Bindings
	return $o.GetType().GetField($fieldName, $bindings).GetValue($o);
}
function ConvertTo-UnsecureString([System.Security.SecureString]$string) 
{ 
	$intptr = [System.IntPtr]::Zero
	$unmanagedString = [System.Runtime.InteropServices.Marshal]::SecureStringToGlobalAllocUnicode($string)
	$unsecureString = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($unmanagedString)
	[System.Runtime.InteropServices.Marshal]::ZeroFreeGlobalAllocUnicode($unmanagedString)
	return $unsecureString
}

Get-SPManagedAccount | select UserName, @{Name="Password"; Expression={ConvertTo-UnsecureString (GetFieldValue $_ "m_Password").SecureStringValue}}
</pre>

See:

{{< fancybox "/wp-content/uploads/" "GetManagedAccountPasswords.png" "" "single_image" >}}

The output is a nice table with all passwords in plain text - unexpected but nice, isn't it?

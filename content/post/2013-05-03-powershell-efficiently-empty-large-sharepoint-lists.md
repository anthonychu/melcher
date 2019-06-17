---
title: 'Powershell: Efficiently empty large SharePoint lists'
author: Max Melcher
aliases:
   - "/post/2013-05-03-powershell-efficiently-empty-large-sharepoint-lists/"
2013: "05"
type: post
date: 2013-05-03T12:01:24+00:00
url: /2013/05/powershell-efficiently-empty-large-sharepoint-lists/
yourls_shorturl:
  - http://melcher.it/s/5
categories:
  - Powershell
  - SharePoint 2010
  - SharePoint 2013

---
Previously I had a little console app to efficiently empty large SharePoint lists. Today I converted it to powershell.

<div class="avia-box info    ">
  <span class="avia-innerbox" >SharePoint Online? Read this: <a href="https://melcher.it/2017/02/efficiently-empty-a-large-sharepoint-online-list/">Efficiently empty a large Sharepoint Online List</a><br /> </span>
</div>

Compared to the simple item by item delete with item.Delete() its 30 times faster; on my dev machine it deletes ~30 items per second. It works for SharePoint 2010 and should  for 2013 (not tested, yet).

## Script

<pre lang="powershell">param($weburl,$listname)
if ($weburl -eq $null -or $listname -eq $null)
{
    write-host -foregroundcolor red "-weburl or -listname are null."
    return
}
 
Add-PSSnapin Microsoft.SharePoint.Powershell -EA 0
$web = get-spweb $weburl
$list = $web.lists[$listname]
 
$stringbuilder = new-object System.Text.StringBuilder

try
{
    $stringbuilder.Append("<!--?xml version=`"1.0`" encoding=`"UTF-8`"?-->") &gt; $null
 
    $i=0
 
    $spQuery = New-Object Microsoft.SharePoint.SPQuery
    $spQuery.ViewFieldsOnly = $true
 
    $items = $list.GetItems($spQuery);
    $count = $items.Count
 
    while ($i -le ($count-1))
    {
        write-host $i
        $item = $items[$i]
 	
        $stringbuilder.AppendFormat("", $i) &gt; $null
        $stringbuilder.AppendFormat("{0}", $list.ID) &gt; $null
        $stringbuilder.AppendFormat("{0}", $item.Id) &gt; $null
        $stringbuilder.Append("Delete") &gt; $null
        $stringbuilder.Append("") &gt; $null
 
        $i++
    }
    $stringbuilder.Append("") &gt; $null
 
    $web.ProcessBatchData($stringbuilder.ToString()) &gt; $null
}
catch
{
    Write-Host -ForegroundColor Red $_.Exception.ToString()
}
 
write-host -ForegroundColor Green "done."
</pre>

## Usage

Delete-Items.ps1 -weburl [url of web] -listname [name of list]

## Further improvements

I think if the list is really huge (100k items or greater) the items should be deleted in batches.

I have not tried it with a document library, maybe there are issues. If there are issues, please leave a comment!

## Disclaimer

There is no way back - if you start the script there is no "ARE YOU SURE?" - all data is gone in a very short time.

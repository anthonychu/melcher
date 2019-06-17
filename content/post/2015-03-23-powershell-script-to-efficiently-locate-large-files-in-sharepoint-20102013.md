---
title: Powershell Script to Efficiently Locate Large Files in SharePoint 2010/2013
author: Max Melcher
aliases:
   - "/post/2015-03-23-powershell-script-to-efficiently-locate-large-files-in-sharepoint-20102013/"
2015: "03"
type: post
date: 2015-03-23T08:15:32+00:00
url: /2015/03/powershell-script-to-efficiently-locate-large-files-in-sharepoint-20102013/
yourls_shorturl:
  - http://melcher.it/s/4d
categories:
  - ITPro
  - Powershell

---
Recently I had the request to locate all files that are bigger than 40 MB - and they were located in the entire farm across multiple Site Collections. &nbsp;Easy you might say? Just use search and query for

> size>41943040

Well, I said efficiently and thats the most efficient way - you are right! They key constraint here is that those files were excluded from search - so lets go for the PowerShell way.

## The Script

Here comes the script that uses PowerShell to iterate over each Site Collection, every Web and every List - then uses CAML to query each list for items larger than the specified size. It works for SharePoint 2013 and should definitely work for 2010, too.

Enough words, here we go:

<pre lang="Powershell" class="">Add-PSSnapin microsoft.sharepoint.powershell -ea 0

#Configure the size in byte here, here its 4 MB.
$size = 400*1024*1024

function GetLargeFiles ($list)
{
    $result = @()

    #query for large files
    $query = New-Object Microsoft.SharePoint.SPQuery; 
    $query.Query =  "$size";
    $query.ViewFieldsOnly = $true 
    $query.ViewFields = ""; 
 
    #page them in the case there are more than 5000 files
    $query.RowLimit = 5000; 
    $query.ViewAttributes = "Scope='RecursiveAll'";
    
    do
    {
        $items = $list.GetItems($query); 

        if ($items.Count -gt 0)
        {
            foreach ($item in $items)
            {
                if ($item.File)
                {
                    if ($item.File.Length -gt $size)
                    {
                        $t = @{}
                        $t.Size = $item.File.Length
                        $t.Url = $list.ParentWeb.Url + "/" + $item.File.Url
                        $t2 = New-Object PSObject –Property $t
                        $result += $t2
                    }
                }
            }
        }
        #set the pagination
        $query.ListItemCollectionPosition = $items.ListItemCollectionPosition
    } while ($query.ListItemCollectionPosition)

    return $result
}

#query all sites
$sites = Get-SPSite -Limit All

$result = @()
foreach ($site in $sites)
{
    Write-Host $site.Url
    
    #query all webs
    $webs = get-spweb -Site $site -Limit All
    foreach ($web in $webs)
    {
        #query all lists
        foreach ($list in $web.Lists)
        {
            $result += GetLargeFiles $list
        }
        #cleanup the web
        $web.Dispose()
    }
    #cleanup the site
    $site.Dispose()
}

#output the results
$result

</pre>

## Result

The result looks like this:

<div id="attachment_1842" style="width: 257px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell.png"><img data-attachment-id="1842" data-permalink="https://melcher.it/2015/03/powershell-script-to-efficiently-locate-large-files-in-sharepoint-20102013/2015-03-22-20_05_35-administrator_-sharepoint-2013-management-shell/" data-orig-file="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell.png" data-orig-size="677,823" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Get Large files script in Action" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell-247x300.png" data-large-file="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell.png" class="size-medium wp-image-1842" src="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell-247x300.png" alt="Get large files script in action" width="247" height="300" srcset="https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell-247x300.png 247w, https://melcher.it/wp-content/uploads/2015-03-22-20_05_35-Administrator_-SharePoint-2013-Management-Shell.png 677w" sizes="(max-width: 247px) 100vw, 247px" /></a>
  
  <p class="wp-caption-text">
    Get large files script in actionYou can easily export that to a csv file
  </p>
</div>

You can easily export that to a csv file with:

<span class="lang:ps decode:true  crayon-inline ">$result | export-csv result.csv</span>

I ran it again a quite large SharePoint 2013 environment (~1 TB, 1075 Site Collections) and it came back in ~5 minutes.

## Feedback!

You see room for improvement for my PowerShell script to efficiently locate large files? If so, please tell me!

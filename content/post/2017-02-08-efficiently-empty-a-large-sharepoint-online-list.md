---
title: Efficiently empty a large SharePoint Online list
author: Max Melcher
aliases:
   - "/post/2017-02-08-efficiently-empty-a-large-sharepoint-online-list/"
2017: "02"
type: post
date: 2017-02-08T15:47:59+00:00
url: /2017/02/efficiently-empty-a-large-sharepoint-online-list/
categories:
  - Office 365
  - Powershell
  - SharePoint Online

---
Ages ago I created a PowerShell script that I used a couple of times by now: [efficiently empty a large SharePoint list][1] - but apparently that code does not work against a SharePoint Online list.

{{< fancybox "/wp-content/uploads/" "empty-list.png" "" "single_image" >}}

So here is an updated version of the script:

{{< highlight PowerShell >}}
.TERMS 
No terms - use on your own risk! 
.SYNOPSIS 
This script efficiently empties are large list and is approximately 30 times faster than deleting item by item. 
You need to have the SharePoint Online SDK (https://www.microsoft.com/en-us/download/details.aspx?id=42038) installed to run this script. 
.PARAMETER weburl 
SharePoint Online web URL, for example 'https://contoso.sharepoint.com'. 
.PARAMETER listname 
Name of the list that should be emptied 
.Author Max Melcher (@maxmelcher) - more on my blog https://melcher.it 
#&gt;

param([Parameter(Mandatory=$true,ValueFromPipeline=$true)]$weburl,[Parameter(Mandatory=$true,ValueFromPipeline=$true)]$listname, $username, $password)

function empty-list($weburl, $listname)
{
    $clientContext = New-Object Microsoft.SharePoint.Client.ClientContext($webUrl)
	$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword) 
	$clientContext.Credentials = $credentials 
	 
	if (!$clientContext.ServerObjectIsNull.Value) 
	{ 
		Write-Host "Connected to SharePoint Online web: '$webUrl'" -ForegroundColor Green 
	}

    try
    {
		#global counter
        $counter=0
 
        $spQuery = New-Object Microsoft.SharePoint.Client.CamlQuery

        #create a simple batch. I received the best results with 500 items per batch. 
		#5000 is the maximum, but i received so many timeouts.
        $spQuery.ViewXml = "&lt;QueryOptions&gt;&lt;RowLimit&gt;500&lt;/RowLimit&gt;&lt;/QueryOptions&gt;"
        
		#track the performance
        $watch = [System.Diagnostics.Stopwatch]::StartNew()
		
		#get the list
		$list = $clientContext.Web.Lists.GetByTitle($listname);
        do
        {
			
            #get the current batch of items
            $items = $list.GetItems($spQuery);
            $clientContext.Load($items)

            #get a batch and delete the previous items in one go
            $clientContext.ExecuteQuery()

            $count = $items.Count
            Write-Host "...deleting $count items" -ForegroundColor Yellow

            while ($items.Count -gt 0)
            {
                $counter++
                $items[0].DeleteObject()
                
                if ($counter%500 -eq 0)
                {
                    Write-Progress -Activity "Empty List '$listname'" -status "Item $counter of $total marked for deletion"
                }
            }

			#iterate the collection
            $spQuery.ListItemCollectionPosition = $items.ListItemCollectionPosition
        } 
        while ($spQuery.ListItemCollectionPosition -ne $null)

        #delete the last batch
        $clientContext.ExecuteQuery()

		#stats
        $seconds = ($watch.ElapsedMilliseconds/1000)
        $secondsf = "{0:N0}" -f $seconds
        $ips = $counter / $seconds

        write-host -ForegroundColor Green "Done! deleted $counter items in $secondsf seconds. $ips items per second"
    }
    catch
    {
        Write-Host -ForegroundColor Red $_.Exception.ToString()
    }
}


# change to the path of your CSOM dlls and add their types
$csomPath = "c:\Program Files\Common Files\microsoft shared\Web Server Extensions\16\ISAPI"
Add-Type -Path "$csomPath\Microsoft.SharePoint.Client.dll" 
Add-Type -Path "$csomPath\Microsoft.SharePoint.Client.Runtime.dll" 

if([String]::IsNullOrWhiteSpace($username)) {
	$username = Read-host "What's your username?"
}

if([String]::IsNullOrWhiteSpace($password)) {
	$securePassword = Read-host "What's your password?" -AsSecureString 
} else {
	$securePassword = ConvertTo-SecureString $password -AsPlainText -Force 
}

Empty-List -weburl $weburl -listname $listname -user $username -password $securePassword
{{< /highlight >}}

Or download the script from <a href="https://gist.github.com/MaxMelcher/c0cb013c438b1757b3f470da7ea5d152" target="_blank" rel="noopener">here</a>.

You can call the script with the following parameters:

<pre class="">.\empty-list.ps1 -weburl [WebUrl] -listname [Name of the list] -username [username] -password [password]</pre>

I tried it several times on my tenant (and I even created a script to create thousands of items): Once I got rid of all the timeouts I got a delete performance of 11,84 items per second. Not great, but still faster than the Quick Edit View, right? 🙂

## Disclaimer

There is no way back – if you start the script there is no "ARE YOU SURE?" – all data is gone in a very short time.

 [1]: https://melcher.it/2013/05/powershell-efficiently-empty-large-sharepoint-lists/

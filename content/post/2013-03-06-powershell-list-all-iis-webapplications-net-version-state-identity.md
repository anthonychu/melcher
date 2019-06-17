---
title: 'Powershell: List all IIS WebApplications (.net version, state, identity)'
author: Max Melcher
aliases:
   - "/post/2013-03-06-powershell-list-all-iis-webapplications-net-version-state-identity/"
2013: "03"
type: post
date: 2013-03-06T18:30:04+00:00
url: /2013/03/powershell-list-all-iis-webapplications-net-version-state-identity/
yourls_shorturl:
  - http://melcher.it/s/A
categories:
  - ITPro
  - Powershell

---
Short powershell script to list all IIS Web Applications with the .net version, the state of the Web Application and the assigned user/identity.

{{< highlight powershell >}}
try{
Import-Module WebAdministration
Get-WebApplication

$webapps = Get-WebApplication
$list = @()
foreach ($webapp in get-childitem IIS:\AppPools\)
{
$name = "IIS:\AppPools\" + $webapp.name
$item = @{}

$item.WebAppName = $webapp.name
$item.Version = (Get-ItemProperty $name managedRuntimeVersion).Value
$item.State = (Get-WebAppPoolState -Name $webapp.name).Value
$item.UserIdentityType = $webapp.processModel.identityType
$item.Username = $webapp.processModel.userName
$item.Password = $webapp.processModel.password

$obj = New-Object PSObject -Property $item
$list += $obj
}

$list | Format-Table -a -Property "WebAppName", "Version", "State", "UserIdentityType", "Username", "Password"

}catch
{
$ExceptionMessage = "Error in Line: " + $_.Exception.Line + ". " + $_.Exception.GetType().FullName + ": " + $_.Exception.Message + " Stacktrace: " + $_.Exception.StackTrace
$ExceptionMessage
}
{{< /highlight >}}

And the output is a nice table:

<table style="width: 400px;" border="1" cellspacing="0" cellpadding="2">
  <tr>
    <td style="background-color: #a81010; color: white;" valign="top" width="65">
      WebAppName
    </td>
    
    <td style="background-color: #a81010; color: white;" valign="top" width="67">
      Version
    </td>
    
    <td style="background-color: #a81010; color: white;" valign="top" width="66">
      State
    </td>
    
    <td style="background-color: #a81010; color: white;" valign="top" width="66">
      UserIdentityType
    </td>
    
    <td style="background-color: #a81010; color: white;" valign="top" width="57">
      Username
    </td>
    
    <td style="background-color: #a81010; color: white;" valign="top" width="75">
      Password
    </td>
  </tr>
  
  <tr>
    <td valign="top" width="65">
      SharePoint - 80
    </td>
    
    <td valign="top" width="67">
      v2.0
    </td>
    
    <td valign="top" width="66">
      Started
    </td>
    
    <td valign="top" width="66">
      SpecificUser
    </td>
    
    <td valign="top" width="57">
      demo\spservices
    </td>
    
    <td valign="top" width="75">
      <a href="mailto:pass@word1">pass@word1</a>
    </td>
  </tr>
</table>

&nbsp;

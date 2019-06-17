---
title: "TIL: Send E-Mails with Powershell via an Office 365 Mail Account"
author: "Max Melcher"
aliases:
   - "/post/2018-01-15-TIL-Powershell-Emails-And-Office-365/"
2018: "01"
date: 2018-01-17T00:11:08+01:00
image: 
- "/images/2017.png"
featured: true
featured: "EventViewer-AttachTask.png" 
featuredalt : "Launch a task when this event is logged" 
featuredpath : "/images"
categories:
  - Powershell
  - TIL
  - Office 365
tags:
  - E-Mail
  - O365
---

TIL: Today I learned how easy it is to send emails with Powershell and an Office 365 mail account.<!--more-->

## Today I learned (TIL)

In Windows Server 2012 or later it is no longer possible to send emails once an event is added to windows event log. It is deprecated and without authentication options no longer usable. Who would run a mailserver that accepts to send new mails without authentication, right? In my current project there is no decent monitoring solution available as of now - So I checked the options and found [a nice post](https://blogs.technet.microsoft.com/ccarroll/2017/11/28/use-powershell-to-send-email-from-o365-account/) how to send mails with PowerShell and used that script in a new windows scheduled task. 
Call me paranoid, but I didnt want to add my credentials there in plain text - thats why I used a snipped from [Todd Klindt's post](http://www.toddklindt.com/blog/Lists/Posts/Post.aspx?ID=489) to store the credentials **encrypted** for later reuse. And of course I configured it to use the best mailserver in the world (*that applies to all mailservers that work and that I don't have to maintain!*), in short, utilizing my Office 365 mail account.

## The script

{{< highlight PowerShell >}}
#provide your account
$userid='<your-email-here>' 
#load the encrypted credentials
$credfile = Get-ChildItem creds.xml 

#check if the credentials are stored
if ($credfile) 
{
    #import the secured credentials
    $creds = Import-CliXml -Path creds.xml 
}
else 
{
    #no credentials - ask for them
    $creds = Get-Credential -UserName $userid -Message "O365" 
    $creds | Export-CliXml -Path creds.xml #store them encrypted
}

#and now the actual mail function 
Send-MailMessage `
    -To '<to>' `
    -subject '<subject>' `
    -body '<body>'  `
    -UseSsl `
    -Port 587 `
    -SmtpServer 'smtp.office365.com' `
    -From  $userid `
    -Credential $creds 
{{< /highlight >}}


## The scheduled task

The scheduled task needs three configurations:

1.) Set the script to run even if the user is not logged on and with highest privileges:
{{< fancybox "/images" "ScheduledTask-General.png" "Scheduled Task - General Settings" "single_image" >}}

2.) Then select your triggers. In my case its eventid 1000 (app crashed) and event id 1026 (net framework tells us something bad happend):
{{< fancybox "/images" "ScheduledTask-Trigger.png" "Scheduled Task - Trigger" "single_image" >}}

3.) then lastly what to do: 

{{< fancybox "/content/wp-content/uploads" "ScheduledTask-Actions.png" "Scheduled Task - Actions" "single_image" >}}

- Program or script: powershell
- Arguments: -command "&{. .\send-mail.ps1 }" -NoProfile
- Start in: c:\notifier

So in other words, once triggered, it launchs powershell with no user profile attached, switch to the path c:\notifier and launch the script that sits there and is named send-mail.ps1.

*note: you have to launch the script once in powershell to store the credentials. Don't forget to cd into the correct directory.*

## Easy, right? 

So that the script and the entire flow to add some very rough and basic monitoring to a windows server - if you know a better way, dont hesitate to tell me in the comments :)




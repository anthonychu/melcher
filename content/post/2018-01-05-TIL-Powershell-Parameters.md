---
title: "TIL: Logging Powershell Parameters"
author: "Max Melcher"
aliases:
   - "/post/2018-01-05-TIL-Powershell-Parameters/"
2018: "01"
date: 2018-01-05T14:08:08+01:00
image: 
- "/images/2018-01-05 14_36_01-C__Users_mmelcher_Documents_PowerShell_transcript.PC-0DYG6P-MUC.SQ3NMhRW.2018010.png"
featured: true
featured: "2018-01-05 14_36_01-C__Users_mmelcher_Documents_PowerShell_transcript.PC-0DYG6P-MUC.SQ3NMhRW.2018010.png" 
featuredalt : "Transcript with Powershell Parameters" 
featuredpath : "/images"
categories:
  - Powershell
  - TIL
tags:
  - Transcript
  - Logging
---

In my current project we provision large and complex Azure environments, subscriptions VMs, networking permissions and all that. 
Some of the scripts have many many parameters - so in a month it would be nice to see how the script were started and with what parameters. With the cmdlet **start-transcript** you get all the information what happens in the script as a nice log file. But unfortunately the parameters that were used to start the script are not in there. In this post, I show you how to easily add them to the transcript! <!--more--> 

Let's use the following script:

{{< highlight PowerShell "linenos=table" >}}
Param(
    [Parameter(Mandatory=$True, HelpMessage="The first parameter")]
    [string]$Parameter1, 
    [Parameter(Mandatory=$True, HelpMessage="The second parameter")]
    [string]$Parameter2
)
start-transcript
write-out "Do something"
Start-Sleep -Seconds 3
write-out "Everything worked out!"
Stop-Transcript
{{< /highlight >}}

After starting this script you will have a nice transcript (yellow part), but it does not contain with what parameters the script was started:
{{< fancybox "/images" "2018-01-05 14_32_47-C__Users_mmelcher_Documents_PowerShell_transcript.PC-0DYG6P-MUC.YXhYhwLV.2018010.png" "The transcript of the powershell script" "single_image" >}}

## Today I learned (TIL)

So today I learned that you can write them to the transcript with just a few lines:

{{< highlight PowerShell>}}

Param(
    [Parameter(Mandatory=$True, HelpMessage="The first parameter")]
    [string]$Parameter1, 
    [Parameter(Mandatory=$True, HelpMessage="The second parameter")]
    [string]$Parameter2
)
start-transcript

#Export the parameters
write-verbose "Parameters:"
foreach ($p in $PsBoundParameters.GetEnumerator())
{
    write-verbose "`tParameter: $($p.Key) Value: $($p.Value)"
}

write-out "Do something"
Start-Sleep -Seconds 3
write-out "Everything worked out!"
Stop-Transcript
{{< /highlight >}}

If you do this, you will have a nice transcript that contain the parameters (yellow part):
{{< fancybox "/images" "2018-01-05 14_36_01-C__Users_mmelcher_Documents_PowerShell_transcript.PC-0DYG6P-MUC.SQ3NMhRW.2018010.png" "The transcript of the powershell script" "single_image" >}}

Why write-verbose you might ask? Then you have the choice when you start the script to log the parameters with **-Verbose** or to not log them if you dont need them. One little note: values of SecureStrings are not exported. 

Powershell is awesome. You agree?

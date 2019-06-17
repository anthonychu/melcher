---
title: "PowerShell Prompt Awesomeness - you need this!"
date: 2019-03-12T23:53:16+01:00
2019: "03"
author: "Max Melcher"
categories:
  - PowerShell
tags:
  - PowerShell
  - Customization
  - Prompt
  - VSCode
  - PoshGit
featured: "images/VSCode_Prompt.png"
featuredalt : ""
hashtags: 
  - "#powershell"
---

Adjust the default prompt in PowerShell is possible: In this short post I show you how and share my new prompt!
<!--more-->

## Twitter Serendipity

I saw this thread on Twitter by some smart PowerShell folks:
{{<twitter 1105397254888833024>}}
... and immediately thought that this would be EXTREMLY #awesomesauce to have. 

I am grateful that at least two of them, namely [Ryan Yates](https://twitter.com/ryanyates1990) and [Amanda Debler](https://twitter.com/texmandie) shared their prompt function [here](https://gist.github.com/amandadebler/d4856e307e7c020f14312b9412493aea) and [here](https://gist.github.com/kilasuit/8f17db5a0825f3cdaa315385456e7f7e) - and I mixed both of them and came up my version.

## Background - The Prompt Function

If you open a PowerShell session and type in a command, every time you issue it, the **Prompt()** function defined in the path C:\Users\[USERNAME]\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 is executed. How cool is that. A prompt override! 

So if you want to edit your Prompt() function you can open a new PowerShell session and type **code $PROFILE** or if you dont have VSCode (?!) installed **notepad $PROFILE** to open the file. 

{{< fancybox "images" "vscodeprompt.png" "Editing the Prompt() functiom in VSCode" "single_image" >}}

## My Prompt Function

So combining the two gists from Amanda and Ryan, my Prompt() function has three core features:

1. Only the last two folders and the root drive is shown in the current path.
  1. The path c:\very\deep\path\really\really\deep becomes to c:\...\really\deep
1. The execution time is shown
  1. Colored in green if the execution time is below 1 second; milliseconds are shown.
  1. Yellow if the time is below a minute; seconds are shown.
  1. Red if the time is above a minute; hours, minutes and seconds are shown. If you have a script that runs longer than a day (really?!) then you might have to fix that.
1. If you are in a path that is a git repository, the branch and the state is shown.
  1. You need [Posh-Git](https://github.com/dahlbyk/posh-git) installed - with [chocolatey](https://chocolatey.org/packages/poshgit) its **choco install poshgit**.

And all the features in one screenshot:
{{< fancybox "images" "CustomPowerShellPrompt.png" "My custom PowerShell prompt. Shorter path, execution time, git status" "single_image" >}}

And it even works in VSCode.
{{< fancybox "images" "VSCode_Prompt.png" "My custom PowerShell prompt in VSCode. Shorter path, execution time, git status" "single_image" >}}

Awesome, right? 

## Give me the code

And here comes my function - feel free to adjust to your needs:  
*Note the posh-git path at the very end!*

{{< highlight powershell >}}
<#
.Description
Custom Prompt() function with 3 features: 
1. Show execution times for commands
2. Reduce path length to show only 2 parent folders
3. Show git status if the folder is under source control

.Kudos
As mentioned in the post, I mixed the script based on existing scripts by 
@ryanyates1990, @texmandie, @fatherjack, @FredWeinmann, @psdbatools, @cl

#>
function Prompt {
    
    try {        
        $history = Get-History -ErrorAction Ignore -Count 1
        if ($history) {
            Write-Host "[" -NoNewline
            $ts = New-TimeSpan $history.StartExecutionTime $history.EndExecutionTime
            switch ($ts) {
                {$_.TotalSeconds -lt 1} { 
                    [int]$d = $_.TotalMilliseconds
                    '{0}ms' -f ($d) | Write-Host -ForegroundColor Black -NoNewline -BackgroundColor DarkGreen
                    break
                }
                {$_.totalminutes -lt 1} { 
                    [int]$d = $_.TotalSeconds
                    '{0}s' -f ($d) | Write-Host -ForegroundColor Black -NoNewline -BackgroundColor DarkYellow
                    break
                }
                {$_.totalminutes -ge 1} { 
                    "{0:HH:mm:ss}" -f ([datetime]$ts.Ticks) | Write-Host -ForegroundColor Gray -NoNewline  -BackgroundColor Red
                    break
                }
            }
            Write-Host "] " -NoNewline
        }
        if(Get-Module Posh-git) {
            Write-VcsStatus
            Write-Host " " -NoNewline
        }
    }
    catch { }
    # New line
    Write-Host ""
    
    # show the drive and then last 2 directories of current path
    if (($pwd.Path.Split('\').count -gt 3)){
        write-host "$($pwd.path.split('\')[0], '...', $pwd.path.split('\')[-2], $pwd.path.split('\')[-1] -join ('\'))" -NoNewline
    }
    else{
        Write-Host "$($pwd.path)" -NoNewline
    }
    "> "
}

#Adjust your post-git path! I installed it with chocolatey!
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
{{< /highlight >}}

The only "disadvantage" I noticed is, that the initial load of the PowerShell is delayed by 1 second. I guess thats because the post-git module is loaded. That is acceptable.

I thought about moving the path and the execution time to [the PowerShell console title](https://devblogs.microsoft.com/scripting/powertip-change-the-powershell-console-title/) - but that would not work in VSCode so I left it. Still liking the idea, maybe it is something for you.

Hope it helps,  
Max
---
title: "Setting up my PC with Azure in Mind"
date: 2019-01-18T10:32:05+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Azure
  - Automation
tags:
  - Chocolatey
  - vscode
  - gitextensions
  - dotnetcore
  - azure-cli
  - az
  - AzureAD
  - googlechrome
  - adobereader
  - microsoft-teams 
  - autohotkey
  - greenshot
  - paint.net
  - visualstudio2017enterprise
  - visualstudio2017-workload-azure
  - kubernetes-helm
  - terraform
  - putty
featured: "images/Chocolatey.gif"
featuredalt : "Installing VSCode with Chocolatey in 18 seconds"
hashtags: 
  - "#azure"
  - "#chocolatey"
---

I had to reset my Surface and reinstall every tool. That would be a very time consuming job - but it is 2019 - and can be automated very efficiently.  
In this post, I show you how and what I install on every new PC I get with Chocolatey - with Azure in mind.
<!--more-->

The very first thing I do when I setup a new PC is I install [Chocolatey](https://chocolatey.org) - with it you can install software with simple commands - or in their words:

> Chocolatey is a package manager for Windows (like apt-get or yum but for Windows). It was designed to be a decentralized framework for quickly installing applications and tools that you need. It is built on the NuGet infrastructure currently using PowerShell as its focus for delivering packages from the distros to your door, err computer.
> -- https://chocolatey.org/about

The installation of chocolatey is one powershell command. Then you can install software with **choco install <package>** and most of the time you can guess the name of the package. You can see it in action in the gif at the top - installing Visual Studio Code took 18 seconds!

All my other files are either in OneDrive or stored in git, getting a new PC or resetting it is not a big deal for me and it should not. 

## My Tools list for Azure

The following is my list of Azure tools that I usually install to use and manage Azure - it is opinionated.

{{< highlight powershell >}}
#Dev
choco install vscode
choco install gitextensions
choco install dotnetcore

#Azure
choco install azure-cli
choco install az 
choco install microsoftazurestorageexplorer
choco install putty
choco install terraform

#AzureAd
Install-Module -Name AzureAD

#Productivity
choco install googlechrome
choco install adobereader
choco install microsoft-teams
choco install autohotkey
choco install greenshot
choco install paint.net

#VS2017
choco install visualstudio2017enterprise
choco install visualstudio2017-workload-azure

#Container
choco install kubernetes-helm

#blogging
choco install hugo
{{< /highlight >}}

After pasting everything above in an elevated powershell it takes ~2 hours and my PC is ready to go.

Awesome, right?
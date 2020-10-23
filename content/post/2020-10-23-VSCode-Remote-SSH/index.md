---
title: "VSCode Remote-SSH with Azure"
date: 2020-10-23T23:59:47+02:00
2020: "10"
author: "Max Melcher"
categories:
  - Azure
tags:
  - VSCode
  - Remote-SSH
  - Performance
featured: "images/Remote-SSH.png"
featuredalt : "Remote-SSH to Azure VM"
hashtags: 
  - "#azure"
---

# VSCode Remote-SSH with Azure

This article shows you how you can connect VSCode on your local computer to a linux VM on Azure.<!--more-->

With [Visual Studio Code](https://code.visualstudio.com/) (VSCode) you can connect to a Linux VM ([WSL](https://code.visualstudio.com/docs/remote/wsl), [container](https://code.visualstudio.com/docs/remote/containers) or remote via [SSH](https://code.visualstudio.com/docs/remote/ssh)) and it will look and feel like it is running locally. It creates a tunnel to the remote machine / VM, connects the terminal, shows the folder and much more. It is so great that you typically cannot spot the difference.

The screenshot below is taken from a windows computer that is connected to a VM running on Azure. It shows the local file system of the remote machine, has syntax highlighting of the terraform code on the right, and shows the remote bash of the system. Even the extensions are running as if they would run locally.

{{< fancybox "images" "Remote-VSCode.png" "great local development experience with remote power" "single_image" >}}

The approach has several benefits compared to running VSCode locally.

## Bandwidth

If you develop and must download and upload huge files and need very good internet, then developing remotely in this full-featured development environment can be of great help. Azure VMs have great internet connection, uploading large files from there is very fast. If the target service is also an Azure service, then it is even faster. Pushing a docker image to Azure Container registry is done in seconds.

## Performance

Azure has [284 different VM sizes](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/) (more are being added all the times!), combinations of CPU and RAM. You need a faster CPU? More memory? More IOPS? A few clicks in the portal (or a script) and you have the developer machine that gets the job done.

## Stability &amp; Runtime

Even with a slow and unreliable conference Wi-Fi there is a good chance that an SSH connection can be established. Same applies to traveling. If you must run a script that runs for several minutes or hours, you do not want to depend on your local connection. With the remote-ssh connection you have the best of both worlds, a great local development experience and the stability of the remote runtime.

## Tipps &amp; Tricks

Do you use this setup already? Do you have other requirements to use such a setup? Then share them in the comments!

Hope it helps,  
Max
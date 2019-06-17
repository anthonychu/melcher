---
title: "TIL: Set Docker Environment Variables in Visual Studio for easier debugging"
date: 2019-01-20T12:57:11+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Docker
  - Visual Studio
tags:
  - Debugging
  - F5
  - Debug
  - Environment Variables
featured: "images/Docker ENV file for Variables.png"
featuredalt : "Docker Environment Variables in Visual Studio"
---

Today I learned how to set Docker Environment Variables directly in Visual Studio to ease my debugging experience.
<!--more-->

I really googled a lot to find an easy solution for this simple problem - and tried many different ways to pass variables directly into my attached docker container - but it took way too long to discover [this StackOverflow post](https://stackoverflow.com/questions/52370812/passing-environment-variables-to-docker-container-when-running-in-visual-studio). Hopefully my post helps someone else, too!

I even read the [excellent docs from asp.net core](https://docs.microsoft.com/en-us/dotnet/core/docker/docker-basics-dotnet-core) - but there is no mention how to pass docker environment variables directly to the container so that you can debug them. In my side-project I have an asp.net core web app that needs one or more configuration parameters that can be set with the **-e** switch in the docker run command:

{{< highlight bash >}}
docker run -e "PAT=123" image
{{< /highlight >}}


But I want to have a Visual Studio debugger attached so that I can debug into my code as seen in the following screenshot:
{{< fancybox "images" "Debugger1.png" "I want to set and see the variable PAT" "single_image" >}}

Following the accepted answer in the StackOverflow post, I created a file called "settings.env" and filled it with key/value pairs. Lines starting with # are comments:

{{< highlight toml>}}
#Personal Access Token to write back the plan output to Azure DevOps
PAT=[Personal Access Token]
PROJECT=[Azure DevOps Project URL]
VARIABLE=[Filename of the variable file including extension]
WORKSPACE=[Name of the default workspace]
{{< /highlight >}}

Then I edited my project (.csproj) file and added

{{< highlight xml >}}
<DockerfileRunEnvironmentFiles>settings.env</DockerfileRunEnvironmentFiles>
{{< /highlight >}}

to a PropertyGroup-tag so it looks like the following:

{{< highlight xml "hl_lines=7" >}}
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>netcoreapp2.1</TargetFramework>
    <DockerTargetOS>Linux</DockerTargetOS>
    <DockerDefaultTargetOS>Linux</DockerDefaultTargetOS>
    <DockerfileRunEnvironmentFiles>settings.env</DockerfileRunEnvironmentFiles>
  </PropertyGroup>

</Project>
{{< /highlight >}}

The I started the debugger with F5 and finally I can easily debug my solution even with docker environment variables:
{{< fancybox "images" "Debugger2.png" "Debugger attached and my docker environment variable is set" "single_image" >}}

Hope it helps,  
Max
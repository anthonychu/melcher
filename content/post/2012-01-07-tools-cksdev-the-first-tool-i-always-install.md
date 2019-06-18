---
title: 'Tools: CKSDev – the first tool I always install'
author: Max Melcher
aliases:
   - "/post/2012-01-07-tools-cksdev-the-first-tool-i-always-install/"
2012: "01"
type: post
date: 2012-01-07T13:10:48+00:00
url: /2012/01/tools-cksdev-the-first-tool-i-always-install/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/m
categories:
  - Development
  - SharePoint 2010
  - Tools

---
If you do SharePoint 2010 development and you haven't used this plugin for Visual Studio you have really missed a jewel:

CKSDev - Community Kit for SharePoint: Development Tools Edition

<!--more-->

## Key Features:

  * [Copy Assembly Name][1]: Quickly get the Assembly name with namespace and everything, e.g. "DCR.Service, Version=1.0.0.0, Culture=neutral, PublicKeyToken=bca0ae98ad91855f"
  * [Sandbox Compile][2]: Compile against the Sandbox Object Model, if that works you can be more certain that you only use methods that are allowed within the sandbox
  * [Generate Entity Classes][3]: Generate the SPMetal (Linq to SharePoint) entities. That is great for small projects - in bigger scenarios you have to use the spmetal.exe to create it (it does not support namespacing or exclude list etc)
  * Several new Visual Studio templates: Sandboxed Visual Web Part (try to build one by yourself! 🙂 ), Custom Actions for the ribbon, SharePoint Console Application (includes the references to SharePoint etc).
  * <a title="Quick Deployment" href="http://cksdev.codeplex.com/documentation?referringTitle=Home&ANCHOR#Deployment" target="_blank">Quick deploy context commands</a>: I LOVE THOSE. Create a Visual Web Part, change something in the declarative parts or in the JavaScript and quick deploy it (this copies the files to the SharePoint 14 folder) - refresh the browser and you see the changes. No deploy, no IIS app recycle - no wait time! There are several more quick deploy commands and there are keyboard hotkeys for the actions.

<div>
  There are several more features - please visit the <a title="CKSDev" href="http://cksdev.codeplex.com/" target="_blank">project site</a>, maybe there is a more recent version by now.
</div>

&nbsp;

## Why I love the plugin:

It really speeds up my daily work - quick "deploy" is awesome same is "attach to all SharePoint processes" for debugging!

{{< fancybox "/wp-content/uploads/" "cksdev.png" "" "single_image" >}}

## How to get it:

<a title="CKSDev project site" href="http://cksdev.codeplex.com" target="_blank">CKSDev.codeplex.com</a> or in the Visual Studio Extension:

{{< fancybox "/wp-content/uploads/" "Bildschirmfoto-2012-01-07-um-13.17.08.png" "" "single_image" >}}

## I am a plugin hunter!

So whats your favorite Plugin/Tool for SharePoint?

 [1]: http://cksdev.codeplex.com/wikipage?title=Copy%20Assembly%20Name&referringTitle=Documentation
 [2]: http://cksdev.codeplex.com/wikipage?title=Sandbox%20Compile&referringTitle=Documentation
 [3]: http://cksdev.codeplex.com/wikipage?title=Generate%20Entity%20Classes&referringTitle=Documentation

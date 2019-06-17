---
title: 'ShareCamp.at: Extending Visual Studio SharePoint Tools'
author: Max Melcher
aliases:
   - "/post/2013-09-07-sharecamp-extending-visual-studio-sharepoint-tools/"
2013: "09"
type: post
date: 2013-09-07T11:35:31+00:00
url: /2013/09/sharecamp-extending-visual-studio-sharepoint-tools/
yourls_shorturl:
  - http://melcher.it/s/1i
categories:
  - Development

---
[Peter Holpar][1] showed us how to extend the Visual Studio Tools for SharePoint.

## Implementation

The creation of a Visual Studio Extension is basically a custom class that implements some interfaces. The biggest problem is that the documentation is not that good – Peter told us that it needs a lot of debugging to get things working.

## PreReqs

Get the Visual Studio 2012/2013 SDK and you need, of course, an installed SharePoint because of the assemblies.

## Use Cases

  1. Providing Templates for SharePoint Items (Project Templates, Feature Templates – you name it)
  2. Creating custom deployment steps

## Key takeaway

Okay, this is a lot of work – you need a very good reason to develop a custom extension. Looking at the awesome [CKSDEV extension][2] – I really value this extension more now.

 [1]: http://pholpar.wordpress.com
 [2]: http://cksdev.codeplex.com

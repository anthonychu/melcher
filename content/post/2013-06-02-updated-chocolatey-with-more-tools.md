---
title: Updated chocolatey with more tools
author: Max Melcher
aliases:
   - "/post/2013-06-02-updated-chocolatey-with-more-tools/"
2013: "06"
type: post
date: 2013-06-02T12:12:34+00:00
url: /2013/06/updated-chocolatey-with-more-tools/
yourls_shorturl:
  - http://melcher.it/s/1
categories:
  - Development
  - Powershell
  - SharePoint 2010
  - SharePoint 2013

---
A good day for automation lovers! [@avishnyakov][1] (<http://spdevlab.com/>) contributed 5 SharePoint packages to my ChocolateySharePointPackages repository. See his blog post [here][2].

## Added packages!

Today I pushed them to the <a title="Chocolatey Gallery" href="http://chocolatey.org/packages" target="_blank">chocolatey gallery</a> and you can install them with 1 line of PowerShell.

  * cinst PowerGUIVSX 
      * Installs the <a title="PowerGui VSX" href="https://powerguivsx.codeplex.com/" target="_blank">PowerGui Visual Studio Extension</a>
  * cint SP2013PreReqs 
      * Installs all SharePoint 2013 PreRequisites
  * cinst SPSF 
      * Installs the <a title="SPSF on Codeplex" href="https://spsf.codeplex.com/" target="_blank">SharePoint Software Factory</a>
  * cinst SPCAF 
      * Installs the <a title="SPSF - SharePoint Code Analysis Framework" href="http://visualstudiogallery.msdn.microsoft.com/d3b2aaf7-0d6a-4995-a4e5-4153c57e3889" target="_blank">SharePoint Code Analysis Framework</a>

## Want more?

You can install all packages for SharePoint 2013 with 1 line - the installation takes roughly 20-30 Minutes and then you have a great Developer Box:

<pre lang="powershell">cinst all -source https://www.myget.org/F/sharepointdev</pre>

or for VS2012/SP2013:

<pre lang="powershell">cinst all -source https://www.myget.org/F/sharepoint2013dev</pre>

## Are you missing something?

Would love to hear your feedback - or if you have wishes, go for it in the comments!

 [1]: http://twitter.com/avishnyakov "@avishnyakov"
 [2]: http://spdevlab.com/2013/06/02/getting-started-with-chocolatey-nuget-meet-the-chocolateysharepointpackages-project/

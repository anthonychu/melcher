---
title: 'SharePoint 2013: Term Store Management Tool and TargetFramework 4.5 plus SignalR'
author: Max Melcher
aliases:
   - "/post/2013-06-17-sharepoint-2013-term-store-management-tool-and-targetframework-4-5-plus-signalr/"
2013: "06"
type: post
date: 2013-06-17T21:10:25+00:00
url: /2013/06/sharepoint-2013-term-store-management-tool-and-targetframework-4-5-plus-signalr/
yourls_shorturl:
  - http://melcher.it/s/K
categories:
  - SharePoint 2013

---
In certain situation you want to allow that your SharePoint can utilize the new .NET 4.5 functions – this includes WebSockets for instance. In order to get his running, you have to change the web.config of the corresponding Web Application.

<span style="background-color: #ffffff; color: #ff0000;">Disclaimer: Use this on your own risk and try it in a TEST or DEV environment first – the change can take down your SharePoint Farm or break core functions! </span>

## Manual approach

This is a step by step manual how to set the values that your SharePoint targets .NET 4.5 framework.

  1. Open the web.config with a text editor of your choice.
  2. Navigate to the element with the path /configuration/system.web/httpRuntime
  3. Add the attribute: TargetFramework=”4.5” to the httpRuntime element
  4. Save and don’t close the web.config yet.

After saving, your app pool reloads – everything should be fine by now.

Then try to open the Term Store Management on a site – AND BAM! Broken. At least the Term Store Management is a place I found that this change breaks – there could be others.

Did I mention that this manual approach is totally unsupported? An automated approach with the SPWebConfigModification class would be much better. But this is an example for the readers who made it this far (please leave a comment with your solution, thanks!)

## A fix for the Term Store Management Tool

In order to get the not so unimportant Term Store Management Tool up and running, open the web.config again:

  1. Locate the element with the path: /configuration/appSettings
  2. Add this tag: UnobtrusiveValidationMode" value="None" />
  3. Save and close the web.config

What happens is that the .NET 4.5 Framework introduces some handy ways to tell ASP that it should use unobtrusive validation – in other words html5 validation on input fields – and not validation with a postback/javascript.

## How did I notice this?

Actually this was a coincidence. I tried to enable WebSockets for SharePoint 2013 and IIS 8 – and read that I had to change the TargetFramework to 4.5. Luckily I had the Term Store Management Tool open and coincidently refreshed the page – so the error had something to do with my previous change. In addition there is a quite useful error in the event log, so I found the fix rather easily.

## Why bother?

So why do I write this? I think I will face this issue again in the future and someone has to write it down, right? And most importantly WebSockets in combination are pretty cool with <a href="http://signalr.net/" target="_blank">SignalR</a> – but that’s another story (or blog post for that matter!).

<div id="attachment_729" style="width: 610px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-17_23-11-26.png"><img data-attachment-id="729" data-permalink="https://melcher.it/2013/06/sharepoint-2013-term-store-management-tool-and-targetframework-4-5-plus-signalr/sharepoint2013-remote-desktop-connection_2013-06-17_23-11-26/" data-orig-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-17_23-11-26.png" data-orig-size="1074,501" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="WebSockets, SharePoint 2013 and Signalr - happy coexistence!" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-17_23-11-26-300x139.png" data-large-file="https://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-17_23-11-26-1024x477.png" class=" wp-image-729 " alt="WebSockets, SharePoint 2013 and Signalr - happy coexistence!" src="http://melcher.it/wp-content/uploads/sharepoint2013-Remote-Desktop-Connection_2013-06-17_23-11-26.png" width="600" height="250" /></a>
  
  <p class="wp-caption-text">
    WebSockets, SharePoint 2013 and Signalr - happy coexistence!
  </p>
</div>

## Issues with this?

Feedback or problems occurred after this change? Scroll down until you see the neat, little comment box!

&nbsp;

<span style="color: #ff0000;"><strong>Update 1: 6/19/2013</strong>: Apparently Target Framework 4.5 breaks Office Web Apps - currently I have no fix for this.</span>

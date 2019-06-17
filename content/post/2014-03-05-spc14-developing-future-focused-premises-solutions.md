---
title: 'SPC14: Developing future-focused, on-premises solutions'
author: Max Melcher
aliases:
   - "/post/2014-03-05-spc14-developing-future-focused-premises-solutions/"
2014: "03"
type: post
date: 2014-03-05T00:26:32+00:00
url: /2014/03/spc14-developing-future-focused-premises-solutions/
yourls_shorturl:
  - http://melcher.it/s/26
categories:
  - Apps
  - Conference
  - Development
  - ITPro
  - SharePoint 2013

---
SharePoint Conference 2014 session “Developing future-focused, on-premises solutions” by [Bob German][1].

> This session will focus on how to develop on-premises solutions based on architecture patterns that will support migration to Office 365 in the future. These solutions are based on a shift to client-side development to allow repackaging rather than rewriting to enable the new App model. The result is code that is safer and easier to deploy, whether on-premises or in the cloud.

This is an interesting session for me – we currently invest a lot in creating Apps.

> SharePoint development today is like MS-DOS
  
> development was in 1981

## Comparing the Models

Traditional: Runs on SharePoint, maybe even full trust code. Runs as user or omnipotent.

Modern: Designed for the cloud, runs outside SharePoint, run with granular App permissions.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1785" alt="IMG_1785" src="http://melcher.it/wp-content/uploads/IMG_1785_thumb.jpg" width="348" height="185" border="0" />][2]{.thickbox}

Switch from traditional, server-side solutions to client-side solutions will take some time – but we cant continue to create server-side solutions like nothing has changed. Bob asked the audience how many are still on SP2010 or work with it – roughly 90% raised the hand.

## Real World Scenario

Visual tracking of issues across large department

  * Deployment approval takes 6 months
  * No sandbox solution

Bob showed a pretty cool demo that renders a ticket system based on (knockout, highcharts and jQuery) – that originally was created in a content editor webpart. Then they converted it to an App with 95% code reuse – **pretty nice**!!!

> Feature Request: Auto-hosted for on-prem – make the provisioning simple

I would sign that.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1792" alt="IMG_1792" src="http://melcher.it/wp-content/uploads/IMG_1792_thumb.jpg" width="348" height="185" border="0" />][3]{.thickbox}

## 

## Workflows

Bob showed in simple steps how to create a workflow that provision a site. In his staged workflow he had an App Step (basically run with elevated permission) that created a subsite.

> Everything is an App – even Workflow runs as an App

## Summary

That was a good one – simple but effective, with some good advice how to create solutions - “develop outside of SharePoint” - so that you don’t have to recreate entirely when you migrate. Bob showed some really nice demos, I even forgot to take notes!

 [1]: http://twitter.com/bob1german
 [2]: http://melcher.it/wp-content/uploads/IMG_1785.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1792.jpg

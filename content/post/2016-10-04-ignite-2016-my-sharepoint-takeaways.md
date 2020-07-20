---
title: Ignite 2016 – My SharePoint takeaways!
author: Max Melcher
aliases:
   - "/post/2016-10-04-ignite-2016-my-sharepoint-takeaways/"
2016: "10"
type: post
date: 2016-10-04T14:35:15+00:00
url: /2016/10/ignite-2016-my-sharepoint-takeaways/
categories:
  - Azure
  - Delve
  - Development
  - Flow
  - Hybrid
  - Ignite 2016
  - Infopath
  - ITPro
  - Office 365
  - Office Graph
  - OneDrive
  - OneDrive for Business
  - PowerApps
  - Powershell
  - SharePoint 2013
  - SharePoint 2016
  - SharePoint Addins
  - SharePoint Online

---
Ignite 2016 is over and we all were updated with t**ons of new features**, **announcements** and **insights** in Atlanta - in this post I will try to give you a summary what I learned at <del>Ignite 2016</del> SharePoint Conference it Atlanta.

## Office 365 and SharePoint Online

I took that one from the [official source][1] because it pretty sums up whats coming:

The next wave of innovations to achieve the SharePoint vision (simple and powerful file sharing, mobile and intelligent intranet, open and connected platform, commitment to security, privacy and compliance) contains the following highlights:

  1. A significant update to the OneDrive browser experience, so that you can find, access, share and collaborate on all your files in Office 365
  2. OneDrive sync preview for SharePoint Online document libraries and folders shared with you
  3. Team news to keep your team up to date and informed of what matters
  4. People cards in SharePoint and OneDrive for Business that intelligently surface content and details from your colleagues’ profiles
  5. New integration with Microsoft Flow, PowerApps and Yammer
  6. Preview of the SharePoint mobile apps for Windows 10 Mobile and Android
  7. Enhancements for developers including new sites and lists APIs in Microsoft Graph
  8. New security controls including site classification and conditional access based on location and device
  9. Feature Pack 1 for SharePoint Server 2016
 10. Expanded FastTrack services and tools to support hybrid configurations and migration

And the Roadmap for Q4 2016 and H1 2017 - I really like the transparency:

[{{< fancybox "/wp-content/uploads" "image-1.png" "" "single_image" >}}][2]

### Modern Pages / Modern Document Library / Refresh to Teamsites

I really recommend you to watch the entire session - some pretty good stuff in it:

<span class="embed-youtube" style="text-align:center; display: block;"></span>

In the next month we will see lots of updates to the modern document library experience, modern pages and updates to our beloved teamsites (about time!).

{{< fancybox "/wp-content/uploads" "SharePoint-innovations-further-advance-intelligence-and-collaboration-in-Office-365-3.png" "" "single_image" >}}

And "modern pages" looks awesome, too. The promise here is that they will render on desktop, mobile browser and in the mobile apps - more on the apps late in this post.

### People card

What I really liked is the new people card - more user-centric experience are always great. "Who is that person? What is he doing in the organization and what is he working on?" - cool!

{{< fancybox "/wp-content/uploads" "SharePoint-People-Cards.png" "" "single_image" >}}

&nbsp;

### Security & Compliance

As part of the Office news the following new security and compliance capabilities in Office 365:

* Improvements to Office 365 Advanced Threat Protection
* Improvements to Office 365 Advanced Threat Protection
* Threat Intelligence
* Advanced Data Governance
* Updates to Advanced Security Management

And more insights with lots of graphs:

{{< fancybox "/wp-content/uploads" "Office-365-Activities.png" "" "single_image" >}}

### App Launcher

The new version of the Office 365 App Launcher gives you access to these new features:

* Additional customization options
* search across all the services and applications
* A tabbed layout
* You can resize, pin and organize tiles
* Support for Office 365 themes

And in a not so distant future it will list your recent Office documents:

[{{< fancybox "/wp-content/uploads" "App-Launcher.gif" "" "single_image" >}}][3]

## OneDrive for Business

Major updates to OneDrive for Business - as mentioned in [this post][4], OneDrive caused a lot of service requests in the past - but it will massively improve with the coming updates!

* Ability to sync SharePoint Online document libraries and OneDrive folders shared with you ([preview available here][5]).
* An activity center has been added to the OneDrive sync client to allow you to view synchronization nd file activity at a glance (preview).
* Notifications to your iOS or Android device when someone shares a OneDrive file with you.
* Access to SharePoint Online files in the OneDrive app on Android.
* Multi-page scan enhancements in the OneDrive app on Android.
* Ability to see over time how many people have discovered and viewed your files in OneDrive for iOS.
* Enhancements to integration with Office 2016 (First Release).
* Simple, flexible OneDrive user management in Office 365 (First Release).

{{< fancybox "/wp-content/uploads" "SharePoint-Online-sync-preview-01.png" "" "single_image" >}}

These new features are in the pipeline:

  * Rich thumbnails and previews for over 20 new file types (rolling out before the end of 2016).
  * Ability to access and edit all your files in OneDrive and SharePoint Online from the OneDrive browser client (rolling out before the end of 2016).
  * Capability to download multiple files as a .zip file (rolling out before the end of 2016).
  * Dedicated OneDrive administration console in Office 365 (rolling out before the end of 2016).

More of that in [my "OneDrive for Business - key feature and roadmap" summary.][6]

## PowerApps & Flow

That's what excited me the most - whats coming after InfoPath, lots of clients asked me about guidance here. And well, the answer could be [PowerApps][7].

[{{< fancybox "/wp-content/uploads" "WP_20160929_14_54_50_Rich_thumb.jpg" "" "single_image" >}}][8]

I attended 2 sessions to see whats [coming for PowerApps and Flow][9] - and I will soon play with it because there is so much demand in forms and simple workflows. Having the same functionality even in a mobile app will be awesome (try that with InfoPath&#8230;).

  1. PowerApps works only if an internet connection is available
  2. Its currently in preview
  3. You can connect to data sources onPrem if you install a gateway service

Flow on the other side looks like the implementation of if this then that / IFTTT - simple workflows are possible here e.g. approval and all that stuff. The power of that come into play when you connect different tools with that (Salesforce, Twitter, Slack, SQL, etc).

## Groups & Yammer

  * Better integration of Yammer in Office 365 groups
  * Uploading of files directly from SharePoint/OneDrive for Business sites, and edit them directly in the browser.
  * Share content by mail with Yammer groups
  * Manager Yammer within O365 admin center

{{< fancybox "/wp-content/uploads" "Yammer-strengthens-team-collaboration-1.png" "" "single_image" >}}

More on that in the [announcement blog post][10].

## SharePoint Framework

Apparently I could not make it to any SharePoint Framework (SPFx) session at all - the conference was packed with so many good sessions that I had to make compromises. But lots of the Framework was already [announced at May, 4th event][11].

## My Analytics

Delve Analytics was renamed to MyAnalytics - the change of the name is already live in my tenant.

1. Pinning of important contacts so you can easily see if you are loosing touch with important peers
2. Share metrics with peers to get a review or opinion about your work habits
3. Adjust your priorities to get better results

More on that here: <a href="https://blogs.office.com/2016/09/26/create-better-work-habits-with-myanalytics-formerly-delve-analytics/" target="_blank">Create better work habits with MyAnalytics (formerly Delve Analytics)</a>

## SharePoint onPrem

[Feature Pack 1 was announced][12] and will available in November - and not in Q1 2017

* Logging of administrative actions performed in Central Administration and with Windows PowerShell
* Enhancements to MinRole to support small environments ([see my post here for more details][13])
* A new OneDrive for Business user experience
* Custom tiles in the SharePoint app launcher
* Unified auditing across site collections on-premises and in Office 365
* Unified taxonomy across on-premises and Office 365
* OneDrive API 2.0

Q4 2016:

* Feedback driven updates to doclibs, lists, pages, sites and apps
* Team news
* Intelligent People Cards
* SharePoint mobile app WW Release (Android, Windows)
* Next generation sync of team sites
* Simple, fast site creation
* SharePoint Framework WW Release

First half of 2017:

* Feedback driven updates to doclibs, lists, pages, sites and apps
* More web parts
* Publishing Sites
* More Flow and PowerApps integration
* SharePoint Add-in improvements
* Modern team site extensibility
* Performance-focused CDN integration with publishing sites

## SharePoint Mobile Apps

The mobile apps got a lot of love recently - and lots is on the roadmap for them. The "intranet in your pocket" with native apps on every platform is a great driver for user adoption.

{{< fancybox "/wp-content/uploads" "image-6.png" "" "single_image" >}}

More details in my summary post [Explore whats new and whats coming with the SharePoint Apps][14]

## Spirit

SharePoint is alive! It was a blast to see how much attention (and love) SharePoint got at the Ignite 2016 - that hasn't been always the case. The following PowerBI analyzed the hashtags on twitter during the Ignite - **#SharePoint** clearly ruled. I doubt that it's because SharePoint people tweet more - the many announcements and huge amount of sessions must be the cause for that:

Microsoft Ignite 2016 delivered so many promising updates to current and planned developments nobody could doubt that SharePoint has a bright future! SharePoint ain't dead!

If you want to see more about the general roadmap, visit [https://fasttrack.microsoft.com/roadmap][15] for more insights.

If you have questions about Ignite 2016, please let me know in the comments. If wrote about every session I attended at Ignite 2016, please [see the archives][16] if you want more details.

 [1]: http://melcher.it/s/8I
 [2]: https://melcher.it/wp-content/uploads/image-1.png
 [3]: https://melcher.it/wp-content/uploads/App-Launcher.gif
 [4]: https://melcher.it/2016/09/learn-how-we-move-fast-without-breaking-things-by-managing-change-in-sharepoint-online-brk2297/
 [5]: http://melcher.it/s/8J
 [6]: https://melcher.it/2016/09/explore-onedrive-for-business-key-features-and-roadmap/
 [7]: https://powerapps.microsoft.com/en-us/
 [8]: https://melcher.it/wp-content/uploads/WP_20160929_14_54_50_Rich_thumb.jpg
 [9]: https://melcher.it/2016/09/build-business-apps-for-office-365-infopath-powerapps-flow-and-more-2051/
 [10]: http://melcher.it/s/8K
 [11]: https://blogs.office.com/2016/05/04/the-sharepoint-framework-an-open-and-connected-platform/
 [12]: http://melcher.it/s/8L
 [13]: https://melcher.it/2016/09/deploy-and-provision-best-practices-with-microsoft-sharepoint-server-2016-brk3035/
 [14]: https://melcher.it/2016/09/explore-whats-new-and-coming-with-the-sharepoint-apps-brk2037/
 [15]: http://melcher.it/s/8M
 [16]: https://melcher.it/category/ignite-2016/

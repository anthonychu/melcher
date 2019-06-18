---
title: 'SPC14: SharePoint 2013 hybrid end-to-end'
author: Max Melcher
aliases:
   - "/post/2014-03-04-spc14-sharepoint-2013-hybrid-end-end/"
2014: "03"
type: post
date: 2014-03-04T01:07:12+00:00
url: /2014/03/spc14-sharepoint-2013-hybrid-end-end/
yourls_shorturl:
  - http://melcher.it/s/21
categories:
  - ITPro
  - Office 365
  - Search
  - SharePoint 2013

---
My notes about the session "SharePoint 2013 hybrid end-to-end" by [Sam Hassani][1].

> A Hybrid environment combining SharePoint Server 2013 and SharePoint Online can fuse together the very best elements of both systems and offer a seamless experience to end-users when implemented correctly - in addition to providing you with cost savings. Attend this session to understand the solutions SharePoint hybrid environments support. We'll walk through the end-to-end configuration process covering infrastructure, identity management and SharePoint integration points. We'll use Search as a real-world example. Hybrid is a real way to begin to take advantage of cloud economics, achieve user-productive scenario benefits and the deployment approach is entirely supported by Microsoft.

Here are my session notes.

## Why Hybrid?

O365 + Azure/On-premises = hybrid. This gives you somewhat more flexibility – at higher pace.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1665" alt="IMG_1665" src="http://melcher.it/wp-content/uploads/IMG_1665_thumb.jpg" width="244" height="184" border="0" />][2]

### Hybrid Options

Search: Federated Search is possible for both directions.
  
Business Connectivity Services (BCS): Add oData sources sitting on-prem.
  
Duet Enterprise Online: Read & write against on-prem SAP systems
  
Identity Management: Single sign on and single identity for end users.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1668" alt="IMG_1668" src="http://melcher.it/wp-content/uploads/IMG_1668_thumb.jpg" width="244" height="184" border="0" />][3]

<span style="text-decoration: underline;"><strong>Enhanced capabilities will be announced for search</strong></span> – single, merged result set would be very nice –  I asked Sam after the session if he knows when this will be, probably not at this SPC.

### Identity Management

Recommendation is that when you implement DirSync that you take it one step further and implement ADFS for the best user experience – single sign on.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1667" alt="IMG_1667" src="http://melcher.it/wp-content/uploads/IMG_1667_thumb.jpg" width="244" height="184" border="0" />][4]

DirSync is limited to 50.000 – you can add filters based on OU, Domain or User Attributes – by default every 3 hours.

Azure Ad is a requirement for hybrid scenarios – including search. If you don’t have the current users account in the cloud security trimming wont work and you wont get search results.

You need to add a domain to O365, verify it and then you can activate DirSync.

Configure SSO: Server 2003 R2 and UPN are set if the domain on prem is different. Deploy ADFS 2.0. Install Microsoft Online Services Sin in Assistant and Windows Azure AD PowerShell Modules, setup a trust between ADFS and Windows Azure AD. DirSync is based on FIM.

### Search

Sam showed us how to implement a federated search, Query Rules and floating result containers. I knew that already and I skip this for brevity.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1666" alt="IMG_1666" src="http://melcher.it/wp-content/uploads/IMG_1666_thumb.jpg" width="244" height="184" border="0" />][5][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1671" alt="IMG_1671" src="http://melcher.it/wp-content/uploads/IMG_1671_thumb.jpg" width="348" height="185" border="0" />][6]

### Social

Social was another broad topic – where is your User Profile is a key question. Is it on-prem, O365 or even on Yammer. Synchronize them?

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1672" alt="IMG_1672" src="http://melcher.it/wp-content/uploads/IMG_1672_thumb.jpg" width="348" height="185" border="0" />][7]

## Summary

That was quite a good session – very thorough information from a to z what challenges you face. Good stuff!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1678" alt="IMG_1678" src="http://melcher.it/wp-content/uploads/IMG_1678_thumb.jpg" width="244" height="184" border="0" />][8]

 [1]: https://twitter.com/samhassa
 [2]: http://melcher.it/wp-content/uploads/IMG_1665.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1668.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1667.jpg
 [5]: http://melcher.it/wp-content/uploads/IMG_1666.jpg
 [6]: http://melcher.it/wp-content/uploads/IMG_1671.jpg
 [7]: http://melcher.it/wp-content/uploads/IMG_1672.jpg
 [8]: http://melcher.it/wp-content/uploads/IMG_1678.jpg

---
title: 'Learn best practices for managing and administering #SharePoint Online and OneDrive for Business #BRK3028'
author: Max Melcher
aliases:
   - "/post/2016-09-28-learn-best-practices-for-managing-and-administering-sharepoint-online-and-onedrive-for-business/"
2016: "09"
type: post
date: 2016-09-28T19:33:00+00:00
url: /2016/09/learn-best-practices-for-managing-and-administering-sharepoint-online-and-onedrive-for-business/
categories:
  - Ignite 2016
  - ITPro
  - OneDrive
  - Powershell
  - SharePoint Online

---
> In this session, learn how to manage your Microsoft SharePoint Online (SPO) and Microsoft OneDrive for Business environments in the browser (the SharePoint Online Admin Center) and by using the SharePoint Online Management Shell (a.k.a., Microsoft PowerShell for SPO). We cover numerous scenarios and demos for both seasoned SharePoint admins and new SPO admins.

By <a href="http://twitter.com/cbortlik" target="_blank">Chris Bortlik (@cbortlik)</a>

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160928_14_03_52_Rich" src="https://melcher.it/wp-content/uploads/WP_20160928_14_03_52_Rich_thumb.jpg" alt="WP_20160928_14_03_52_Rich" width="244" height="139" border="0" />][1]

Here are my session notes:

## SharePoint Online Admin 101

Site Collection Provisioning, Service Level Settings, hybrid, PowerShell will be discussed in this session.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160928_14_37_51_Rich" src="https://melcher.it/wp-content/uploads/WP_20160928_14_37_51_Rich_thumb.jpg" alt="WP_20160928_14_37_51_Rich" width="244" height="138" border="0" />][2]

### Control external sharing

> Restrictive on service level, override on site level

So in other words, global SharePoint settings are do not allow sharing with externals, but allow it on specific sites only if you need it. For anonymous sharing, Chris suggests to let the links expire, otherwise its hard to track whats still shared.

You can even create alerts if someone shared content via anonymous links with email notification – or bcc an email account if someone shares something (Powershell):

### Restrict access

There are new capabilities to restrict access to data sitting on the Microsoft platform, limit by network, domain join and more – some of them require Azure AD Premium. Need to fiddle with this, a client wanted to block specific clients from sync and access.

### Prevent data loss

Multitude of different options here, from stop sync to Azure RMS / IRM – different requirements require different solutions.

### Employee termination and retention

As we heard yesterday, files in OneDrive can now be retained for up to 10 years, that does not require a license.

Assign new permissions in the admin portal or forced sign-out (e.g. lost notebook or cell).

### Reporting

Audit events got a major update for SharePoint online and they can be queried with powershell. There are some usescases when this could be come handy for my clients (legal stuff & eDiscovery or people leaving the company).

### References

There is a pretty cool workbook that guides you through core questions: [https://blogs.office.com/2015/11/23/announcing-office-365-customer-security-considerations-preview/][3]

Chris has a lot of stuff on his blog: [https://blogs.technet.microsoft.com/cbortlik/][4]

## Summary

Lots of demos (could not catch everything here, go watch the recording!), lots of insights and tips & tricks – I need to dive deeper afterwards.

The shown powershell scripts are super handy, I totally liked the style of the session!

 [1]: https://melcher.it/wp-content/uploads/WP_20160928_14_03_52_Rich.jpg
 [2]: https://melcher.it/wp-content/uploads/WP_20160928_14_37_51_Rich.jpg
 [3]: https://blogs.office.com/2015/11/23/announcing-office-365-customer-security-considerations-preview/ "https://blogs.office.com/2015/11/23/announcing-office-365-customer-security-considerations-preview/"
 [4]: https://blogs.technet.microsoft.com/cbortlik/ "https://blogs.technet.microsoft.com/cbortlik/"

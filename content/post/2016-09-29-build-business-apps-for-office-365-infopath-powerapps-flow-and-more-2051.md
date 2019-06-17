---
title: 'Build business apps for Office 365 – InfoPath, PowerApps, Flow and more #BRK2051'
author: Max Melcher
aliases:
   - "/post/2016-09-29-build-business-apps-for-office-365-infopath-powerapps-flow-and-more-2051/"
2016: "09"
type: post
date: 2016-09-29T20:29:14+00:00
url: /2016/09/build-business-apps-for-office-365-infopath-powerapps-flow-and-more-2051/
categories:
  - Flow
  - Ignite 2016
  - Infopath
  - PowerApps

---
Whats the story post Infopath and how to build business apps with PowerApps? – in this session <a href="https://twitter.com/@cmcnulty2000" target="_blank">Chris McNulty (@cmcnulty2000)</a> and  Kerem Yuceturk will tell us!

> No-code and low-code applications have been essential tools in Microsoft SharePoint for a long time, but we’ve added many other new tools to your palette. We review the roadmap and best practices for InfoPath, SharePoint Designer, Access Web Apps, Flow, PowerApps and more.

### Start with a demo!

Always good to start with a demo – in this case Kerem started with a “vacation request” application that I have seen a couple of time in my career, too – but this time with PowerApps on a cell phone.

So we saw Corporate Design with a Logo and style, date pickers, text fields, a calculated field that shows the amount of days between the selected days – once submitted the status field (no visible from the edit form) was set and submitted to a SharePoint list. So that one triggered a Microsoft Flow to send out a simple approval mail to approve/reject the request.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-7.png" alt="image" width="244" height="137" border="0" />][1]

Basic stuff – but a very promising start of this session!

### Microsoft Forms

EDU only, no integration to SharePoint, no designer.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-8.png" alt="image" width="244" height="134" border="0" />][2]

### PowerApps

Connect to onPrem data via a bridge that relays your requests. In that way you can access and store data to SharePoint 2013/2016 onPrem.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2016-09-29 14_39_08-https___onedrive.live.com_embed_cid=6B7CF2BD5F47F487&resid=6B7CF2BD5F47F487%2120" src="https://melcher.it/wp-content/uploads/2016-09-29-14_39_08-https___onedrive.live_.com_embed_cid6B7CF2BD5F47F487resid6B7CF2BD5F47F4872120_thumb.png" alt="2016-09-29 14_39_08-https___onedrive.live.com_embed_cid=6B7CF2BD5F47F487&resid=6B7CF2BD5F47F487%2120" width="244" height="128" border="0" />][3]

### Flow

Interact with tons of services from Twitter, SalesForce, SharePoint or simple stuff like sending emails. Dozens of templates are already available:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-9.png" alt="image" width="244" height="62" border="0" />][4]

### PowerApps Designer

The designer is a browser based (Chrome shown) to create forms.

When the PowerApp designer is started, 3 views aka screens (Browse, Edit, Details) will be created with all the fields that are existing. As of now you cannot create new fields because the SharePoint list is the master. Drag and Drop of controls, realignment – everything is there.

Search Control: You can bind a complex expression to it similar to what is possible in Excel. Here a filter condition was shown to only return items of the current user. There is an autocomplete feature for the expressions.

Controls: We saw textboxes, calendars with binding to different datasources.

Expressions & Binding: That looks powerful. You can even combine expressions like “open new form, then go to a view”.

Conditional formatting: Done with expressions

External validation & logic: Currently Azure Functions or webservices are possible. NO CODE-BEHIND and thats AWESOME.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_14_54_50_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_14_54_50_Rich_thumb.jpg" alt="WP_20160929_14_54_50_Rich" width="244" height="139" border="0" />][5]

### Flow Designer

After setting up the form, Kerem added a simple workflow.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="WP_20160929_15_13_11_Rich" src="https://melcher.it/wp-content/uploads/WP_20160929_15_13_11_Rich_thumb.jpg" alt="WP_20160929_15_13_11_Rich" width="244" height="139" border="0" />][6]

There are auto completes available if the action needs inputs e.g. from the submitted list item.

Connections: Interesting concept to link to onPrem environments through gateways. Need to fiddle with that.

### Pricing & Licensing

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-10.png" alt="image" width="244" height="160" border="0" />][7]

### Roadmap

More controls for images and attachments – multi-value fields

Flow integration for OneDrive and Document libraries

adhoc start for selected items

Embedding of PowerApps in new SharePoint pages

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-11.png" alt="image" width="244" height="126" border="0" />][8]

GA date is not yet available:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" src="https://melcher.it/wp-content/uploads/image_thumb-12.png" alt="image" width="244" height="115" border="0" />][9]

## Further notes

Because I attended a theater session about that and crawled through the expo, I asked the experts addtional questions:

**Multi Language support**: is on the roadmap, implementation details were not exposed but it sounded almost like resource files.

**Repeating fields**: is on the roadmap. Apparently my question how the repeating data is stored in the list was not answered.

## Summary

The expectations for the business applications on top of SharePoint are highest! The business productivity part of SharePoint is what made the platform so great and we need to see a modern solution for forms, requests and all the business needs.

This session was a great start that gave me confidence that PowerApps could be a great successor for Infopath – and luckily they do not try to seek feature parity with Infopath!

Cool stuff, watch the session once its online!

 [1]: https://melcher.it/wp-content/uploads/image-7.png
 [2]: https://melcher.it/wp-content/uploads/image-8.png
 [3]: https://melcher.it/wp-content/uploads/2016-09-29-14_39_08-https___onedrive.live_.com_embed_cid6B7CF2BD5F47F487resid6B7CF2BD5F47F4872120.png
 [4]: https://melcher.it/wp-content/uploads/image-9.png
 [5]: https://melcher.it/wp-content/uploads/WP_20160929_14_54_50_Rich.jpg
 [6]: https://melcher.it/wp-content/uploads/WP_20160929_15_13_11_Rich.jpg
 [7]: https://melcher.it/wp-content/uploads/image-10.png
 [8]: https://melcher.it/wp-content/uploads/image-11.png
 [9]: https://melcher.it/wp-content/uploads/image-12.png

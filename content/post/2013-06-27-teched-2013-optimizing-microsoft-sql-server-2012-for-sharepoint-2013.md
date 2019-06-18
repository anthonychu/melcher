---
title: 'TechEd 2013: Optimizing Microsoft SQL Server 2012 for SharePoint 2013'
author: Max Melcher
aliases:
   - "/post/2013-06-27-teched-2013-optimizing-microsoft-sql-server-2012-for-sharepoint-2013/"
2013: "06"
type: post
date: 2013-06-27T11:09:27+00:00
url: /2013/06/teched-2013-optimizing-microsoft-sql-server-2012-for-sharepoint-2013/
yourls_shorturl:
  - http://melcher.it/s/10
categories:
  - TechEd

---
If SQL Server does not perform, SharePoint can not show its full potential – to quote the session description:

> More than 90% of the content accessed via SharePoint is stored in SQL Server and without the correct configuration of SQL Server it can have a detrimental impact on the performance of SharePoint. Regardless of whether you have a dedicated DBA or the SharePoint administrator is also the DBA there are critical SQL Server configurations that can be made that will optimize SharePoint […]

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb18.png" width="244" height="139" border="0" />][1]

Here are my session about the session by [Brian Alderman][2] ([@brianalderman][3])

<!--more-->

## Database Overview and Recommendations

Database limit was increased,  still 200GB is recommended. Separate instance for SharePoint is Best Practice.

Instance defaults:

  * During installation set the default Collation to Latin1\_CI\_AS\_KS\_WS
  * Set the default location to something different than c: drive

Set the default grow sizes to per MB instead of percent growth rate. If your database grows instantly by 20GB it’s a performance degradation for a while. Set it to a reasonable amount.

Split the content db and the log file if possible – different drives, more performance.

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb19.png" width="244" height="139" border="0" />][4]

## Plan Site Collections

Important: If you want to stay below the 200GB limit you have to calculate the site collection bin size into amount. Good reminder. Additionally set quota templates.

## Memory

SQL Server is memory hungry – set a reasonable minimum and maximum memory. Example: 25GB minimum and 30GB maximum. In the rare cases that SQL Server releases the memory you don’t drop below 25GB. But that does not mean it claims the 25GB upfront.

## Slides

Grab the [slides][5] (once they are available), definitely worth reading!

## Evaluation

I like the topic, its very important for good performance. The hints from Brian covered so many areas, great! I wish he had a PowerShell repository how to set many of them automatically. Still, a very valuable session!

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2013-06-27T12-51-11_0.jpg"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="Brian in action!" alt="Brian in action!" src="http://melcher.it/wp-content/uploads/2013-06-27T12-51-11_0_thumb.jpg" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    Brian in action!
  </p>
</div>

 [1]: http://melcher.it/wp-content/uploads/image18.png
 [2]: http://channel9.msdn.com/Events/Speakers/brian-alderman
 [3]: https://twitter.com/brianalderman
 [4]: http://melcher.it/wp-content/uploads/image19.png
 [5]: http://channel9.msdn.com/Events/TechEd/Europe/2013/SES-B326#fbid=brbMsfI4lBZ

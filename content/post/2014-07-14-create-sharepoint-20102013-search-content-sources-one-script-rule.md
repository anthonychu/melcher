---
title: Create SharePoint 2010/2013 Search Content Sources – one script to rule them all
author: Max Melcher
aliases:
   - "/post/2014-07-14-create-sharepoint-20102013-search-content-sources-one-script-rule/"
2014: "07"
type: post
date: 2014-07-14T18:23:20+00:00
url: /2014/07/create-sharepoint-20102013-search-content-sources-one-script-rule/
yourls_shorturl:
  - http://melcher.it/s/35
categories:
  - Customization
  - Powershell
  - Search
  - SharePoint 2010
  - SharePoint 2013

---
In this article I will show you **how to create SharePoint 2010/2013 Search Content Sources**&nbsp;with a handy powershell script and **why you should care**.

> This is my 100th blog post and therefore it has to be something with SharePoint Search - something good. I had the idea for the script on my mind for quite a while now, but there was no project and no time to create it - until now.

## The Problem

During my consultant work I see quite a lot of different SharePoint environments and 90% of the Search Service Applications look like this before I start working there:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="2014-07-14 19_52_27-Search Service Application_ Manage Content Sources - Internet Explorer" src="http://melcher.it/wp-content/uploads/2014-07-14-19_52_27-Search-Service-Application_-Manage-Content-Sources-Internet-Explorer_thumb.png" alt="2014-07-14 19_52_27-Search Service Application_ Manage Content Sources - Internet Explorer" width="244" height="62" border="0" />][1]{.thickbox}

What is the problem you may ask? I see quite a few. Most intranets I see are rather big and have different sections/departments/regions within their portal - with different requirements of course. Some aggregate their content via Search (aka Search driven applications) and some don’t - some upload documents, some only use SharePoint as archive - as flexible as you can use SharePoint and as different as the requirements can be you should adjust your Search Content Sources accordingly - because everything you configure there will be in the Search Index - everything else wont.

> Everything you configure in the SharePoint Content Sources will be in the search index - everything else won't!

### So what is the problem with one content source?

You are not flexible - no different crawl schedules, no priorities - just one setup to cover everything. How about different settings for DEV / QA systems ? How about different crawl schedules for people search? LOB / BCS, external systems? Or people complain that some results appear too late in the search or that they are not there at all? Read on!

## The Solution

You can create content sources with PowerShell - that’s a good thing and enables us to automate it. So the easiest way to create a Content Source would be (except creating them by hand in the central admin) with this one-liner:

<pre>New-SPEnterpriseSearchCrawlContentSource -Type SharePoint -name "Content Source 1" -StartAddresses "http://sharepoint" -SharePointCrawlBehavior CrawlVirtualServers</pre>

You will be asked for the name of the Search Service Application and then it creates the Content Source for you&nbsp; - good, simple and works. But apparently no crawl schedule. And imagine creating that for 16 different content sources with different crawl schedules and what not. And maintainable and readable it should be, too. So we need a more sophisticated script for that with reproducible results - in other words we need a xml config file and a powershell with the logic.

My script consists out of two files - one is the [actual powershell with all the logic][2] and the second is [a xml config file with all the parameters][3] - lets have a look inside the xml file.

### XML Config File

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-14-22_38_17-C__GIT_SPContentSource_ContentSource.xml-Notepad.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="The config file contains every to be created/updated content source" src="http://melcher.it/wp-content/uploads/2014-07-14-22_38_17-C__GIT_SPContentSource_ContentSource.xml-Notepad_thumb.png" alt="The config file contains every to be created/updated content source" width="244" height="143" border="0" /></a>
  
  <p class="wp-caption-text">
    The config file contains every to be created/updated content source
  </p>
</div>

In the 3rd line you have to specify the **Search Service Application** in my case this is “Search Service Application”.

In line 13, 46 and 81 I configure three different content sources - if you want to create more, then you only have to copy one block and maybe for the ease of use the comments surrounding the block starting with **<ContentSource>** and ending with **</ContentSource>**.

Every **<ContentSource>** block has a unique **name**, a **type** (currently tested is SharePoint and File) and a **crawl behavior** (CrawlSites = crawl the site collection; CrawlVirtualServers = crawl the entire host/web app)

In every **<ContentSource>** you can define the start addresses of the content source within the **<Url>** element. If you have multiple addresses, separate them with a new line or return.

Then every **<ContentSource>** can have up two **crawl schedules**. The comments above and the three provided examples should give you a good understanding how to configure the crawl schedules.

### The script

You don’t have to read the script or customize it - everything is configured in the xml config - the script just reads the xml file that must be in the same directory. The script has no parameter but must be run in an elevated PowerShell on a SharePoint Server.

<pre lang="powershell">.\CreateContentSource.ps1</pre>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-15-11_11_09-Administrator_-SharePoint-2013-Management-Shell.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Run the script in an admin powershell" src="http://melcher.it/wp-content/uploads/2014-07-15-11_11_09-Administrator_-SharePoint-2013-Management-Shell_thumb.png" alt="Run the script in an admin powershell" width="244" height="126" border="0" /></a>
  
  <p class="wp-caption-text">
    Run the script in an admin powershell
  </p>
</div>

Running the script with the provided xml would give you the following output:

<pre lang="powershell">Search Service Application: Search Service Application&nbsp; - exists

SharePoint 2010 (QA)
Content Source: SharePoint 2010 (QA)&nbsp; already exist.

Url: <a href="http://sharepoint2013">http://sharepoint2013</a>

Schedules:

ScheduleType:&nbsp; Full
Schedule: Weekly
Days:&nbsp; Saturday
Startdate:&nbsp; 06:00

ScheduleType:&nbsp; Incremental
Schedule: Daily
Run every:&nbsp; 1&nbsp; day(s)
Repeat Interval:&nbsp; 30&nbsp; minutes
Repeat Interval:&nbsp; 1440&nbsp; minutes
SharePoint 2007 (productive)
Content Source: SharePoint 2007 (productive)&nbsp; already exist.

Url: <a href="http://sharepoint2007/sites/test1">http://sharepoint2007/sites/test1</a>
Url: <a href="http://sharepoint2007/sites/test2">http://sharepoint2007/sites/test2</a>
Url: <a href="http://sharepoint2007/sites/test3">http://sharepoint2007/sites/test3</a>

Schedules:

ScheduleType:&nbsp; Full
Schedule: Weekly
Days:&nbsp; Saturday
Startdate:&nbsp; 10:00

ScheduleType:&nbsp; Incremental
Schedule: Daily
Run every:&nbsp; 1&nbsp; day(s)
Repeat Interval:&nbsp; 30&nbsp; minutes
Repeat Interval:&nbsp; 1440&nbsp; minutes
Fileshare

Url: \\filer\folder
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Id&nbsp;&nbsp; Type&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CrawlState&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CrawlCompleted
----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --&nbsp;&nbsp; ----&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ----------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --------------
Fileshare&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19&nbsp;&nbsp; File&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Idle
Schedules:

ScheduleType:&nbsp; Full
Schedule: Weekly
Days:&nbsp; Saturday
Startdate:&nbsp; 10:00

ScheduleType:&nbsp; Incremental
Schedule: Daily
Run every:&nbsp; 1&nbsp; day(s)
Repeat Interval:&nbsp; 30&nbsp; minutes
Repeat Interval:&nbsp; 1440&nbsp; minutes
done.
</pre>

<div style="width: 203px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-15-11_15_18-Administrator_-SharePoint-2013-Management-Shell.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="... and the same as screenshot!" src="http://melcher.it/wp-content/uploads/2014-07-15-11_15_18-Administrator_-SharePoint-2013-Management-Shell_thumb.png" alt="... and the same as screenshot!" width="193" height="244" border="0" /></a>
  
  <p class="wp-caption-text">
    &#8230; and the same as screenshot!
  </p>
</div>

This will result in the following configuration in the central admin:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-15-11_23_48-Search-Service-Application_-Manage-Content-Sources-Internet-Explorer.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="3 new content sources" src="http://melcher.it/wp-content/uploads/2014-07-15-11_23_48-Search-Service-Application_-Manage-Content-Sources-Internet-Explorer_thumb.png" alt="3 new content sources" width="244" height="145" border="0" /></a>
  
  <p class="wp-caption-text">
    3 new content sources
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-15-11_24_15-Search-Service-Application_-Edit-Content-Source-Internet-Explorer.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="one example with the urls set" src="http://melcher.it/wp-content/uploads/2014-07-15-11_24_15-Search-Service-Application_-Edit-Content-Source-Internet-Explorer_thumb.png" alt="one example with the urls set" width="244" height="163" border="0" /></a>
  
  <p class="wp-caption-text">
    one example with the urls set
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-07-15-11_24_29-Search-Service-Application_-Edit-Content-Source-Internet-Explorer.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="... and the crawl schedules!" src="http://melcher.it/wp-content/uploads/2014-07-15-11_24_29-Search-Service-Application_-Edit-Content-Source-Internet-Explorer_thumb.png" alt="... and the crawl schedules!" width="244" height="163" border="0" /></a>
  
  <p class="wp-caption-text">
    &#8230; and the crawl schedules!
  </p>
</div>

**Important:** This script does not remove or rename content sources (it simple can't detect those changes)! If you want to rename an existing content source you can either delete the content source in the central admin or rename it there and in the xml file.

**Important:** Please keep in mind that deleting a content source or changes source addresses within a content source deletes items within your index! There will be an automatic cleanup of the index once you remove urls from a content source and you have to recrawl the items if you still need them!

If you change the parameters in the script, e.g. the crawl schedule and run the script again - the script will update the content source for you. So if you have a different environment with the same configuration, just copy both files - if they are different, you have to adjust the config file accordingly.

## How to get the script

I released the script based on the [MIT license][4] in this GitHub repository:

[https://github.com/MaxMelcher/SPContentSource][5]

## Feedback / next steps

Some parts of the script are in a very rough state - I will update the script very soon because I need it in a project. Some of the next steps are:

  1. Handle priorities
  2. Support continuous crawl (SP2013 only)
  3. Implement BCS and other types
  4. Add some more logging
  5. Add some error handling
  6. Add crawl rules

If you encounter any bug or problem **please drop me a line** or **open an issue** [here][6]. **Contributions** and **pull requests** or any other **feedback is much appreciated**.

 [1]: http://melcher.it/wp-content/uploads/2014-07-14-19_52_27-Search-Service-Application_-Manage-Content-Sources-Internet-Explorer.png
 [2]: http://melcher.it/s/30
 [3]: http://melcher.it/s/2Z
 [4]: http://melcher.it/s/32
 [5]: http://melcher.it/s/33 "https://github.com/MaxMelcher/SPContentSource"
 [6]: http://melcher.it/s/34

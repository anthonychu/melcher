---
title: 'Fast for SharePoint: Build & version numbers'
author: Max Melcher
aliases:
   - "/post/2012-01-26-fast-for-sharepoint-build-numbers/"
2012: "01"
type: post
date: 2012-01-26T22:26:49+00:00
url: /2012/01/fast-for-sharepoint-build-numbers/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/w
categories:
  - FAST for SharePoint
  - SharePoint 2010
  - Uncategorized

---
Ever wondered what FAST for SharePoint (FS4SP) version is currently installed? Ever checked if every server in the search cluster has the same version?

### Check the version!

The best approach is - open "Program and Features" and check the version there:

{{< fancybox "/wp-content/uploads/" "fast_version2.png" "" "single_image" >}}

With "View installed updates" you can even see if Cumulative Updates have been installed.

Please be aware that not all files are updated after a patch so the versions in other files or tools can be different.

### The stale "version.xml"

If you stumble accross the\etc\version.xml (e.g. C:\FASTSearch\etc\version.xml) file you can see the version number - but its not updated even if you install SP1.

[<img title="FAST for SharePoint version file" src="http://melcher.it/wp-content/uploads/fast_version-300x208.png" alt="" width="300" height="208" />][2]

<div>
  <dl id="attachment_109">
    <dd>
      FAST for SharePoint versio.xml
    </dd>
  </dl>
</div>

### Versions (incomplete, to be continued):

<table border="0">
  <caption>FAST For SharePoint Versions/Builds</caption> <tr>
    <th>
      Version
    </th>
    
    <th>
      Description
    </th>
  </tr>
  
  <tr>
    <td>
      14.0.4763.1000
    </td>
    
    <td>
      FAST for SharePoint RTM
    </td>
  </tr>
  
  <tr>
    <td>
      14.0.6029.1000
    </td>
    
    <td>
      FAST for SharePoint Service Pack 1
    </td>
  </tr>
  
  <tr>
    <td>
      14.0.6029.1000
    </td>
    
    <td>
      FAST for SharePoint Service Pack 1 with CU June 2011
    </td>
  </tr>
</table>

As you can see there is no version difference between SP1 and CU June 2011.

&nbsp;

### Did I miss a version? Cumulative Updates anyone?

&nbsp;

&nbsp;

### Update 1 (30.01.2012)

As mentioned by Dan in the comments its better to directly check Programs and Features. I updated the post, thanks Dan!

 [1]: http://melcher.it/wp-content/uploads/fast_version2.png
 [2]: http://melcher.it/wp-content/uploads/fast_version.png

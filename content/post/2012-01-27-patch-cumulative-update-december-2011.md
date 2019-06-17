---
title: 'Patch: Cumulative Update December 2011'
author: Max Melcher
aliases:
   - "/post/2012-01-27-patch-cumulative-update-december-2011/"
2012: "01"
type: post
date: 2012-01-27T08:06:54+00:00
url: /2012/01/patch-cumulative-update-december-2011/
aktt_notify_twitter:
  - 'yes'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/n
categories:
  - SharePoint 2010

---
I installed a new SharePoint demo and developing environment on my notebook and started with the slip-streamed installation of SharePoint with SP1 included.

After configuring everything I tried to upload some Pictures to the UserProfiles I created in my Active Directory (synchronization did work!!!) but I got faced with this nice error:

<pre>Method not found: 'System.String Microsoft.Office.Server.UserProfiles.UserProfileGlobal.GetImportPhotoFolderName(System.Globalization.CultureInfo)'.</pre>

## 

## I really love the User Profile Service

I did some research and found out that the SharePoint 2010 Cumulative Update December 2012 should fix some problems of the User Profile Service (still wondering why this could pass the quality control&#8230;).

<pre><ul>
  <li>
    1. The&nbsp;<strong>UserProfileManager.GetUserProfile</strong>&nbsp;method returns incorrect user profiles in SharePoint Server 2010.
  </li>
  	
  
  <li>
    2. An administrator cannot upload a user’s profile picture to Central Administration in SharePoint Server 2010. Additionally, the administrator receives the following error message:
  </li>
  	
  
  <li>
    There was an error saving the picture. Please try again later.
  </li>
  
</ul>
</pre>

## It works!

So after 3 times downloading the 1.1gb uber-patch (it includes the SharePoint Foundation updates and the languages packs) I started the updated and &#8230; waited. I really dont know how long it took to update, after 30 Minutes of no progress I decided to go to bed - this morning I saw the update was successfully installed. After that I rebooted.

[<img data-attachment-id="122" data-permalink="https://melcher.it/2012/01/patch-cumulative-update-december-2011/cu_dec2011/" data-orig-file="https://melcher.it/wp-content/uploads/cu_dec2011.png" data-orig-size="511,169" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="SharePoint 2010 Cumulative Update  December 2011" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/cu_dec2011-300x99.png" data-large-file="https://melcher.it/wp-content/uploads/cu_dec2011.png" class="alignleft size-medium wp-image-122" title="SharePoint 2010 Cumulative Update  December 2011" src="http://melcher.it/wp-content/uploads/cu_dec2011-300x99.png" alt="" width="300" height="99" srcset="https://melcher.it/wp-content/uploads/cu_dec2011-300x99.png 300w, https://melcher.it/wp-content/uploads/cu_dec2011.png 511w" sizes="(max-width: 300px) 100vw, 300px" />][1]

Remember: After the update you have to run

<pre>psconfig -cmd upgrade -inplace b2b -wait</pre>

or the SharePoint Configuration Wizard to update the Content-DBs and get every other bit updated.

## 

## Download

Read the KB first. Only download and install the CU after carefully testing it on a TEST system:

KB:&nbsp;<a href="http://support.microsoft.com/default.aspx?scid=kb;EN-US;2597014" target="_blank">http://support.microsoft.com/default.aspx?scid=kb;EN-US;2597014</a>

Download:&nbsp;<a href="http://support.microsoft.com/hotfix/KBHotfix.aspx?kbnum=2597014&kbln=en-us" target="_blank">http://support.microsoft.com/hotfix/KBHotfix.aspx?kbnum=2597014&kbln=en-us&nbsp;</a>

## 

## Any other experiences with this CU?

Please feel free to share it in the comments, would love it!

 [1]: http://melcher.it/wp-content/uploads/cu_dec2011.png

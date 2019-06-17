---
title: 'User Group Munich: SharePoint 2016 Hybrid with Samuel Zuercher'
author: Max Melcher
aliases:
   - "/post/2016-06-20-user-group-munich-hybrid-sp2016/"
2016: "06"
type: post
date: 2016-06-20T11:30:52+00:00
url: /2016/06/user-group-munich-hybrid-sp2016/
yourls_shorturl:
  - http://melcher.it/s/81
categories:
  - Hybrid
  - SharePoint 2016
  - Uncategorized

---
<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Some quick notes  (more a braindump) about the last SharePoint User Group in Munich (6/14/2016) with <a href="https://sharepointszu.com/">Samuel Zuercher</a>. Samuel was apparently a little sick, but still presented remotely!
</p>

<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  That was one of the funniest User Group in a while, I had good fun and Samuel delivered some solid info about SharePoint 2016 hybrid story.
</p>

<h2 lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Hybrid Overview by Samuel Zuercher
</h2>

<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Start with OneDrive
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Shared with me does not work with mixed content.
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Hybrid sites - no provisioning support
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  No hybrid for Managed Metadata - woot?
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  App Launcher does not show full experience. Results are separated by environment - hopefully fixed soon, this will be a problem for lots of users. Confuses me, too!
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  No migration of sites - a scenario picker with support options would be great here.
</li>

<div id="attachment_2139" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/ug_062016_1.png"><img data-attachment-id="2139" data-permalink="https://melcher.it/2016/06/user-group-munich-hybrid-sp2016/ug_062016_1/" data-orig-file="https://melcher.it/wp-content/uploads/ug_062016_1.png" data-orig-size="5344,3008" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="User Group Munich" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/ug_062016_1-300x169.png" data-large-file="https://melcher.it/wp-content/uploads/ug_062016_1-1024x576.png" class="wp-image-2139 size-medium" src="https://melcher.it/wp-content/uploads/ug_062016_1-300x169.png" alt="Attention level is high!" width="300" height="169" srcset="https://melcher.it/wp-content/uploads/ug_062016_1-300x169.png 300w, https://melcher.it/wp-content/uploads/ug_062016_1-768x432.png 768w, https://melcher.it/wp-content/uploads/ug_062016_1-1024x576.png 1024w, https://melcher.it/wp-content/uploads/ug_062016_1-930x523.png 930w, https://melcher.it/wp-content/uploads/ug_062016_1-765x431.png 765w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Attention level is high!
  </p>
</div>

SharePoint is like iceberg, management and end users only see the tip of it - Samuel Zuercher

<h2 style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Scenario Picker
</h2>

<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  OneDrive
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Hybrid Sites
</li>
<li lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  More scenarios will follow
</li>

<h2 lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Social story
</h2>

<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Out of the box newsfeed not recommended. 100% same functionality as for SP2013, maybe even the exact same code.
</p>

<h2 lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Site Provisioning
</h2>

<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Provisioning: App Model und Remote Provisioning (<a href="https://github.com/OfficeDev/PnP">officepnp</a>)<img src="file:///C:/Users/Max/AppData/Local/Temp/msohtmlclip1/02/clip_image002.png" alt="Machine generated alternative text: ON PREMISE PROVISIONING THROUGH POWERSHELL to approve Site Requests oroÄsion an On Prem or Is XML that runs in a (Cn Ft±rn) including a Template -STSO (Teamstte) " width="466" height="262" />
</p>

> <p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
>   Teamsite template is the only good template  - Samuel Zuercher
> </p>

<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Provision site templates with site deletion policy to implement governance.
</p>

<div id="attachment_2140" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/ug_062016_2.png"><img data-attachment-id="2140" data-permalink="https://melcher.it/2016/06/user-group-munich-hybrid-sp2016/ug_062016_2/" data-orig-file="https://melcher.it/wp-content/uploads/ug_062016_2.png" data-orig-size="5344,3008" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="User Group - Site Provisioning" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/ug_062016_2-300x169.png" data-large-file="https://melcher.it/wp-content/uploads/ug_062016_2-1024x576.png" class="wp-image-2140 size-medium" src="https://melcher.it/wp-content/uploads/ug_062016_2-300x169.png" alt="Site Provisioning with Powershell" width="300" height="169" srcset="https://melcher.it/wp-content/uploads/ug_062016_2-300x169.png 300w, https://melcher.it/wp-content/uploads/ug_062016_2-768x432.png 768w, https://melcher.it/wp-content/uploads/ug_062016_2-1024x576.png 1024w, https://melcher.it/wp-content/uploads/ug_062016_2-930x523.png 930w, https://melcher.it/wp-content/uploads/ug_062016_2-765x431.png 765w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Site Provisioning with PowerShell
  </p>
</div>

<h2 lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Hybrid Search
</h2>

<p lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Configuration is complex, script-based solution is available makes your life easier!
</p>

<h2 lang="de" style="margin: 0in; font-family: Calibri; font-size: 11.0pt;">
  Summary
</h2>

Solid session, free beer (thanks AvePoint!) and many like-minded! Good stuff!

---
title: Download all SPC14 session slides (simple solution)
author: Max Melcher
aliases:
   - "/post/2014-03-12-spc14-download-session-slides-simple-solution/"
2014: "03"
type: post
date: 2014-03-12T09:51:22+00:00
url: /2014/03/spc14-download-session-slides-simple-solution/
yourls_shorturl:
  - http://melcher.it/s/2i
categories:
  - Conference

---
Attended SPC14 in Las Vegas and want to download all slides? Here we go with a really simple solution – it only takes some times and roughly 100 clicks. Kudos to [Sahil Malik][1] for the script.

## 6 easy steps to download all SPC14 session slides

1. Open SPC14 Yammer: [https://www.yammer.com/sharepointconference/groups/company/uploaded_files][2]

2. Filter on Documents:

<div style="width: 460px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image32.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb32.png" width="450" height="186" border="0" /></a>
  
  <p class="wp-caption-text">
    Filter on Documents to remove unwanted files
  </p>
</div>

3. Scroll down and click on “More” until all elements are visible:

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image33.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb33.png" width="244" height="56" border="0" /></a>
  
  <p class="wp-caption-text">
    Scroll down and click on more - repeat until all files are visible.
  </p>
</div>

4. Open Developer Tools (F12)

5. Paste in this script and execute:

<pre lang="javascript">jQuery.each(jQuery('[href^="<a href="https://www.yammer.com/sharepointconference/uploaded_files/&quot;]')">https://www.yammer.com/sharepointconference/uploaded_files/"]')</a>, function (index, elem) {
window.open(elem.href.replace('sharepointconference', '/api/v1') + '/download');
});</pre>

<div id="attachment_1471" style="width: 310px" class="wp-caption alignnone">
  <a href="http://melcher.it/wp-content/uploads/2014-03-12_10-39-47.png"><img data-attachment-id="1471" data-permalink="https://melcher.it/2014/03/spc14-download-session-slides-simple-solution/_2014-03-12_10-39-47/" data-orig-file="https://melcher.it/wp-content/uploads/2014-03-12_10-39-47.png" data-orig-size="1680,1012" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Execute script to download all session slides" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-300x180.png" data-large-file="https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-1024x616.png" class="size-medium wp-image-1471" alt="Execute script to download all session slides" src="http://melcher.it/wp-content/uploads/2014-03-12_10-39-47-300x180.png" width="300" height="180" srcset="https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-300x180.png 300w, https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-1024x616.png 1024w, https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-930x560.png 930w, https://melcher.it/wp-content/uploads/2014-03-12_10-39-47-765x460.png 765w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Execute script to download all session slides
  </p>
</div>

If there is a popup warning allow them always and rerun the script.
  
[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="_2014-03-12_10-40-06" alt="_2014-03-12_10-40-06" src="http://melcher.it/wp-content/uploads/2014-03-12_10-40-06_thumb.png" width="244" height="25" border="0" />][3]{.thickbox}

6. Click on save until all files are downloaded.

<div id="attachment_1472" style="width: 310px" class="wp-caption alignnone">
  <a href="http://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33.png"><img data-attachment-id="1472" data-permalink="https://melcher.it/2014/03/spc14-download-session-slides-simple-solution/downloads_2014-03-12_11-02-33/" data-orig-file="https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33.png" data-orig-size="1024,1010" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;}" data-image-title="Downloads" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-300x295.png" data-large-file="https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33.png" class="size-medium wp-image-1472" alt="Slides Slides Slides!" src="http://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-300x295.png" width="300" height="295" srcset="https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-300x295.png 300w, https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-80x80.png 80w, https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-36x36.png 36w, https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-930x917.png 930w, https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33-765x754.png 765w, https://melcher.it/wp-content/uploads/Downloads_2014-03-12_11-02-33.png 1024w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Slides Slides Slides!
  </p>
</div>

## Other options

I tried to create a console application to authenticate and download files – but that was so much pain that I went for the not so comfortable JavaScript variant. If you have improvements to this - **leave a comment!**

 [1]: http://blah.winsmarts.com/2014-3-Download_Multiple_Files_from_Yammer_-_easily.aspx
 [2]: https://www.yammer.com/sharepointconference/groups/company/uploaded_files "https://www.yammer.com/sharepointconference/groups/company/uploaded_files"
 [3]: http://melcher.it/wp-content/uploads/2014-03-12_10-40-06.png

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

{{< fancybox "/wp-content/uploads" "2014-03-12_10-39-47.png" "" "single_image" >}}

If there is a popup warning allow them always and rerun the script.
  
[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="_2014-03-12_10-40-06" alt="_2014-03-12_10-40-06" src="http://melcher.it/wp-content/uploads/2014-03-12_10-40-06_thumb.png" width="244" height="25" border="0" />][3]

6. Click on save until all files are downloaded.

{{< fancybox "/wp-content/uploads" "Downloads_2014-03-12_11-02-33.png" "" "single_image" >}}

## Other options

I tried to create a console application to authenticate and download files – but that was so much pain that I went for the not so comfortable JavaScript variant. If you have improvements to this - **leave a comment!**

 [1]: http://blah.winsmarts.com/2014-3-Download_Multiple_Files_from_Yammer_-_easily.aspx
 [2]: https://www.yammer.com/sharepointconference/groups/company/uploaded_files "https://www.yammer.com/sharepointconference/groups/company/uploaded_files"
 [3]: http://melcher.it/wp-content/uploads/2014-03-12_10-40-06.png

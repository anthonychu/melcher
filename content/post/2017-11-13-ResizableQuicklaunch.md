---
title: "Quick fix: Resizable Quicklaunch for SharePoint Online"
date: 2017-11-13T21:28:51+01:00
aliases:
   - "/post/2017-11-13-ResizableQuicklaunch/"
2017: "11"
author: "Max Melcher"
image: 
- "/images/ResizableQuicklaunch.gif"
categories:
  - SharePoint Online
  - Customization
tags:
  - SharePoint Online
  - Quick Launch
  - Quick Fix
  - MasterPage
  - JavaScript
  - JQuery

featured: true
featured: "ResizableQuicklaunch.gif" 
featuredalt : "Azure Multi-Tenant Apps - the easy way" 
featuredpath : "/images"
---

As you can see in the gif above, I created a very simple customization for a specific usecase: My users created deep folder hierarchies (of course I told them not to!) with very descriptive names (metadata!) - and if they navigate deep deep inside, they have to use the tiny scrollbar on the left. And once they navigate, the scroll position is gone. Bummer! Even the enabled tree view did not help. Let's improve that! <!--more-->

## Let's modify the MasterPage

For the sake of easiness I modified the seattle MasterPage (classic experience!) and added the following in the very top:

{{< highlight html >}}
<!-- load jquery and jquery ui -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- load jquery ui css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />

<!-- add a green border for the resize effect -->
<style>
	.ui-resizable-helper { border: 2px dotted #89ba17; }
</style>


<script>
$(document).ready(function(){

	//if we are in a dialog - do nothing!
	if (window.location.href.indexOf("&IsDlg=1") > -1) return;

	//make the quick launch resizable
	$('#sideNavBox').resizable(
		{
			helper: "ui-resizable-helper",
			handles: "e"
		}
	);

	//after the resize, store the width in the local storage to make it persistent
	$('#sideNavBox').on( "resizestop", function( event, ui ) {
			// move the content box to the right
			$('#contentBox').css("margin-left", ui.size.width + 45 + "px");
			localStorage.setItem("quicklaunch.width", ui.size.width);
	} );

	//when the page is loaded and we have a width, set it.
	if (localStorage.getItem("quicklaunch.width"))
	{
		// move the content box to the right
		$('#sideNavBox').css('width', localStorage.getItem("quicklaunch.width") + "px");
		$('#contentBox').css("margin-left", parseInt(localStorage.getItem("quicklaunch.width")) + 45 + "px");
	}

});
</script>
{{< /highlight >}}

The result looks like this:
{{< fancybox "/images" "2017-11-13 23_52_56-seattle.master - melcherit - Visual Studio Code.png" "Add the code to your masterpage" "single_image" >}}

Now, if a user resizes the quick launch, the width is stored in the local storage of a browser. Once a user clicks, the old width will be restored. Reloading or browser closing wont erase this setting - neat!

Of course this customization could be rolled-out with [PnP](https://github.com/SharePoint/PnP) - or even done with a fancy [SPFX Site Extension](https://docs.microsoft.com/en-us/sharepoint/dev/spfx/extensions/overview-extensions), but this site is classic only so a quick n' dirty masterpage customization did the trick.

## What you think?

You think thats a good one? If so, leave a comment :)

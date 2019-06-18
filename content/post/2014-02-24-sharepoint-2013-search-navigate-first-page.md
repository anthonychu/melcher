---
title: 'SharePoint 2013 Search: Navigate to first Page'
author: Max Melcher
aliases:
   - "/post/2014-02-24-sharepoint-2013-search-navigate-first-page/"
2014: "02"
type: post
date: 2014-02-24T17:25:35+00:00
url: /2014/02/sharepoint-2013-search-navigate-first-page/
yourls_shorturl:
  - http://melcher.it/s/1U
categories:
  - Search
  - SharePoint 2013

---
Sometimes clients come up with crazy requests “I can not go back to first page, this pagination is not good enough” – but this one was reasonable and SharePoint 2013 search is so easy customizable, lets take it as an exercise!

## Everything is a Display Template

As the caption says, you can change almost every design aspect in SharePoint 2013 Search by changing a html file (or a .js file if you are on Foundation) – this includes the general rendering of the search results and with it the pagination.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb30.png" width="244" height="67" border="0" />][1]

So let's try to change it to the desired behavior - of course I know that you can remove the #s or click on the search loop again.

## Control_SearchResults.html

<div class="avia-box alert    ">
  <span class="avia-innerbox" >I change a system file here – do that only if you know what you are doing and document your changes!</span>
</div>

Open the file (MasterPage gallery > Display Templates > Search) and go to line 248. Then paste the following in – or download the whole template:&nbsp;[Control_SearchResults][2].

<pre lang="javascript">if (pagingInfo.length == 8 && pagingInfo[0].startItem > 31)
	{
_#-->
		

<li id="PagingLink">
  <a id="_#= $htmlEncode(pageLinkId) =#_" href="#" title="Move to first page" onclick="$getClientControl(this).page(1);return Srch.U.cancelEvent(event);"> 1 </a>
</li>

<!--#_ 	
	}
</pre>


<p>
  This example only works if you don not change the item count on the page - but who do that?
</p>


<h2>
  Result
</h2>


<p>
  The result looks like the following when you page beyond page 5.
</p>


<p>
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image31.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb31.png" width="244" height="52" border="0" /></a>
</p>


<p>
  Subtle change, but the End-Users may notice it.
</p>

 [1]: http://melcher.it/wp-content/uploads/image30.png
 [2]: http://melcher.it/wp-content/uploads/Control_SearchResults.html

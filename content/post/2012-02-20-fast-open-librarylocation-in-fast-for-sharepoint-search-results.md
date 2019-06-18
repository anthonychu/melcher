---
title: 'FAST: Open Library/Location in FAST for SharePoint search results'
author: Max Melcher
aliases:
   - "/post/2012-02-20-fast-open-librarylocation-in-fast-for-sharepoint-search-results/"
2012: "02"
date: 2012-02-20T17:25:51+00:00
url: /2012/02/fast-open-librarylocation-in-fast-for-sharepoint-search-results/
aktt_notify_twitter:
  - 'no'
aktt_tweeted:
  - "1"
yourls_shorturl:
  - http://melcher.it/s/o
categories:
  - FAST for SharePoint
  - SharePoint 2010

---

Recently I read a <a title="Open Library in SharePoint Search" href="http://www.dotnetmafia.com/blogs/dotnettipoftheday/archive/2010/08/23/adding-a-link-to-a-document-s-folder-in-sharepoint-2010-enterprise-search.aspx" target="_blank">blog post</a> how to customize the core result webpart - thats the webpart showing the results after you do a search with SharePoint 2010. The the output was modified so that you can click on a link to open the library/folder containing the document you searched - quite handy in my eyes.

## SharePoint Search

The solution for SharePoint search is quite easy, just add

{{< highlight xml >}}
<xsl:if test="isdocument = 'True'">
<a>
<xsl:attribute name="href">
<xsl:value-of select="sitename"/>
</xsl:attribute>
View Folder
</a>
</xsl:if>
{{< /highlight >}}

and you are good to go (more details in the mentioned <a href="http://www.dotnetmafia.com/blogs/dotnettipoftheday/archive/2010/08/23/adding-a-link-to-a-document-s-folder-in-sharepoint-2010-enterprise-search.aspx" target="_blank">blog post</a>).

## The Problem

If you are doing the same thing with FAST for SharePoint (FS4SP) it does not work. The propertysitename is not filled with the location of the document, the FAST crawler extracts, what it should - the sitename.

## The Solution

So I started up Visual Studio, copied the xslt and the search result xml and created a little xslt function to extract the path to a document and to show a link:

{{< highlight html >}}
<!-- changes for Open Library-->
 <div class="{$docPreviewStyle} srch-Metadata2" style="margin-bottom:20px;">
 <xsl:if test="isdocument = 'True'">
 <a>
 <xsl:attribute name="href">
 <xsl:call-template name="build-location-link">
 <xsl:with-param name="list" select="path" />
 </xsl:call-template>
 </xsl:attribute>
 View Location
 </a>
 </xsl:if>
 </div>
 {{< /highlight >}}

In the xstl search for the comment "<!- END Additional links ->" - add my code after the closing &lt;div&gt;, thats arround row number 655.

Then add the template "build-location-link" close to the end of the xslt. I added mine right before the comment "<!- End of Stylesheet ->". That should be line number 968.

{{< highlight html >}}
<xsl:template name="build-location-link">
 <xsl:param name="list" />
 <xsl:variable name="first" select="substring-before($list, '/')" />
 <xsl:variable name="remaining" select="substring-after($list, '/')" />
 <xsl:value-of select="$first" />/<xsl:if test="substring-after($remaining, '/')">
 <xsl:call-template name="build-location-link">
 <xsl:with-param name="list" select="$remaining" />
 </xsl:call-template>
 </xsl:if>
 </xsl:template>
 {{< /highlight >}}

The result should look like this:  

{{< fancybox "/wp-content/uploads" "FAST_OpenLibrary.png" "" "single_image" >}}

In my eyes the xslt is not the most elegant solution (any way to remove the recursion with xslt?) - but - I tested it in several installations now - the users loves it!

If you have trouble copy/paste all out of this file: FAST Open Library XSLT.

## Further improvements?

So how did you modify the search results - any modifications worth to share?
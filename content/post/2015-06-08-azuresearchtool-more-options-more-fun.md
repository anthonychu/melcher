---
title: AzureSearchTool – More Options, More Fun
author: Max Melcher
aliases:
   - "/post/2015-06-08-azuresearchtool-more-options-more-fun/"
2015: "06"
type: post
date: 2015-06-08T08:30:07+00:00
url: /2015/06/azuresearchtool-more-options-more-fun/
yourls_shorturl:
  - http://melcher.it/s/5l
categories:
  - Azure
  - Azure Search
  - AzureSearchTool

---
Today I released the next version of the <a href="http://melcher.it/s/5k" target="_blank">AzureSearchTool (v.0.3.0.0)</a>.
  
If you have not read about the tool at all, please see the introduction <a href="https://melcher.it/2015/06/azuresearchtool-the-very-first-release/" target="_blank">here</a>.

In the very first version the tool was quite simple and most of the search parameters were not handled. That has changed now:

## Index

I implemented the schema overview (actually that was not that much but looks great):

<div id="attachment_1949" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics.png"><img data-attachment-id="1949" data-permalink="https://melcher.it/2015/06/azuresearchtool-more-options-more-fun/azuresearchtool_indexstatistics/" data-orig-file="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics.png" data-orig-size="1080,800" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearchTool IndexStatistics" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-300x222.png" data-large-file="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-1024x759.png" class="size-medium wp-image-1949" src="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-300x222.png" alt="Index Schema and Statistics" width="300" height="222" srcset="https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-300x222.png 300w, https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-1024x759.png 1024w, https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-930x689.png 930w, https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics-765x567.png 765w, https://melcher.it/wp-content/uploads/AzureSearchTool_IndexStatistics.png 1080w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Index Schema and Statistics
  </p>
</div>

So now you can see what fields of what type you have - and how those fields are specified.

Below of the Schema you get the two available statistics - the count of documents you have indexed and how many storage you currently consume. Not that much to show here.

## Query

The query side was more work, but it is definitely worth it. Currently there are 16 query parameters available ([see specification][1]) and the AzureSearchTool now assists you entering them. Some of the fields should be Url-Encoded so I handled that one, too.

The picture shows a rather basic query for the token "dsds":

<div id="attachment_1948" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions.png"><img data-attachment-id="1948" data-permalink="https://melcher.it/2015/06/azuresearchtool-more-options-more-fun/azuresearchtool_queryoptions/" data-orig-file="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions.png" data-orig-size="1143,800" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearchTool QueryOptions" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-300x210.png" data-large-file="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-1024x717.png" class="size-medium wp-image-1948" src="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-300x210.png" alt="All options are handled now" width="300" height="210" srcset="https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-300x210.png 300w, https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-1024x717.png 1024w, https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-930x651.png 930w, https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions-765x535.png 765w, https://melcher.it/wp-content/uploads/AzureSearchTool_QueryOptions.png 1143w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    All query options are handled now
  </p>
</div>

That query results in a nice REST url that you can copy to your application:

<pre class="width-set:true wrap:true lang:default decode:true ">https://MaxMelcher.search.windows.net/indexes/twittersearch/docs?api-version=2015-02-28-Preview&search=dsds&$top=7&$skip=1&$filter=Score%20gt%200.5&searchMode=any&searchFields=Text&$count=true&$orderby=Created&$select=Text,Mention&highlight=Text&highlightPreTag=%3Cli%3E&highlightPostTag=%3C%2Fli%3E</pre>

Create that by hand or with Postman? Rather not.

If you managed to enter invalid values in the search query parameters, the AzureSearchTool now shows the error that is returned by Azure Search:

<div id="attachment_1950" style="width: 140px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool.png"><img data-attachment-id="1950" data-permalink="https://melcher.it/2015/06/azuresearchtool-more-options-more-fun/2015-06-06-22_01_52-azure-search-tool/" data-orig-file="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool.png" data-orig-size="297,688" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearchTool Errors" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool-130x300.png" data-large-file="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool.png" class="size-medium wp-image-1950" src="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool-130x300.png" alt="That error is really helpful!" width="130" height="300" srcset="https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool-130x300.png 130w, https://melcher.it/wp-content/uploads/2015-06-06-22_01_52-Azure-Search-Tool.png 297w" sizes="(max-width: 130px) 100vw, 130px" /></a>
  
  <p class="wp-caption-text">
    That error is really helpful!
  </p>
</div>

## Overall

I think the feature set almost doubled in this release. Next on I will work on Facets & Suggestions.

 [1]: https://msdn.microsoft.com/en-us/library/azure/dn798927.aspx

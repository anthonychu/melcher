---
title: AzureSearchTool – the easiest option to query Azure Search!
author: Max Melcher
aliases:
   - "/post/2015-06-04-azuresearchtool-the-very-first-release/"
2015: "06"
type: post
date: 2015-06-04T07:30:46+00:00
url: /2015/06/azuresearchtool-the-very-first-release/
yourls_shorturl:
  - http://melcher.it/s/5g
categories:
  - Azure
  - Azure Search
  - AzureSearchTool
  - Search

---
Today I released my first Open Source tool to support the development, testing, debugging of **[Azure Search][1] **- the [AzureSearchTool][2].

## AzureSearchTool - v.0.1.5.0

The tool lets you **connect to different indexes** and **assists you crafting search queries**.
  
As a byproduct it generates a REST URL for you to use in your application or website.

With this it should be easier to develop against the Azure Search REST API - and should speed up the testing time enormously. When I started fiddling with the Azure Search API I was not aware what query options I have and how they play together (even tho the documentation is quite good!).

Download is free of charge: [here][3]

## Features

In this very early release the tool covers the following areas:

### Security / Access

Provide your Azure Search Service and your API Key (currently only Admin or Secondary) work. After connecting the tool will resolve all available indexes.

The tool from now then takes care of the api-key header.

### Index

As of now, the tool will show you all available indexes. The schema / fields and types will be visible soon in the "Index" tab. If you want to change the index after you selected one, click in the menu on "Connection" and then on "Index".

<div id="attachment_1941" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/AzureSearch_Connection.png"><img data-attachment-id="1941" data-permalink="https://melcher.it/2015/06/azuresearchtool-the-very-first-release/azuresearch_connection/" data-orig-file="https://melcher.it/wp-content/uploads/AzureSearch_Connection.png" data-orig-size="1000,800" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearch Connection" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/AzureSearch_Connection-300x240.png" data-large-file="https://melcher.it/wp-content/uploads/AzureSearch_Connection.png" class="size-medium wp-image-1941" src="https://melcher.it/wp-content/uploads/AzureSearch_Connection-300x240.png" alt="In the flyout menu you can select one of your available indexes." width="300" height="240" srcset="https://melcher.it/wp-content/uploads/AzureSearch_Connection-300x240.png 300w, https://melcher.it/wp-content/uploads/AzureSearch_Connection-930x744.png 930w, https://melcher.it/wp-content/uploads/AzureSearch_Connection-765x612.png 765w, https://melcher.it/wp-content/uploads/AzureSearch_Connection.png 1000w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    In the flyout menu you can select one of your available indexes.
  </p>
</div>

### Search

In the Search section of the tool you have the option to craft queries and test them against the selected index. The tool supports you to create a query that uses the important options with an easy interface (try that with [Postman][4] - not as convenient, right?).
  
[<img data-attachment-id="1940" data-permalink="https://melcher.it/2015/06/azuresearchtool-the-very-first-release/azuresearch_search/" data-orig-file="https://melcher.it/wp-content/uploads/AzureSearch_Search.png" data-orig-size="1156,800" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearch_Search" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/AzureSearch_Search-300x208.png" data-large-file="https://melcher.it/wp-content/uploads/AzureSearch_Search-1024x709.png" class="aligncenter size-medium wp-image-1940" src="https://melcher.it/wp-content/uploads/AzureSearch_Search-300x208.png" alt="AzureSearch_Search" width="300" height="208" srcset="https://melcher.it/wp-content/uploads/AzureSearch_Search-300x208.png 300w, https://melcher.it/wp-content/uploads/AzureSearch_Search-1024x709.png 1024w, https://melcher.it/wp-content/uploads/AzureSearch_Search-930x644.png 930w, https://melcher.it/wp-content/uploads/AzureSearch_Search-765x529.png 765w, https://melcher.it/wp-content/uploads/AzureSearch_Search.png 1156w" sizes="(max-width: 300px) 100vw, 300px" />][5]

By now **$top**, **$skip**, **$filter** and **api-version** are implemented - the rest of the options will follow soon. Maybe I add validation and some examples, too.

Once you have changed the parameters, the URL in the top will be changed so that you can use it in your application.

### Raw

You need the raw JSON data that is returned by Azure Search? You want it pretty? Click on "Raw" to get the results as it is returned by Azure Search.

<div id="attachment_1942" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw.png"><img data-attachment-id="1942" data-permalink="https://melcher.it/2015/06/azuresearchtool-the-very-first-release/azuresearchtool_raw/" data-orig-file="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw.png" data-orig-size="1003,801" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="AzureSearchTool Raw" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw-300x240.png" data-large-file="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw.png" class="size-medium wp-image-1942" src="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw-300x240.png" alt="You want it raw? You get it RAW!" width="300" height="240" srcset="https://melcher.it/wp-content/uploads/AzureSearchTool_Raw-300x240.png 300w, https://melcher.it/wp-content/uploads/AzureSearchTool_Raw-930x743.png 930w, https://melcher.it/wp-content/uploads/AzureSearchTool_Raw-765x611.png 765w, https://melcher.it/wp-content/uploads/AzureSearchTool_Raw.png 1003w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    You want it raw? You get it RAW!
  </p>
</div>

## Future

As you can see not all options are implemented - I released it early to get early feedback. In the near future I will implement the Search view and all the nice options you have there. Then I will add Suggestions and Facets - because they rock.

Lastly I will develop a nice view where you can upload test data according to the schema of the selected index. Maybe, but right now I doubt it, I will add support of Index operations to create and update an index - but the Azure Portal does that pretty well and the code operations are not too complex - but well, lets see.

Scoring Profiles? Index Statistics - they are on the list, too.

## Feedback?

So you read until down here? If so, I would be happy to get some feedback from you. Something does not work? Something missing?

 [1]: http://azure.microsoft.com/en-us/services/search/
 [2]: https://github.com/MaxMelcher/AzureSearchTool/releases
 [3]: http://melcher.it/s/5f
 [4]: https://azure.microsoft.com/en-us/documentation/articles/search-chrome-postman/
 [5]: https://melcher.it/wp-content/uploads/AzureSearch_Search.png

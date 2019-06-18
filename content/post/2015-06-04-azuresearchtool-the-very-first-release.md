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

{{< fancybox "/wp-content/uploads/" "AzureSearch_Connection.png" "" "single_image" >}}

### Search

In the Search section of the tool you have the option to craft queries and test them against the selected index. The tool supports you to create a query that uses the important options with an easy interface (try that with [Postman][4] - not as convenient, right?).
  
{{< fancybox "/wp-content/uploads/" "AzureSearch_Search.png" "" "single_image" >}}[5]

By now **$top**, **$skip**, **$filter** and **api-version** are implemented - the rest of the options will follow soon. Maybe I add validation and some examples, too.

Once you have changed the parameters, the URL in the top will be changed so that you can use it in your application.

### Raw

You need the raw JSON data that is returned by Azure Search? You want it pretty? Click on "Raw" to get the results as it is returned by Azure Search.

{{< fancybox "/wp-content/uploads/" "AzureSearchTool_Raw.png" "" "single_image" >}}

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

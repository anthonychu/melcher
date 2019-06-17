---
title: 'AzureSearchTool: Suggestions, please!'
author: Max Melcher
aliases:
   - "/post/2015-07-06-azuresearchtool-suggestions-please/"
2015: "07"
type: post
date: 2015-07-06T13:30:12+00:00
url: /2015/07/azuresearchtool-suggestions-please/
yourls_shorturl:
  - http://melcher.it/s/5o
categories:
  - Azure Search
  - AzureSearchTool

---
Suggestions are a killer feature for search - same applies to Azure Search!
  
Performance for the lookup of the possible options in combination with a large index is a key here - scale scale scale!

I released [0.7.0.0 version][1] of the AzureSearchTool today.

## Suggestion

I added all of the possible suggestion options - it's a different search type so it needed a while to add it to my current implementation. But as the version number indicates, I am close to catching up with the main features. Did I mention that I **added search as you type**? And it generates this super verbose **REST Url** for you, too.

As of now all of the **12 query options** for suggestions are implemented:

[![azuresearchtool_suggestions][2]][2]

[![azuresearchtool_suggestions2][3]][3]

Maybe I will change the layout for suggestions soon - most of the times this feature will be used as type ahead - see this [codeplex code][4] as example:

![][5]

## Video - Suggestions in Action

Watch it in action, first without **fuzzy** then with it:
  
<span class="embed-youtube" style="text-align:center; display: block;"></span>

## Next version - "facet all the things"

Before I release version 1.0 I will add facets support, that's for sure! Maybe I will change the UX to support the facets visually - I will figure that one out while I implement it. Maybe I tackle the “Test Data” tab, too.

## Do you have suggestions?

If so, please leave a comment or open an [issue][6] at the AzureSearchTool github page.

 [1]: http://melcher.it/s/5n
 [2]: https://cloud.githubusercontent.com/assets/1029559/8521992/d0035718-23e9-11e5-90f1-94f8f8eb9728.png
 [3]: https://cloud.githubusercontent.com/assets/1029559/8522012/1325096a-23ea-11e5-949c-685d59456af6.png
 [4]: https://azsearchsuggestions.codeplex.com/
 [5]: http://acom.azurecomcdn.net/80C57D/blogmedia/blogmedia/2015/01/19/type-ahead.png
 [6]: https://github.com/MaxMelcher/AzureSearchTool/issues

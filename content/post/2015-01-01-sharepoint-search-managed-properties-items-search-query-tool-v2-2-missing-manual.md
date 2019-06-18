---
title: 'SharePoint Search: What Managed Properties do my Items have? (Or: Search Query Tool v2.2. – the missing manual)'
author: Max Melcher
aliases:
   - "/post/2015-01-01-sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/"
2015: "01"
type: post
date: 2015-01-01T23:25:25+00:00
url: /2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/
yourls_shorturl:
  - http://melcher.it/s/3Q
categories:
  - Development
  - ITPro
  - Search
  - SharePoint 2013
  - SharePoint Toolbox
  - Uncategorized

---
Creating Search Driven Applications is very easy with SharePoint 2013 - sometimes.

For a really simple example you need 6 steps for SharePoint content (<a title="A to Z: Create a Display Template for SharePoint 2013 Search to visualize a property of an item/document" href="http://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/" target="_blank">read detailed article here</a>)

  1. Add some columns with values to a list
  2. Full crawl
  3. Create a Managed Property with the corresponding mapping
  4. Full Crawl
  5. Drop a Search WebPart (Search Result WebPart, Content By Search or one of the other options)
  6. Create a query that fits your needs

Bam! Easy, performant solution\* and almost maintenance free (\*depends on your query).

## So? Where is/are the Problem(s)?

Most of the time its a challenge to create the search query (read this: <a title="Search Queries Explained by Mikael Svenson" href="http://techmikael.blogspot.de/2014/03/sharepoint-search-queries-explained.html" target="_blank">Search Queries explained</a>, 12 parts!) - for the most queries you need to understand what properties you have and can use to answer the business needs. For that you always have the same challenges:

  1. Are the items in the index already?
  2. Can you see it / who can see it?
  3. What properties are available for those items?
  4. Are the properties available on all items?
  5. How often do the items change?
  6. Ranking? Why is that item higher ranked?
  7. What should be visualized and how?
  8. Does my query work (at all)?

And of course many more.

## So how to tackle some/all of the problems? Search Query Tool to the rescue!

First of all, there is one tool that gives you a head start: <a title="SharePoint 2013 Search Query Tool" href="http://melcher.it/s/3P" target="_blank">Search Query Tool for SharePoint 2013</a> (free, codeplex). It is so nice, I had to contribute some time and love, too.

In the following I will show some of the main features of it that help me almost daily:

&nbsp;

{{< fancybox "/wp-content/uploads/" "SearchQueryTool1.png" "" "single_image" >}}

  1. REST URL with all selected parameters - awesome to create JavaScript apps or apps outside of SharePoint
  2. Query Options - so many and really interesting options. You don't want Phonetic Queries? There are plenty of different options here, almost all have a descriptive tooltip. Some of the fields have a tiny box right to a textbox, click on it for some useful default values. Quite handy if you don't know how to put values in.
  3. Result Tabs - you get all the results here: 
      1. Status: How many results (with and without duplicates) where delivered in what time.
      2. Raw: Unformatted JSON results (ugly, most of the time I skip that tab) - response headers are sometimes interesting in the case of an error.
      3. Primary Results: 99% of the time I am in this tab. 
        {{< fancybox "/wp-content/uploads/" "SearchQueryToolPrimary.png" "" "single_image" >}}</li>
        
          * Refinement Results: What refiners do you get with the current query. You have to use the Refiners box in the Query Options (2) to see some results. 
            {{< fancybox "/wp-content/uploads/" "SearchQueryToolRefiners.png" "" "single_image" >}}</li>
            
              * Secondary Results: Skipping that most of the times, kinda useless IMHO.
              * Suggestion Results: You have to use a suggestion query for that. {{< fancybox "/wp-content/uploads/" "SearchQueryTool_suggestion.png" "" "single_image" >}}
                
                &nbsp;</li>
                
                  * Debug - I cover that in a future blog post.</ol> </li> 
                
                  * All connection options. Very useful to test search with different accounts. You can save the connection information via the menu File >> Save Connection Properties.
                  * The advanced options. I always enable the experimental features! 
                      1. They enable a preview in the tool for supported files (office and web pages) 
                        {{< fancybox "/wp-content/uploads/" "SearchQueryTool_Preview.png" "" "single_image" >}}</li>
                        
                          * And most importantly it adds the button that I use most of the time: **View all Properties** {{< fancybox "/wp-content/uploads/" "SearchQueryTool_ViewAllProperties.png" "" "single_image" >}}
                            
                            {{< fancybox "/wp-content/uploads/" "SearchQueryTool_ViewallProperties2.png" "" "single_image" >}}
                            
                            The dialog shows all Managed Properties of the selected it. For that it needs the Property Workid, so make sure its in the Select Properties field (otherwise the tool will yell at you!).
  
                            There are differences for SharePoint Online - maybe they will patch it so on-prem faces the same challenge. But once again Mikael Svenson has [a solution for that][1].</li> </ol> </li> </ol> 
                            
                            ## Final words
                            
                            Quite a lot of features for a FREE tool - but for Search challenges it's really essential. Did I notice it has a <a href="http://techmikael.blogspot.de/2013/10/adding-freshness-boost-to-sharepoint.html" target="_blank">freshness boost generator</a>? Or did I mention that it supports the <a title="Office Graph Language / GQL" href="http://msdn.microsoft.com/en-us/office/office365/howto/query-Office-graph-using-gql-with-search-rest-api" target="_blank">Office Graph Language</a> (GQL), too?
                            
                            Can you solve all problems with it? I hope so - if not, please drop me a comment or directly on the <a title="Search Query Tool discussions" href="https://sp2013searchtool.codeplex.com/discussions" target="_blank">discussion page.</a>

 [1]: http://techmikael.blogspot.de/2014/03/debugging-managed-properties-using.html "Debugging Managed Properties"

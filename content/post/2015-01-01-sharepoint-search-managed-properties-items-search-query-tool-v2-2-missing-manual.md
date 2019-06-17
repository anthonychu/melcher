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

<div id="attachment_1780" style="width: 1034px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/SearchQueryTool1.png"><img data-attachment-id="1780" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytool-2/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryTool1.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool 2.2" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryTool1-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryTool1-1024x763.png" class="wp-image-1780 size-large" src="http://melcher.it/wp-content/uploads/SearchQueryTool1-1024x763.png" alt="Search Query Tool 2.2" width="1024" height="763" srcset="https://melcher.it/wp-content/uploads/SearchQueryTool1-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryTool1-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryTool1-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryTool1-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryTool1.png 1100w" sizes="(max-width: 1024px) 100vw, 1024px" /></a>
  
  <p class="wp-caption-text">
    Search Query Tool 2.2
  </p>
</div>

  1. REST URL with all selected parameters - awesome to create JavaScript apps or apps outside of SharePoint
  2. Query Options - so many and really interesting options. You don't want Phonetic Queries? There are plenty of different options here, almost all have a descriptive tooltip. Some of the fields have a tiny box right to a textbox, click on it for some useful default values. Quite handy if you don't know how to put values in.
  3. Result Tabs - you get all the results here: 
      1. Status: How many results (with and without duplicates) where delivered in what time.
      2. Raw: Unformatted JSON results (ugly, most of the time I skip that tab) - response headers are sometimes interesting in the case of an error.
      3. Primary Results: 99% of the time I am in this tab. 
        <div id="attachment_1784" style="width: 310px" class="wp-caption aligncenter">
          <a href="http://melcher.it/wp-content/uploads/SearchQueryToolPrimary.png"><img data-attachment-id="1784" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytoolprimary/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryToolPrimary.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="SearchQueryToolPrimary" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-1024x763.png" class="size-medium wp-image-1784" src="http://melcher.it/wp-content/uploads/SearchQueryToolPrimary-300x224.png" alt="Primary Results - shows the standard and selected properties" width="300" height="224" srcset="https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryToolPrimary-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryToolPrimary.png 1100w" sizes="(max-width: 300px) 100vw, 300px" /></a>
          
          <p class="wp-caption-text">
            Primary Results - shows the default or the Select Properties
          </p>
        </div></li> 
        
          * Refinement Results: What refiners do you get with the current query. You have to use the Refiners box in the Query Options (2) to see some results. 
            <div id="attachment_1783" style="width: 310px" class="wp-caption aligncenter">
              <a href="http://melcher.it/wp-content/uploads/SearchQueryToolRefiners.png"><img data-attachment-id="1783" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytoolrefiners/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryToolRefiners.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool Refiners" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-1024x763.png" class="size-medium wp-image-1783" src="http://melcher.it/wp-content/uploads/SearchQueryToolRefiners-300x224.png" alt="What refiners would you get for the current query?" width="300" height="224" srcset="https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryToolRefiners-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryToolRefiners.png 1100w" sizes="(max-width: 300px) 100vw, 300px" /></a>
              
              <p class="wp-caption-text">
                What refiners would you get for the current query?
              </p>
            </div></li> 
            
              * Secondary Results: Skipping that most of the times, kinda useless IMHO.
              * Suggestion Results: You have to use a suggestion query for that. <div id="attachment_1782" style="width: 310px" class="wp-caption aligncenter">
                  <a href="http://melcher.it/wp-content/uploads/SearchQueryTool_suggestion.png"><img data-attachment-id="1782" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytool_suggestion/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool Suggestions" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-1024x763.png" class="size-medium wp-image-1782" src="http://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-300x224.png" alt="Share suggests SharePoint" width="300" height="224" srcset="https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryTool_suggestion.png 1100w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                  
                  <p class="wp-caption-text">
                    Share suggests SharePoint
                  </p>
                </div>
                
                &nbsp;</li> 
                
                  * Debug - I cover that in a future blog post.</ol> </li> 
                
                  * All connection options. Very useful to test search with different accounts. You can save the connection information via the menu File >> Save Connection Properties.
                  * The advanced options. I always enable the experimental features! 
                      1. They enable a preview in the tool for supported files (office and web pages) 
                        <div id="attachment_1785" style="width: 310px" class="wp-caption aligncenter">
                          <a href="http://melcher.it/wp-content/uploads/SearchQueryTool_Preview.png"><img data-attachment-id="1785" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytool_preview/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryTool_Preview.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool Preview" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-1024x763.png" class="size-medium wp-image-1785" src="http://melcher.it/wp-content/uploads/SearchQueryTool_Preview-300x224.png" alt="Preview for supported files (OWA is a requirement)" width="300" height="224" srcset="https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryTool_Preview-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryTool_Preview.png 1100w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                          
                          <p class="wp-caption-text">
                            Preview for supported files (OWA is a requirement)
                          </p>
                        </div></li> 
                        
                          * And most importantly it adds the button that I use most of the time: **View all Properties** <div id="attachment_1786" style="width: 310px" class="wp-caption aligncenter">
                              <a href="http://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties.png"><img data-attachment-id="1786" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytool_viewallproperties/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties.png" data-orig-size="1100,820" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool View All Properties" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-300x224.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-1024x763.png" class="size-medium wp-image-1786" src="http://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-300x224.png" alt="The &quot;magic&quot; view all properties link" width="300" height="224" srcset="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-300x224.png 300w, https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-1024x763.png 1024w, https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-930x693.png 930w, https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties-765x570.png 765w, https://melcher.it/wp-content/uploads/SearchQueryTool_ViewAllProperties.png 1100w" sizes="(max-width: 300px) 100vw, 300px" /></a>
                              
                              <p class="wp-caption-text">
                                The "magic" view all properties link
                              </p>
                            </div>
                            
                            <div id="attachment_1787" style="width: 291px" class="wp-caption aligncenter">
                              <a href="http://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2.png"><img data-attachment-id="1787" data-permalink="https://melcher.it/2015/01/sharepoint-search-managed-properties-items-search-query-tool-v2-2-missing-manual/searchquerytool_viewallproperties2/" data-orig-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2.png" data-orig-size="730,780" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Query Tool View All Properties Dialog" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2-281x300.png" data-large-file="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2.png" class="size-medium wp-image-1787" src="http://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2-281x300.png" alt="The dialog showing all available properties" width="281" height="300" srcset="https://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2-281x300.png 281w, https://melcher.it/wp-content/uploads/SearchQueryTool_ViewallProperties2.png 730w" sizes="(max-width: 281px) 100vw, 281px" /></a>
                              
                              <p class="wp-caption-text">
                                The dialog showing all available properties
                              </p>
                            </div>
                            
                            The dialog shows all Managed Properties of the selected it. For that it needs the Property Workid, so make sure its in the Select Properties field (otherwise the tool will yell at you!).
  
                            There are differences for SharePoint Online - maybe they will patch it so on-prem faces the same challenge. But once again Mikael Svenson has [a solution for that][1].</li> </ol> </li> </ol> 
                            
                            ## Final words
                            
                            Quite a lot of features for a FREE tool - but for Search challenges it's really essential. Did I notice it has a <a href="http://techmikael.blogspot.de/2013/10/adding-freshness-boost-to-sharepoint.html" target="_blank">freshness boost generator</a>? Or did I mention that it supports the <a title="Office Graph Language / GQL" href="http://msdn.microsoft.com/en-us/office/office365/howto/query-Office-graph-using-gql-with-search-rest-api" target="_blank">Office Graph Language</a> (GQL), too?
                            
                            Can you solve all problems with it? I hope so - if not, please drop me a comment or directly on the <a title="Search Query Tool discussions" href="https://sp2013searchtool.codeplex.com/discussions" target="_blank">discussion page.</a>

 [1]: http://techmikael.blogspot.de/2014/03/debugging-managed-properties-using.html "Debugging Managed Properties"

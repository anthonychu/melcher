---
title: 'SharePoint 2013: Federated Search Deep Dive – Twitter'
author: Max Melcher
aliases:
   - "/post/2012-11-27-sharepoint-2013-federated-search-deep-dive-twitter/"
2012: "11"
type: post
date: 2012-11-27T12:46:08+00:00
url: /2012/11/sharepoint-2013-federated-search-deep-dive-twitter/
yourls_shorturl:
  - http://melcher.it/s/e
categories:
  - Customization
  - Deep Dive
  - ITPro
  - Search
  - SharePoint 2013

---
SharePoint Search Federation is a really underrated feature if you ask me. You can greatly improve your company’s knowledge management and create a single point of entry to all kind of data. Federation comes into play when you can not crawl the data source (too big or too complex).

With SharePoint 2013 and the very cool query templates you have literally thousand of options (to be honest you had them before but with XSLT its not that much fun) to enhance your search results.

## 

## Real Time Twitter Search

Lets do a quick example – how about adding Twitter to your search results and style it a bit?

First off, go to Central Admin and click on your with [PowerShell provisioned Search Service Application][1]. On the left menu you can see an entry “Result Sources” with 16 default sources defined by SharePoint, compared to SharePoint 2010 that is **4 times more**! Most of the SharePoint sources can not be edited but they give you a clue what the intention of this is.

## 

## Step 1: Create the federation

If you want to create a search federation you simply need the OpenSearch link. For the twitter example its [http://search.twitter.com/search.atom?q={searchTerms}][2].

_Friendly reminder: Your server needs connection to the internet, at least to that site in order to work…_ 

## Step 2: Upload a new page layout

When you edit a search page you might notice that there are only two page layouts available, either you go for two columns and that is not that optimal for “side queries”. Or you change it to Web Part page and have the quick launch on the left side. Best chance to try the new design manager and create a 3 column page layout – too many steps for this article, that’s why you can download my hacked version here. Just drop the file [SearchWithFederated][3] (right click and save as!) to [\\**sharepoint2013**\_catalogs\masterpage\][4] (replace **sharepoint2013** with the hostname of your server or drop the file to the 15’ folder) – SharePoint 2013 will handle all the rest <— SO COOL!!!

After uploading the page layout, go to site settings of the search center and click on “Page Layouts and Site Templates” and add “SearchWithFederated” to the allowed page layouts:

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="SharePoint 2013 - allowed page layouts" src="http://melcher.it/wp-content/uploads/sp2013_pagelayouts_thumb.png" alt="SharePoint 2013 - allowed page layouts" width="244" height="60" border="0" />][5]

Then create a page and e.g. call it social.aspx with the new page layout “SearchWithFederated”. The page should look like this now (except that you don’t have the cool logo!):

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="SharePoint 2013 - 3 colum page layout" src="http://melcher.it/wp-content/uploads/sp2013_3columpagelayout_thumb.png" alt="SharePoint 2013 - 3 colum page layout" width="244" height="169" border="0" />][6]

## 

## Step 3: Add an additional search Web Part to the new zone

In SharePoint 2010 there was a “federated search Web Part” – its gone, you don’t need it anymore. You could do cool stuff with it, at Alegri we have a federation to Microsoft Dynamic where the employees skills and certificates and stuff are managed, on the screenshot you can see it on the right:

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="Federated search in SharePoint 2010" src="http://melcher.it/wp-content/uploads/federatedsearch_sp2010_thumb.png" alt="Federated search in SharePoint 2010" width="244" height="171" border="0" />][7]

With SharePoint 2013 they built a lot of new search Web Parts and broke with a lot of old stuff – shiny new world! Okay back to the example, just add:

  1. Refiner Web Part to zone 1
  2. Search result Web Part to zone 2
  3. Search navigation Web Part to zone 2
  4. Search box Web Part to zone 2
  5. Search result Web Part to zone 3

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border-width: 0px;" title="SP2013 Federated Search Column" src="http://melcher.it/wp-content/uploads/sp2013_federatedsearch1_thumb.png" alt="SP2013 Federated Search Column" width="244" height="195" border="0" />][8]

## Step 4: Configure everything

Okay, lets start with the search box, that took me a while to notice that you change the connection here:

  1. Send Queries to Web Parts 
      * Search results \[1\] (check)
      * Search results \[2\] (check)

Now edit Search Results [2]:

  1. Click on change query (cool new wizard, love it!) 
      * Basics 
          * Select a query: Twitter
          * Number of results per page: 5
          * Show advanced link: (uncheck)
          * Show result count: (uncheck)
          * Show paging: (uncheck)
          * Show preferences link: (uncheck)
      * Settings 
          * Loading Behavior: Async option (this loads the results after the main results in zone 2 appears and doesn’t wait on the twitter search service)

## Step 5: First results

ooookay… very cool stuff:

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="sp2013_federatedsearch2" src="http://melcher.it/wp-content/uploads/sp2013_federatedsearch2_thumb.png" alt="sp2013_federatedsearch2" width="244" height="153" border="0" />][9]

You can click on the results and get redirected to twitter.

## Step 6: Adjust the Display Template

So what's next, we got it working right? Yepp, but how about the author and the date of the tweet? Let’s tackle this with the awesome new display templates – too many steps and it took me a while to figure it out (author is in the xml), just download the file [Item_twitter][10] (right click and save as!) and upload it to [\\**sharepoint13**\_catalogs\masterpage\Display][11] Templates\Search (again, replace the hostname)

One thing that really helped me creating the display template was the super debugger in chrome. Just add “debugger;” in the JavaScript part of the template, hit F12 in Chrome to open up the Developer Tools – and you can debug the display template and context object (just hover over it or use the console) – SWEET!

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="sp2013_DisplayTemplate_debugger" src="http://melcher.it/wp-content/uploads/sp2013_DisplayTemplate_debugger_thumb.png" alt="sp2013_DisplayTemplate_debugger" width="244" height="48" border="0" />][12]

After uploading the display template, edit the page and set the Item Display Template to “Twitter”. The setting is in the Display Template section of the result Web Part.

## Final result

And here comes the very last screenshot of this very long blog post – my longest so far!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="sp2013_federatedsearch_final" src="http://melcher.it/wp-content/uploads/sp2013_federatedsearch_final_thumb.png" alt="sp2013_federatedsearch_final" width="244" height="160" border="0" />][13]

## Feedback?

Much appreciated in the comments!

 [1]: http://melcher.it/2012/07/sharepoint-2013-create-a-search-service-application-and-topology-with-powershell/
 [2]: http://search.twitter.com/search.atom?q={searchTerms "http://search.twitter.com/search.atom?q={searchTerms}"
 [3]: http://melcher.it/wp-content/uploads/SearchWithFederated.html
 [4]: file://\\sharepoint2013\_catalogs\masterpage\" data-mce-href=
 [5]: http://melcher.it/wp-content/uploads/sp2013_pagelayouts.png
 [6]: http://melcher.it/wp-content/uploads/sp2013_3columpagelayout.png
 [7]: http://melcher.it/wp-content/uploads/federatedsearch_sp2010.png
 [8]: http://melcher.it/wp-content/uploads/sp2013_federatedsearch1.png
 [9]: http://melcher.it/wp-content/uploads/sp2013_federatedsearch2.png
 [10]: http://melcher.it/wp-content/uploads/Item_twitter.html
 [11]: file://\\sharepoint13\_catalogs\masterpage\Display
 [12]: http://melcher.it/wp-content/uploads/sp2013_DisplayTemplate_debugger.png
 [13]: http://melcher.it/wp-content/uploads/sp2013_federatedsearch_final.png

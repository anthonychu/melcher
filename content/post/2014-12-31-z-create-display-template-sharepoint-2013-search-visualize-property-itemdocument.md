---
title: 'A to Z: Create a Display Template for SharePoint 2013 Search to visualize a property of an item/document'
author: Max Melcher
aliases:
   - "/post/2014-12-31-z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/"
2014: "12"
type: post
date: 2014-12-31T00:03:44+00:00
url: /2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/
yourls_shorturl:
  - http://melcher.it/s/3O
categories:
  - Customization
  - Search
  - SharePoint 2013

---
**This is an english translation of my article for SharePoint Advent "<a href="http://melcher.it/s/3w" target="_blank">VON A BIS Z: ERSTELLUNG EINES DISPLAY TEMPLATES FÜR DIE SHAREPOINT SUCHE UM DIE EIGENSCHAFTEN EINES DOKUMENTS SICHTBAR ZU MACHEN</a>".**

Display Templates can be used in Web Parts to individualize search results (see also <a title="Introduction to Display Templates on MSDN" href="http://msdn.microsoft.com/en-us/library/office/jj945138%28v=office.15%29.aspx#bk_introduction" target="_blank">Introduction to Display Templates on MSDN</a>).

In this article I will show you how a Display Template for SharePoint 2013 Search is structured, why you need them and how to customize/extend them.

## Why YOU need Display Templates?

Not every search hit is equal - even a small icon helps the user to identify content more quickly than if only a monotonous mass of blue links is represented. And now that more and more content is stored in SharePoint, this is even more relevant. And integration solutions that can display many content of external system can be realized, too.

The rapid acquisition of information also plays a major role in user acceptance - if it additionally looks good and the system helps me to recognize information faster - well, search can rock - I use it daily in our own Intranet! In addition, the important content should be categorized and tagged in SharePoint - such additional work should also be visible in search results, so that the effort is also worth even more.

## How is a Display Template structured?

Each display template consists of two files: a HTML version of the Display Template that you can edit in a HTML editor, and a JS file that SharePoint uses (dont touch that one!). The HTML file is structured always with the same pattern, in it is defined what property/metadata of the search hit will be shown. The HTML file can also contain JavaScript to dynamically display content or even implement business logic.

The following screenshot shows a typical SharePoint 2013 Search Center, with the 3 components that can be easily adapted: Item Display Template, Item Hover display template and the action bar.

<div id="attachment_1767" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A1.png"><img data-attachment-id="1767" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a1/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A1.png" data-orig-size="1459,716" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Search Result for PowerPoint hit" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A1-300x147.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A1-1024x503.png" class="size-medium wp-image-1767" src="http://melcher.it/wp-content/uploads/MEL-A1-300x147.png" alt="Search Result for PowerPoint hit" width="300" height="147" srcset="https://melcher.it/wp-content/uploads/MEL-A1-300x147.png 300w, https://melcher.it/wp-content/uploads/MEL-A1-1024x503.png 1024w, https://melcher.it/wp-content/uploads/MEL-A1-930x456.png 930w, https://melcher.it/wp-content/uploads/MEL-A1-765x375.png 765w, https://melcher.it/wp-content/uploads/MEL-A1.png 1459w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Search Result for PowerPoint hit
  </p>
</div>

(1) Item Display Template for a PowerPoint hit
  
(2) The corresponding Hover Template for PowerPoint
  
(3) Search Actions that can be directly started from within the search result

## How can you change a Display Template?

In the following 5 steps I will show you how to customize the Display Template for PowerPoint so that an additional document property is displayed.

### Step 1: Prepare List or Library

To view an additional document property, it must be available on at least one document / list item. For this simple example, I created a text column "technologie" and filled it with values:

<div id="attachment_1759" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A2.png"><img data-attachment-id="1759" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a2/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A2.png" data-orig-size="792,473" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Create a column and add at least one value!" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A2-300x179.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A2.png" class="size-medium wp-image-1759" src="http://melcher.it/wp-content/uploads/MEL-A2-300x179.png" alt="Create a column and add at least one value!" width="300" height="179" srcset="https://melcher.it/wp-content/uploads/MEL-A2-300x179.png 300w, https://melcher.it/wp-content/uploads/MEL-A2-765x457.png 765w, https://melcher.it/wp-content/uploads/MEL-A2.png 792w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Create a column and add at least one value!
  </p>
</div>

&nbsp;

> Creation of the column is not enough, it must also be filled with at least one value

### Step 2: Creating a Managed Property and full crawl

How can this additional value be used in SharePoint Search now? Automatically? Nope, unless its a site colum that you added to the list (see <a href="http://melcher.it/s/3N" target="_blank">here</a>). Otherwise a so-called Managed Property  must be created now. To do this, go to Site Collection Administration - in SharePoint 2010 you had to go to Central Admin and had to be a farm administrator so this is a big step forward - and there then click on Search Schema. In the tab Managed Properties create a new property:

<div id="attachment_1760" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A3.png"><img data-attachment-id="1760" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a3/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A3.png" data-orig-size="1007,315" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Create a Managed Property" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A3-300x94.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A3.png" class="size-medium wp-image-1760" src="http://melcher.it/wp-content/uploads/MEL-A3-300x94.png" alt="Create a Managed Property" width="300" height="94" srcset="https://melcher.it/wp-content/uploads/MEL-A3-300x94.png 300w, https://melcher.it/wp-content/uploads/MEL-A3-930x291.png 930w, https://melcher.it/wp-content/uploads/MEL-A3-765x239.png 765w, https://melcher.it/wp-content/uploads/MEL-A3.png 1007w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Create a Managed Property
  </p>
</div>

In the dialog create a property with a name, here its "Technologie". Select retrievable and add at the very end of the page a mapping. The crawled property is called ows_technologie, just add it to the mapping:

<div id="attachment_1761" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A4.png"><img data-attachment-id="1761" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a4/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A4.png" data-orig-size="637,586" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="MEL-A4" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A4-300x276.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A4.png" class="wp-image-1761 size-medium" src="http://melcher.it/wp-content/uploads/MEL-A4-300x276.png" alt="" width="300" height="276" srcset="https://melcher.it/wp-content/uploads/MEL-A4-300x276.png 300w, https://melcher.it/wp-content/uploads/MEL-A4.png 637w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Search for the new column name
  </p>
</div>

&nbsp;

> The name of the crawled property for SharePoint content is always prefixed with "ows_"

If no value is displayed, the SharePoint search has not found the new column during a crawl. If you want to speed things up (its not like you have lots of choices here), go to Central Administration and start the crawl there. Once the crawled property is displayed, add it, and save the Managed Property with OK. After this the summary page for technology should look like this:

<div id="attachment_1762" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A5.png"><img data-attachment-id="1762" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a5/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A5.png" data-orig-size="1038,271" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="MEL-A5" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A5-300x78.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A5-1024x267.png" class="wp-image-1762 size-medium" src="http://melcher.it/wp-content/uploads/MEL-A5-300x78.png" alt="" width="300" height="78" srcset="https://melcher.it/wp-content/uploads/MEL-A5-300x78.png 300w, https://melcher.it/wp-content/uploads/MEL-A5-1024x267.png 1024w, https://melcher.it/wp-content/uploads/MEL-A5-930x243.png 930w, https://melcher.it/wp-content/uploads/MEL-A5-765x200.png 765w, https://melcher.it/wp-content/uploads/MEL-A5.png 1038w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Summary page for the new managed property
  </p>
</div>

&nbsp;

The Managed Property will be filled during the next full crawl - if you do not wanna wait, run a full crawl (again) in Central Administration.

### Step 3: Customized the Display Template

Now to the actual customization of the Display Templates - the technology property is not automatically displayed. To modify a Display Template, download the display template from Master Page Gallery. For this change to the Site Collection Settings, open Master Page Gallery and then change to the folder "Display Templates" and then "Search". This folder contains all display templates that can be used for the SharePoint search - as already described, an HTML file for editing and a JavaScript file that SharePoint generates every time the html file changes. For this example we will download the PowerPoint design template (item_PowerPoint.html) and open it with a text editor (eg. Notepad++). The content is a mixture of normal HTML format and Javascript - plus a placeholder language that can be used to display values from the search index.

In our case, just a few modifications are necessary. First adjust the title in the _title_ tag so that we will find the display template later: SPAdvent PowerPoint item.
  
Then add to the html tag _mso:ManagedPropertyMapping_: ,’Technologie':’Technologie’ - the coma at the beginning should not be missed. With this we tell SharePoint search that we need for this template display the value of technology and this is to be loaded with the search results.

As last step create a new line after line 38 and insert the following text:

<div style="display: inline-block;">
  Technologie: _#=ctx.CurrentItem.Technologie=#_
</div>

The file should look like this now:

<div id="attachment_1763" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A6.png"><img data-attachment-id="1763" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a6/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A6.png" data-orig-size="1032,122" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Modifications of the Display Template" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A6-300x35.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A6-1024x121.png" class="size-medium wp-image-1763" src="http://melcher.it/wp-content/uploads/MEL-A6-300x35.png" alt="Modifications of the Display Template" width="300" height="35" srcset="https://melcher.it/wp-content/uploads/MEL-A6-300x35.png 300w, https://melcher.it/wp-content/uploads/MEL-A6-1024x121.png 1024w, https://melcher.it/wp-content/uploads/MEL-A6-930x110.png 930w, https://melcher.it/wp-content/uploads/MEL-A6-765x90.png 765w, https://melcher.it/wp-content/uploads/MEL-A6.png 1032w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Modifications of the Display Template
  </p>
</div>

With this new HTML tag, a new row is displayed in the display template - the **ctx.CurrentItem.Technologie** will be replaced with the value from the search index, in this example our technology value.

Now save the file under a new name (don't modify the existing ones!) and upload it back to the design templates library - in the same folder from which we have downloaded it. Simply close the dialog with OK after uploading.

### Step 4: Creating the Result Type

In order to tell SharePoint search that it should use our new Display Template for PowerPoint now, we need a new search result type. Go to the site settings and there to search result types. There we add a new one with the name SPAdvent PPT. The only condition we add is that we restrict it to type Microsoft PowerPoint. Finally, we choose the action - the result shall be represented by the SPAdvent PowerPoint display template:

<div id="attachment_1764" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A7.png"><img data-attachment-id="1764" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a7/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A7.png" data-orig-size="1018,420" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="New Result Type for PowerPoint hits" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A7-300x124.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A7.png" class="size-medium wp-image-1764" src="http://melcher.it/wp-content/uploads/MEL-A7-300x124.png" alt="New Result Type for PowerPoint hits" width="300" height="124" srcset="https://melcher.it/wp-content/uploads/MEL-A7-300x124.png 300w, https://melcher.it/wp-content/uploads/MEL-A7-930x384.png 930w, https://melcher.it/wp-content/uploads/MEL-A7-765x316.png 765w, https://melcher.it/wp-content/uploads/MEL-A7.png 1018w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    New Result Type for PowerPoint hits
  </p>
</div>

Save it and then the search results type should look like this:

<div id="attachment_1765" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/MEL-A8.png"><img data-attachment-id="1765" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/mel-a8/" data-orig-file="https://melcher.it/wp-content/uploads/MEL-A8.png" data-orig-size="1207,115" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="The summary page for the new result type" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/MEL-A8-300x29.png" data-large-file="https://melcher.it/wp-content/uploads/MEL-A8-1024x98.png" class="size-medium wp-image-1765" src="http://melcher.it/wp-content/uploads/MEL-A8-300x29.png" alt="The summary page for the new result type" width="300" height="29" srcset="https://melcher.it/wp-content/uploads/MEL-A8-300x29.png 300w, https://melcher.it/wp-content/uploads/MEL-A8-1024x98.png 1024w, https://melcher.it/wp-content/uploads/MEL-A8-930x89.png 930w, https://melcher.it/wp-content/uploads/MEL-A8-765x73.png 765w, https://melcher.it/wp-content/uploads/MEL-A8.png 1207w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    The summary page for the new result type
  </p>
</div>

### Step 5: Look at the result

So that's it - the new Display Template is ready and will be used on the search page:

<div id="attachment_1757" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen.png"><img data-attachment-id="1757" data-permalink="https://melcher.it/2014/12/z-create-display-template-sharepoint-2013-search-visualize-property-itemdocument/2014-12-31-00_21_20-search_-potentiale-nutzen/" data-orig-file="https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen.png" data-orig-size="1119,653" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Final result with the new technologie value" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-300x175.png" data-large-file="https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-1024x598.png" class="size-medium wp-image-1757" src="http://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-300x175.png" alt="Final result with the new technologie value" width="300" height="175" srcset="https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-300x175.png 300w, https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-1024x598.png 1024w, https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-930x543.png 930w, https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen-765x446.png 765w, https://melcher.it/wp-content/uploads/2014-12-31-00_21_20-Search_-potentiale-nutzen.png 1119w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Final result with the new technologie value
  </p>
</div>

Although there are relatively many steps, still no "real" development or any special development languages are needed. Changes can be made quickly and easily implemented.

This simple example shows how powerful display templates can be and how quickly they can bring added value to the end user.

### Further readings:

  * [Custom actions in a hover panel][1]
  * [Search Query Tool][2] (the one tool for all search queries!)
  * [Blog Series: Search Queries ][3]
  * [Collection of Display Templates][4]

 [1]: http://blogs.technet.com/b/tothesharepoint/archive/2013/09/18/how-to-add-a-custom-action-to-the-hover-panel-in-sharepoint-server-2013.aspx
 [2]: https://sp2013searchtool.codeplex.com/
 [3]: http://techmikael.blogspot.de/2014/03/sharepoint-search-queries-explained.html
 [4]: https://github.com/SPCSR/DisplayTemplates/tree/master/Search%20Display%20Templates

---
title: Cloud Hybrid Search Service – first experiences!
author: Max Melcher
aliases:
   - "/post/2015-11-25-cloud-hybrid-search-service-first-experiences/"
2015: "11"
type: post
date: 2015-11-25T12:26:29+00:00
url: /2015/11/cloud-hybrid-search-service-first-experiences/
yourls_shorturl:
  - http://melcher.it/s/6q
categories:
  - Hybrid
  - Office 365
  - Search
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013
  - SharePoint 2016

---
Currently I am preparing a session for the [next SharePoint Days "Hybrid Worlds"][1] here in Munich. My first presentation topic is "**Hybrid Search - everything you need to know!**" with focus on the new Cloud Hybrid Search Service Application and here are some of the ideas I will present.

## Hybrid Options

Currently I am aware of  6 feasible hybrid options:

### One-way Inbound Hybrid

You combine SharePoint Online with SharePoint on-premises - when a user queries in the SharePoint Online Search Center, SPO connects to SharePoint on-premises and executes the same or a similar query there to get results. Both results can then be shown in the SharePoint Search Center.

#### Challenge

The setup in this case is the most challenging here, at least from the requirements side. To establish a trust, you need to have valid public certificate and an internet connected SharePoint farm - most of my clients could not do that because of that. In order to do security trimming the user needs a cloud and on-premises identity - in other words you need to sync your Active Directory to Azure AD (e.g. with dirsync) to get results back.

#### User Experience

The user experience is a little cumbersome in my eyes, because you don't have a single, combined result set. Sorting and refining both works, but having two different rankings - or in other words: the two search systems shows the user the two best results - but there should be only one right?

<div id="attachment_2035" style="width: 228px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/hybrid_inbound.jpg"><img data-attachment-id="2035" data-permalink="https://melcher.it/2015/11/cloud-hybrid-search-service-first-experiences/hybrid_inbound/" data-orig-file="https://melcher.it/wp-content/uploads/hybrid_inbound.jpg" data-orig-size="450,620" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;1&quot;}" data-image-title="Hybrid Inbound Search" data-image-description="<p>Taken from https://technet.microsoft.com/en-us/library/dn197174.aspx</p>
" data-medium-file="https://melcher.it/wp-content/uploads/hybrid_inbound-218x300.jpg" data-large-file="https://melcher.it/wp-content/uploads/hybrid_inbound.jpg" class="wp-image-2035 size-medium" title="On-premise results are shown in a result block" src="https://melcher.it/wp-content/uploads/hybrid_inbound-218x300.jpg" alt="Hybrid Inbound Search" width="218" height="300" srcset="https://melcher.it/wp-content/uploads/hybrid_inbound-218x300.jpg 218w, https://melcher.it/wp-content/uploads/hybrid_inbound.jpg 450w" sizes="(max-width: 218px) 100vw, 218px" /></a>
  
  <p class="wp-caption-text">
    On-premises results are shown in a result block
  </p>
</div>

&nbsp;

### One-way Outbound Hybrid

That is the inverse setup of the inbound hybrid. Here the search center is on-premises and the search query will be additionally sent to SharePoint Online.

#### Challenge

The setup is almost the same as with the inbound hybrid - but you don't need a reverse connection from SharePoint Online back to SharePoint On-Premises because each request is coming from SharePoint On-Premises.

#### User Experience

<div id="attachment_2036" style="width: 226px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/hybrid_outbound.jpg"><img data-attachment-id="2036" data-permalink="https://melcher.it/2015/11/cloud-hybrid-search-service-first-experiences/hybrid_outbound/" data-orig-file="https://melcher.it/wp-content/uploads/hybrid_outbound.jpg" data-orig-size="448,621" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="hybrid outbound" data-image-description="<p>taken from https://technet.microsoft.com/EN-US/library/dn197173.aspx</p>
" data-medium-file="https://melcher.it/wp-content/uploads/hybrid_outbound-216x300.jpg" data-large-file="https://melcher.it/wp-content/uploads/hybrid_outbound.jpg" class="wp-image-2036 size-medium" title="Remote results are shown in a result block" src="https://melcher.it/wp-content/uploads/hybrid_outbound-216x300.jpg" alt="hybrid outbound" width="216" height="300" srcset="https://melcher.it/wp-content/uploads/hybrid_outbound-216x300.jpg 216w, https://melcher.it/wp-content/uploads/hybrid_outbound.jpg 448w" sizes="(max-width: 216px) 100vw, 216px" /></a>
  
  <p class="wp-caption-text">
    Remote results are shown in a result block
  </p>
</div>

As already mentioned, this is the inverse setup, so everything from inbound hybrid applies here too.

### Two-Way (inbound+outbound) Hybrid

You cant decide where to put your Search Center? Well then you should configure inbound and outbound hybrid search - so both Search Centers can show the results from both on-premises and SharePoint online.

#### Challenge

The challenge here is the setup efforts - but there are pretty good PowerShell scripts out there, please see the good reads section down below.

#### User Experience

The experience is the same as for inbound or outbound depending in what Search Center you are in.

### Cloud Hybrid Search Service Application

Starting September 7th there is a new preview option available for hybrid search - the Cloud Hybrid Search Service Application - and that is my option a really big driver for hybrid scenarios! Once you configured the setup, basically you establish trust and configure a PushTenantManager you can delete your on-premises search index. Once you crawl, everything will be processed and sent to the cloud index and SharePoint Online takes care of the rest.

In the following screenshot you can see my on-premises Cloud Search Service Application up and running - from a UI perspective there is no directly visible indication that this is a cloud hybrid search service - except the name that I provided of course.

<div id="attachment_2037" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication.png"><img data-attachment-id="2037" data-permalink="https://melcher.it/2015/11/cloud-hybrid-search-service-first-experiences/cloudhybridsearchserviceapplication/" data-orig-file="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication.png" data-orig-size="1342,917" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Cloud Hybrid Search Service Application" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-300x205.png" data-large-file="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-1024x700.png" class="wp-image-2037 size-medium" title="Searchable items: 0 - No local index, no count." src="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-300x205.png" alt="Searchable items: 0 " width="300" height="205" srcset="https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-300x205.png 300w, https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-1024x700.png 1024w, https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-930x635.png 930w, https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication-765x523.png 765w, https://melcher.it/wp-content/uploads/CloudHybridSearchSErviceApplication.png 1342w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    Searchable items: 0 - No local index, no count.
  </p>
</div>

What I really like here is the option to connect on-premises Content with SharePoint Online - you can even index **SharePoint 2007** or **SharePoint 2010** and bring it to your users. **Fileshares** - yes, that works too. Or imagine you have multiple farms in multiple countries - maybe even with weak network connections between them. Ever tried to remotely crawl a farm from Europe to Asia? Not the best experience, I can tell! But with the new cloud hybrid search service you can **combine the index in the cloud** - and get rid of some on-premises servers (less SharePoint Server licenses, less patching & maintenance, less hardware). Of course you need SharePoint Online licenses for your users tho - my went for E1 to get going.

#### Challenge

To set everything up, you need SharePoint 2013 with at least August 2015 Cumulative Update or SharePoint 2016. Then its basically the same step as configuring outbound hybrid, you setup the trust between on-premises SharePoint and SharePoint Online - and connect the PushTenantManager. Sounds complicated, but there is a <a href="https://connect.microsoft.com/office/Downloads/DownloadDetails.aspx?DownloadID=58777" target="_blank">Configure Hybrid Cloud Search Service Application</a> that covers all that - the documentation is really good, best I have seen so far for a Preview.

> Currently it's not recommended to configure it on a production environment - on my DEV box it worked on the first try.

As of now there are some limitations for the new cloud hybrid search service, the following is not supported:

  1. Entity Extraction does not work
  2. No Content Enrichment / External Web Callout
  3. Index more than 2 million items - you might get throttled or blocked. That will change once the cloud search service is out of preview.
  4. Index at a high right - you might get throttled.
  5. Custom Security Trimming
  6. Remove search results by url

If you don't use those features yet and not legally bound to stick on-premises it might be an option for you.

#### User Experience

The user experience is by far the best for this setup. The key point for me is that the user most of the time do not care if this content is from on-premises or SharePoint Online (or hidden in whatever information silo) - most of the times they even do not know it. Most importantly they get the most relevant result from all the available systems presented in the nice and customizable Search Center:

<div id="attachment_2039" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/Hybrid_SPO.png"><img data-attachment-id="2039" data-permalink="https://melcher.it/2015/11/cloud-hybrid-search-service-first-experiences/hybrid_spo/" data-orig-file="https://melcher.it/wp-content/uploads/Hybrid_SPO.png" data-orig-size="958,870" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Hybrid Results in SharePoint Online" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Hybrid_SPO-300x272.png" data-large-file="https://melcher.it/wp-content/uploads/Hybrid_SPO.png" class="wp-image-2039 size-medium" title="The results come from three different systems: SharePoint Online, SharePoint 2013 on-premises and a fileshare" src="https://melcher.it/wp-content/uploads/Hybrid_SPO-300x272.png" alt="" width="300" height="272" srcset="https://melcher.it/wp-content/uploads/Hybrid_SPO-300x272.png 300w, https://melcher.it/wp-content/uploads/Hybrid_SPO-930x845.png 930w, https://melcher.it/wp-content/uploads/Hybrid_SPO-765x695.png 765w, https://melcher.it/wp-content/uploads/Hybrid_SPO.png 958w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    The results come from three different systems: SharePoint Online, SharePoint 2013 on-premises and a file share
  </p>
</div>

No UI clutter with a single result block - perfect for many many users. I like it, too.

If you want to give the user the option to show only on-premises content you could easily add a new search vertical and bind a result source to it. The query for that source is IsExternalContent:1 to show SharePoint Online external results.

Another good thing here is that the **search results appear very fast once** they are index on-premises. For me it was instant, I was really surprised here.

#### Delve and the Office Graph

Currently the results are not visualized in Delve as content cards - but that will hopefully change in the near future. For me that really increases the value of Delve because currently our own intranet is on-premises and hidden from Delve. The more data the search engine gets, the better Delve gets, right?

### Cloud Hybrid Search Service Application + One-way outbound Hybrid

At first I thought about labeling this option as "the perfect migration hybrid" - but perfect really depends on your requirements, right?

So as a benefit of establishing the trust between SharePoint Online and SharePoint on-premises during the setup of the cloud hybrid search service application you additionally set for outbound hybrid search. In other words: You can change the result source to SharePoint Online results and you will additionally get the cloud results on-premise, too. You have OneDrive for Business content in the cloud? You want the results searchable on premises? With that you can migrate and test the new cloud index - does it meet your requirements? - before shutting down your on-premises infrastructure without affecting the users. That is a nice quick win in my eyes here. I think we will try that very soon with our own intranet, once its production-ready.

### The On-Premises Hybrid

Last but not least and for the sake of completeness - there are 3rd party connectors available to crawl SharePoint Online and make the results available on-premises.

## Benefits of all this

The hybrid options give you a great opportunity to solve search challenges - from information silos, license costs to network latency. To get away from all technical stuff - the important point is that its easy for the end-user to find the relevant information, no matter where it's stored. It must be simple and clutter-less, provide you with the latest and best results. Hybrid could be a great step forward.

## Read more

You read so far and wand more? The following links helped me get started!

  1. <a href="http://melcher.it/s/6i" target="_blank">Why Hybrid Crawl in SharePoint is a cold hot potato</a> (Mikael Svenson´s view regarding hybrid crawling)
  2. <a href="http://melcher.it/s/6n" target="_blank">The Five C’s of Enterprise Search</a> (Agnes Molnar about Enterprise Search challenges, some points can be solved with a hybrid setup)
  3. <a href="http://melcher.it/s/6o" target="_blank">Configure the hybrid infrastructure </a>(Technet starting point for inbound and outbound)
  4. <a href="http://melcher.it/s/6l" target="_blank">The all new Cloud Search service application coming to SharePoint 2013 and SharePoint 2016</a> (Ignite Introduction with video about the hybrid cloud search service application)
  5. <a href="http://melcher.it/s/6p" target="_blank">Office 365: SharePoint Hybrid Configuration Wizard - SharePoint Escalation Services Team Blog</a> (You want a wizard to configure hybrid? Good stuff!)
  6. <a href="http://melcher.it/s/5J" target="_blank">Cloud Hybrid Search Service Application - SharePoint Escalation Services Team Blog</a> (The most complete introduction I found so far, PowerShell scripts and all nicely documented - really good!)

 [1]: http://melcher.it/s/6g

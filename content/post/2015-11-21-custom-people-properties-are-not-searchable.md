---
title: Custom People Properties are not searchable
author: Max Melcher
aliases:
   - "/post/2015-11-21-custom-people-properties-are-not-searchable/"
2015: "11"
type: post
date: 2015-11-21T12:50:57+00:00
url: /2015/11/custom-people-properties-are-not-searchable/
yourls_shorturl:
  - http://melcher.it/s/6k
categories:
  - Search
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013

---
This will be just a short one - maybe it saves somebody some time and grey hairs.

## Situation

I created a new result source that boosts some properties of people profiles in search results. During staging I forgot to check the very important radio button that the result source is of type "People".

[<img data-attachment-id="2032" data-permalink="https://melcher.it/2015/11/custom-people-properties-are-not-searchable/peoplesearch_type/" data-orig-file="https://melcher.it/wp-content/uploads/PeopleSearch_Type.png" data-orig-size="736,176" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="PeopleSearch_Type" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/PeopleSearch_Type-300x72.png" data-large-file="https://melcher.it/wp-content/uploads/PeopleSearch_Type.png" class="aligncenter size-medium wp-image-2032" src="https://melcher.it/wp-content/uploads/PeopleSearch_Type-300x72.png" alt="PeopleSearch_Type" width="300" height="72" srcset="https://melcher.it/wp-content/uploads/PeopleSearch_Type-300x72.png 300w, https://melcher.it/wp-content/uploads/PeopleSearch_Type.png 736w" sizes="(max-width: 300px) 100vw, 300px" />][1]

At first I did not notice that I forgot to check it - Search worked perfectly and returned people hits. But when you search for specific people profiles like office location or custom properties like e.g. costcenter - you get zero results or at least not those you would expect.

Moral of the story: read the tiny description texts 🙂

&nbsp;

&nbsp;

&nbsp;

 [1]: https://melcher.it/wp-content/uploads/PeopleSearch_Type.png

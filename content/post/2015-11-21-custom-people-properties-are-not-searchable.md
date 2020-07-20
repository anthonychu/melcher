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

{{< fancybox "/wp-content/uploads" "PeopleSearch_Type.png" "" "single_image" >}}[1]

At first I did not notice that I forgot to check it - Search worked perfectly and returned people hits. But when you search for specific people profiles like office location or custom properties like e.g. costcenter - you get zero results or at least not those you would expect.

Moral of the story: read the tiny description texts 🙂

&nbsp;

&nbsp;

&nbsp;

 [1]: https://melcher.it/wp-content/uploads/PeopleSearch_Type.png

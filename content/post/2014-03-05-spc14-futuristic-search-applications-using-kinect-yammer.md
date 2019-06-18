---
title: 'SPC14: Futuristic Search applications using Kinect and Yammer!'
author: Max Melcher
aliases:
   - "/post/2014-03-05-spc14-futuristic-search-applications-using-kinect-yammer/"
2014: "03"
type: post
date: 2014-03-05T23:47:37+00:00
url: /2014/03/spc14-futuristic-search-applications-using-kinect-yammer/
yourls_shorturl:
  - http://melcher.it/s/2b
categories:
  - Development
  - Search
  - SharePoint 2013
  - Yammer

---
> Use your body and voice to search SharePoint and Yammer. Learn how you can utilize SharePoint 2013 Search to index your Enterprise Yammer content on-premises in addition to your regular SharePoint content, then use futuristic UI design and Natural User Interface (NUI) features of the latest Kinect SDK and Kinect Sensors for Windows to build rich NUI and voice controlled search applications. It's possible. It's cool and a little crazy - much to be learned. And not a keystroke will be wasted.

My notes for the session: “Futuristic Search applications using Kinect and Yammer!” by [Chris Givens][1] and and [Ben Lower][2] at SPC 2014 In Las Vegas.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="IMG_1859" alt="IMG_1859" src="http://melcher.it/wp-content/uploads/IMG_1859_thumb.jpg" width="244" height="184" border="0" />][3]

## Yammer Search

Yammer offers a search rest endpoint but its not used for this – you need Enterprise Yammer to export data, that’s how Chris did it.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1860" alt="IMG_1860" src="http://melcher.it/wp-content/uploads/IMG_1860_thumb.jpg" width="244" height="184" border="0" />][4]

## On-Premise Integration

To integrate the extracted data you need a BCS connector to get the data into the search index.

  1. Connector (reading the data)
  2. Result Types / Content Source (connect it to the search service application)
  3. Display Templates (make it look nice)

Dang – this demo took a while to create – and we only saw 50% so far.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1861" alt="IMG_1861" src="http://melcher.it/wp-content/uploads/IMG_1861_thumb.jpg" width="348" height="185" border="0" />][5]

## Kinect Basics

Ben explained the basics of Kinect – wow, impressive. Natural User Interface, User Engagement – its crazy what is possible with the little box. Relate this to SharePoint and you would need 7 servers <img class="wlEmoticon wlEmoticon-smile" style="border-style: none;" alt="Smiley" src="http://melcher.it/wp-content/uploads/wlEmoticon-smile3.png" />

> Kinect can detect when your cat jumps on the couch and can yell “hell no!” in the owners voice!

[SDK is available for free][6] – grab it and do amazing stuff.

Kinect can listen and speaking – and so much more. Ben showed a demo application – simply impressive.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1869" alt="IMG_1869" src="http://melcher.it/wp-content/uploads/IMG_1869_thumb.jpg" width="244" height="184" border="0" />][7][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1865" alt="IMG_1865" src="http://melcher.it/wp-content/uploads/IMG_1865_thumb.jpg" width="244" height="184" border="0" />][8][<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1866" alt="IMG_1866" src="http://melcher.it/wp-content/uploads/IMG_1866_thumb.jpg" width="244" height="184" border="0" />][9][<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1867" alt="IMG_1867" src="http://melcher.it/wp-content/uploads/IMG_1867_thumb.jpg" width="244" height="184" border="0" />][10][<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1868" alt="IMG_1868" src="http://melcher.it/wp-content/uploads/IMG_1868_thumb.jpg" width="244" height="184" border="0" />][11]

## Minority Report Demo

Creating this demo took him 5 weeks - applause for that!

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1864" alt="IMG_1864" src="http://melcher.it/wp-content/uploads/IMG_1864_thumb.jpg" width="348" height="185" border="0" />][12]

Natural language searching

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1862" alt="IMG_1862" src="http://melcher.it/wp-content/uploads/IMG_1862_thumb.jpg" width="348" height="185" border="0" />][13]

Grabbing and moving stuff with your hand

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1863" alt="IMG_1863" src="http://melcher.it/wp-content/uploads/IMG_1863_thumb.jpg" width="348" height="185" border="0" />][14]

I don’t have a good photo, but Chris said “Search Chris” and his app connected to SharePoint search and read out the yammer search results – very slick one!

## Summary

I am a search guy, so this session was a must for me: Fun, search and new technology – very good mix, I like it a lot. Especially that you connect technologies that are not related and get something out of it is really cool. Minority Report Technology for Consumers connected to SharePoint, epic.

Asking a question got me this book – thanks for that, I had a blast.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1870" alt="IMG_1870" src="http://melcher.it/wp-content/uploads/IMG_1870_thumb.jpg" width="184" height="244" border="0" />][15]

 [1]: https://twitter.com/givenscj
 [2]: https://twitter.com/benlower
 [3]: http://melcher.it/wp-content/uploads/IMG_1859.jpg
 [4]: http://melcher.it/wp-content/uploads/IMG_1860.jpg
 [5]: http://melcher.it/wp-content/uploads/IMG_1861.jpg
 [6]: http://www.microsoft.com/en-us/kinectforwindows/
 [7]: http://melcher.it/wp-content/uploads/IMG_1869.jpg
 [8]: http://melcher.it/wp-content/uploads/IMG_1865.jpg
 [9]: http://melcher.it/wp-content/uploads/IMG_1866.jpg
 [10]: http://melcher.it/wp-content/uploads/IMG_1867.jpg
 [11]: http://melcher.it/wp-content/uploads/IMG_1868.jpg
 [12]: http://melcher.it/wp-content/uploads/IMG_1864.jpg
 [13]: http://melcher.it/wp-content/uploads/IMG_1862.jpg
 [14]: http://melcher.it/wp-content/uploads/IMG_1863.jpg
 [15]: http://melcher.it/wp-content/uploads/IMG_1870.jpg

---
title: How about building a magic mirror?!
author: Max Melcher
aliases:
   - "/post/2017-03-25-how-about-building-a-magic-mirror/"
2017: "03"
type: post
date: 2017-03-25T13:07:15+00:00
url: /2017/03/how-about-building-a-magic-mirror/
categories:
  - IoT

---
It was winter, dark and cold outside, maybe rainy - something must have been really odd - because I started to build something physically, my very first hardware project - a magic mirror. And having two left hands I am trying to avoid as much as I can to build things outside of Visual Studio if you know what I mean&#8230; and it was July.

&nbsp;

## Magic Mirror - the idea

{{< fancybox "/wp-content/uploads" "magicmirrormain.jpg" "" "single_image" >}}

> “It’s called a ‘Magic Mirror’, but a more accurate name would be a ‘Smart Mirror’,” Bradley tells us. “It’s a mirror that displays the information you need to know at a quick glance: the time, the date, the weather, and of course a compliment!” &#8212; https://www.raspberrypi.org/magpi/magic-mirror/

And then I talked to [Heino ][1]at a SharePoint conference who told me that he had one and how easy it was to build one, getting the mirror and all that  - thanks Heino&#8230;!!! 🙂

My initial goal was to build a small mirror to show off at the office - show some personalized things like appointments, news, twitter feed, weather, nothing fancy, right?

## Getting started

I never thought that getting the first thing to work was so easy. Actually it took me 1 hour to have the first mirror up and running:

  1. Order a [perfect starter kit][2] [ref] at Amazon - with a RasberryPi3, a case, adapters,
  2. Plug it in and connect it to a monitor
  3. Boot up noobs and install raspbian
  4. Setup the [magicmirror²][3] software with one line of shell script: 
        curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh | bash

4 easy steps and ~1 hour later - the result looked like this:

[{{< fancybox "/wp-content/uploads" "magicmirror-software.jpg" "" "single_image" >}}][4]

&nbsp;

A promising start with a calendar, some nice descriptive text about the viewer and a weather forecast (that did not work on the screenshot) - except no SharePoint, right?

But it doesn't look like a mirror yet&#8230;

## Building the frame

I was a little bit afraid of building something out of wood, putting a mirror in front of it - so I decided to make my life as easy as possible:

Step 1: Get your old monitor out of the basement (for free!)
  
Step 2: Remove everything from the mirror (the foot and everything that you do not need) to get the panel as flat as possible
  
Step 3: Measure the width and height of the screen
  
Step 4: Go to building supplies store and get the wood for the frame, some screws and mirror glue
  
Step 5: Assemble the frame
  
Step 6: Order a double-sided acrylic mirror with the exact size of your frame
  
Step 7: Glue everything together

Followed by being super happy about the result:

{{< fancybox "/wp-content/uploads" "magicmirror-hardware.jpg" "" "single_image" >}}

{{< fancybox "/wp-content/uploads" "20170326_151426474_iOS-e1490541394758.jpg" "" "single_image" >}}

OK - that was a little abbreviated and sounded too easy - I followed [this guide][5] and got a lot of help from the building supplies store guys - and I am thankful for that 🙂

But the quality of the mirror combined with my 10-year-old monitor is really good - if I cover the backside so that it's entirely dark inside, the monitor is not visible on the front and the display magically appears.

## The software

I tried to create some modules for a SharePoint integration - but at that time node.js and the module felt odd - so I took another road and installed Windows IoT core on my Pi - but that's not done yet and I will follow-up with a blog post once I have something to show.

For just basic stuff the [magic mirror software][3] really looks mature, lots of modules and plugins ranging from webcams, Alexa integration, stock ticker - it's all there and ready to use.

If the weather outside would be nice right now, I would happily accept what I get there for free - but I want to build something by myself - My version of a magic mirror 🙂

 [1]: https://twitter.com/tripleiks
 [2]: http://amzn.to/2n41ObP
 [3]: https://magicmirror.builders/
 [4]: https://melcher.it/wp-content/uploads/magicmirror-software.jpg
 [5]: https://melcher.it/s/9e

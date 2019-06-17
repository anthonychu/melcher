---
title: Bootstrap and SharePoint Online – how to avoid css ricochet
author: Max Melcher
aliases:
   - "/post/2016-03-04-bootstrap-sharepoint-online-avoid-css-ricochet/"
2016: "03"
type: post
date: 2016-03-04T00:31:54+00:00
url: /2016/03/bootstrap-sharepoint-online-avoid-css-ricochet/
yourls_shorturl:
  - http://melcher.it/s/7r
categories:
  - Customization
  - SharePoint Online

---
In my current project I had the challenge to improve the user experience for some pages without messing too much with the MasterPage (because you shouldn't, right?). The client explicitly requested components like accordions, responsive tables and more control of the page alignments. So what would be easier to use a mobile first, responsive made by the @twitter guys? Apparently SharePoint Online does not like bootstrap too much - one you add the css files, you will see notable changes.

In this post I show you how to fix that.

## Bootstrap and SharePoint Online

<img data-attachment-id="2102" data-permalink="https://melcher.it/2016/03/bootstrap-sharepoint-online-avoid-css-ricochet/bootstrap/" data-orig-file="https://melcher.it/wp-content/uploads/Bootstrap.png" data-orig-size="789,396" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Bootstrap" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Bootstrap-300x151.png" data-large-file="https://melcher.it/wp-content/uploads/Bootstrap.png" class="aligncenter size-medium wp-image-2102" src="https://melcher.it/wp-content/uploads/Bootstrap-300x151.png" alt="Bootstrap" width="300" height="151" srcset="https://melcher.it/wp-content/uploads/Bootstrap-300x151.png 300w, https://melcher.it/wp-content/uploads/Bootstrap-768x385.png 768w, https://melcher.it/wp-content/uploads/Bootstrap-765x384.png 765w, https://melcher.it/wp-content/uploads/Bootstrap.png 789w" sizes="(max-width: 300px) 100vw, 300px" />

&nbsp;

Bootstrap (currently 3.3.6 and shortly 4.0) brings a lot of nice components that can be embedded within a standard SharePoint Page. Its not end-user friendly, an editor needs a least basic html skills to use it - but if you can use it, its fairly easy to improve the user experience. And because the twitter guys are really smart (and their css skills are way better than mine) it even works decently on mobile devices.

You can simply (that was my first attempt) add the css tag to a page:

{{< highlight html >}}
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
{{< /highlight >}}


On the basic team site landing page I found at least 5 changes:

{{< fancybox "/wp-content/uploads" "TwitterBootstrap-SharePointOnline.png" "twitter bootstrap overrides the SharePoint css" "single_image" >}}

  1. the heading has an increased font size and the position has changed
  2. the title of a webpart has an increased font size
  3. the paginator icon is displaced
  4. the search icon of a doclib is displaced.
  5. the full screen icon is gone

## Restrain/scope

At first I thought its rather easy, just change a couple of lines within bootstrap and you should be good to go. Right, that took actually longer than the good solution - I stopped and googled. I found a solution on [stackoverflow from 2012][1] - and guess what - it still works. In order to to that you need to do the following:

  1. Install [nodejs][2]
  2. Download the [twitter bootstrap source code][3] and unzip it
  3. Open the nodejs command prompt
  4. Install **grunt-cli** with the following command
      {{< highlight node >}}npm install grunt-cli -g {{< /highlight >}}
        {{< fancybox "/wp-content/uploads" "twitter-bootstrap-grunt-cli.png" "twitter bootstrap overrides the SharePoint css" "single_image" >}}
  5. Switch to the twitter bootstrap directory
      Open the **bootstrap.less** file in the **less** folder and wrap every **@import** with: 
      {{< highlight html >}}.bootstrap { }{{< /highlight >}}

{{< fancybox "/wp-content/uploads" "Bootstrap-wrap.png" "bootstrap wrap - dont forget the closing }" "single_image" >}}
  6. Now switch back to the node command prompt. Change to the bootstrap directory.
  7. Run {{< highlight node >}}npm install{{< /highlight >}} to install missing packages {{< fancybox "/wp-content/uploads" "npm-install.png" "npm i to install missing dependencies" "single_image" >}}
  8. Run grunt dist to compile your new css 
  9. {{< highlight node >}}grunt dist{{< /highlight >}}
      {{< fancybox "/wp-content/uploads" "grunt-dist.png" "grunt dist to generate a scoped bootstrap file" "single_image" >}}
  10. Et voila - then you have your perfectly scoped css in the folder **dist/css**:{{< fancybox "/wp-content/uploads" "scoped-bootstrap.png" "scoped bootstrap file" "single_image" >}}
Now you only have to upload this file to SharePoint Online (e.g. a style library) and either reference it within a Script Editor Webpart (your add it to your MasterPage if you are brave enough!). If you want to use it, you have to add the class "bootstrap" before:
{{< fancybox "/wp-content/uploads" "bootstrap-class.png" "bootstrap class as wrapper for everything" "single_image" >}}
                                        
And the you can use twitter bootstrap without jeopardizing your SharePoint Online look and feel:
{{< fancybox "/wp-content/uploads" "twitter-bootstrap-without-impact.png" "bootstrap without risk of impact" "single_image" >}}
                                  
## The SASS way
                                        
If you want to do the same thing with the current version of bootstrap (and bootstrap 4 once its out), then you can simple [download the SASS version][5]:
{{< fancybox "/wp-content/uploads" "bootstrap-getsass.png" "download the SASS version" "single_image" >}}
Then open the _bootstrap.scss file with your favorite editor and wrap the imports with a class:
{{< fancybox "/wp-content/uploads" "bootstrap-sass.png" "bootstrap-sass.png " "single_image" >}}
Compile the sass and check the css:
{{< fancybox "/wp-content/uploads" "bootstrap-sass-compiled.png" "SASS compiled" "single_image" >}}
The sass approach took me like 5 minutes with VS Code - awesome.

## If you have read so far

If you want my pre-compiled version, please take it from [here][9] (version 3.3.6, use on your own risk!).
And then leave a comment 🙂

 [1]: http://stackoverflow.com/questions/10568065/limit-the-scope-of-bootstrap-styles
 [2]: https://nodejs.org/en/
 [3]: https://github.com/twbs/bootstrap/archive/v3.3.6.zip
 [5]: http://getbootstrap.com/getting-started/#download
 [9]: http://melcher.it/s/7s

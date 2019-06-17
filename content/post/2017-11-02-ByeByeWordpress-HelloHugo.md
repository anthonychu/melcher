---
author: "Max Melcher"
title: "Bye Bye Wordpress - Hello Hugo"
aliases:
   - "/post/2017-11-02-ByeByeWordpress-HelloHugo/"
2017: "11"
date: 2017-11-02T20:28:33+01:00
categories:
  - Website
tags:
  - Wordpress
  - Hugo
  - Performance
image: 
- "/images/2017-11-04 22_49_45-Melcher.it - Melcher.it.png"

featured: true
featured: "2017-11-04 22_49_45-Melcher.it - Melcher.it.png" 
featuredalt : "Pic 2" 
featuredpath : "/images"
---


After over 6 years and 185 blog posts its time to leave Wordpress as a blogging platform and move on to [Hugo](https://gohugo.io).

This move is not because I had to, but in the past I replaced many of the services I used to managed services (I am looking at you, Office 365!) - and this tiny blog is the only reason I have to maintain a, most of the time, outdated linux VM with a fully fledged nginx, a slow and certainly unsecured MySql database and what not - for a blog... that does not feel right. And is slow. And the server that runs on a VM is actually quite expensive.
Its like using a database when you dont need it - similar to the experience that Scott Hanselman describes in his post [Cloud Database? NoSQL? Nah, just use CSVs and CsvHelper](https://www.hanselman.com/blog/CloudDatabaseNoSQLNahJustUseCSVsAndCsvHelper.aspx). No more wordpress security updates for me.

## Enough of the past - lets make this awesome!

So I checked many many blog engines - asked my friends - thought about coding my own like my friend [Ben Abt's SchwabenCode](https://schwabencode.com) - and i came to the conclusion that I wanted to have a **static site generator** that **compiles** my blog posts into a super performing, zero maintenance website that simply works. So I checked the popular ones like [Jekyll](https://jekyllrb.com/) or [Ghost](https://ghost.org/) - but Ruby ruled out the first (even the mature community did not convince me), and many negative comments about ghost ruled out the other. So I tried the "newcomer" Hugo and it instantly felt right. As editor I can use the tool I like - [VS Code](https://code.visualstudio.com/) - with the git integration I can flawlessly check-in, version and backup my **entire** blog. And replicate it to all my devices. Awesome.

{{< fancybox "/images" "2017-11-02 21_13_18-VSCode and Hugo.png" "VS Code and Hugo - a match made in heaven!" "single_image" >}}

Migration from Wordpress was not that easy - I had to [install a plugin](https://github.com/SchumacherFM/wordpress-to-hugo-exporter) on the host, run the code in the ubuntu shell - and that created a 900mb zip with all my old assets and my blog posts as markup. I see some cleanup in the near future - but 90% automatically is better than 100% copy and paste... wouldnt have done it without it, so I am thankful for the hard work! And keep all my old links - that is of course super important!

## Themes & Performance & Editing

I tried to create and adjust my Wordpress theme - but my php skills retired and it always was pain for me:
{{< fancybox "/images" "2017-11-03 00_31_41-Melcher.it - SharePoint, Search and other stuff.png" "old melcher.it theme" "single_image" >}}
It loaded so much stuff, even with advanced techniques like http_spdy http/2 and wordpress caching plugins I had too many requests to make the page really fast. 70!!! http request for my landing page:

{{< fancybox "/images" "2017-11-03 00_49_34-.png" "70 requests, 1.3MB and 5.5 seconds until everything is loaded!" "single_image" >}}

and compared to the new Hugo landing page:
{{< fancybox "/images" "2017-11-03 00_52_27-NVIDIA GeForce Overlay.png" "25 requests, 323kb and 729ms until everything is loaded!" "single_image" >}}

Thats only 35% of the requests, 13% of the pagesize and blasting 6% of the load time I had before - on a 1 core Azure Website (S1). Could be further improved with a [CDN or minifing the assets](http://danbahrami.io/articles/building-a-production-website-with-hugo-and-gulp-js/) - but well, I can live with that and have less technical complexity.

With hugo, customizing is simply editing html files and adding placeholders - well, a bit more than that but I got easily used to it.
In case you ask, the theme I use here is **hugo-future-imperfect** - and because of its open MIT license, I customized it to my basic needs. And it looks great on mobile. The [hugo documentation](http://gohugo.io/documentation/) is very helpful!

Hugo uses markdown to craft posts and pages - I have some experience with it from github - but checking this [markdown cheat sheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#blockquotes) helps. And the markdown preview in VS Code, of course.

## Deploy to Production

Its no secret that I attend a [lot of conferences](/events). Most of the time I blog about the sessions I attend. In the past I add use the Wordpress browser editor which required a stable internet connection... or lots of work after the session that I rather use to ask questions or chat with people. Wordpress sometimes blocked me - even if I miss the "drag and drop" insertion of a picture already.

In the future I can write these post entirely offline, add picture and make the post ready. Once that is done, I can preview the post locally and render it like it will be shown live.
Then do a **git commit** and **git push** - and a short moment later (*if the internet works*) this website will be deployed to an Azure Website in all its beauty:

```cmd
Built site for language en:
0 of 36 drafts rendered
0 future content
0 expired content
154 regular pages created
114 other pages created
6955 non-page files copied
241 paginator pages created
0 tags created
48 categories created
total in 11388 ms
```

So 11 seconds for my entire website - awesomesauce! When I do write locally the delta-creation takes 400ms or so.

So how do I deploy this to my favorite cloud platform Azure? There is a cool [deployment script](https://github.com/hxlnt/hugo-on-azure) for that (see my PR for latest Hugo binaries!) - and read this [post](http://nobadmemories.com/blog/2017/05/blogging-with-hugo-and-azure/) for setting everything up.
Entire deployment takes about 5 minutes - that could be improved, but I dont see the reason here.

Additionally the commenting experience changed - I migrated my comments to disqus - with wordpress I missed lots of comments and I hope that disqus works out.

Unfortunately I cannot update my channels automatically once I publish a post - I will figure out how to that with the least effort.

## Future

So blogging is fun again - and thats how it is supposed to be!

If you have questions - please use the new comment system, I am eager to see how that works out!

---
title: "Inconvenient Hugo Yearly/Monthly Archives"
date: 2019-01-05T08:32:05+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Hugo
tags:
  - Archive
  - Yearly
  - Monthly
  - Archetypes
  - Taxonomy List Template
  - SEO
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "@gohugoio"
---

Yesterday I noticed, that my blog did not have the very best urls for my posts than I could have - my last post had the url [/post/2018-12-29-Recapping-2018/](/post/2018-12-29-Recapping-2018/)
and actually I thought it would (and should!) produce something like this: [/2018/12/Recapping-2018-90-days-at-Microsoft/](/2018/12/Recapping-2018-90-days-at-Microsoft/)
After changing the urls to the correct schema (more in a bit) I noticed that the yearly (e.g. [/2018](/2018)) or monthly (e.g. [/2018/12](/2018/12)) links do not work at all.

In this post, I show you how I fixed those problems.
<!--more-->
Firstly, I changed the links for the posts. My [chosen blog engine](https://gohugo.io), Hugo, is so awesome that this is just one setting in the config:

{{< highlight toml  "linenos=table" >}}
[permalinks]
  post = "/:year/:month/:title/"
{{< /highlight >}}

After that, every "post" will have this link structure /year/month/title.Simple and easy to understand. That change, of course, breaks all the existing links out there and would potentially be a hit on your google SEO and kill all my tweets/posts etc. So I wrote a [short PowerShell script](add-aliases.ps1) to update all my posts to be available at the old address and the new address, in hugo language I added an [alias](https://gohugo.io/content-management/urls/#aliases).
So far, so good, right? Changing all my posts with PowerShell is awesome, too :)

## Yearly / Monthly archives for Hugo

As mentioned in the introduction, I noticed that the yearly (e.g. [/2018](/2018)) and monthly (e.g. [/2018/12](/2018/12)) urls do not show the expected results - a list of posts from that time. And I am actually a little bit concerned if that is bad for my SEO or not. I didn't like it, so I wanted to change it. There has to be flag to generate this list, right? Nope, afaik there is no such option yet. The [github issue #448](https://github.com/gohugoio/hugo/issues/448) for that feature request gets postponed regularly, so I had only 3 options for it:

1. leave it
2. learn go and submit a pull request
3. find a workaround

So 1. is not acceptable. 2. is unfortunately out of scope right now. So lets find a workaround: After extensive googling I found this [workaround](https://blog.atj.me/2017/10/generate-yearly-and-monthly-archive-pages-with-hugo-sections/) that used some javascript/node code to generate the archive pages. I want to stick to the standard, that does not feel right.
So I tried another [workaround](https://discourse.gohugo.io/t/how-to-generate-chronological-blog-archives-in-hugo/13491/6) were @onedrawingperday suggested to use a taxonomy to additionally tag the year and month on each post and use taxonomy list pages to show the posts. Not ideal, because the date is already in the frontmatter - but I can live with it.
So I changed the site config to have a taxonomy per year:
{{< highlight toml  "linenos=table,hl_lines=4-12">}}
[taxonomies]
  category = "categories"
  tag = "tags"
  2011 = "2011"
  2012 = "2012"
  2013 = "2013"
  2014 = "2014"
  2015 = "2015"
  2016 = "2016"
  2017 = "2017"
  2018 = "2018"
  2019 = "2019"
{{< /highlight >}}

Then I created a [second powershell](add-datetax.ps1) to tag all my existing posts with the new date tags in the frontmatter. The month part is a two digit number that is quoted (for sorting, see later in this post!).
{{< fancybox "images" "datetag.png" "Adding a new tag for the year/month in every post" "single_image" >}}

{{< highlight yaml  "linenos=table,hl_lines=4" >}}
---
title: "Inconvenient Hugo Yearly/Monthly Archives"
date: 2019-01-04T11:32:05+01:00
2019: "01"
author: "Max Melcher"
---
{{< /highlight >}}

That generates a beautiful, but unfortunately empty page:
{{< fancybox "images" "archive.png" "empty archive page" "single_image" >}}

Then I figured out that I can create [taxonomy list pages](https://gohugo.io/templates/taxonomy-templates/) to actually show content on those pages. Luckily the fabulous [theme](https://themes.gohugo.io/future-imperfect/) my blog uses had two templates that I could copy. 
Because I created 9 taxonomies, I had to create them for every year:
{{< fancybox "images" "taxonomy.png" "Taxonomy page per year" "single_image" >}}

I modified the taxonomy list template a tiny bit to replace the "02" tag value to "February". I had to tag it with two digit numeral value to have a proper sorting on the page, here 2019.terms.html (name of the file is important!). I changed the template code to get the tags from .Data.Terms.Alphabetical (line 7) - because the values are two digit numerical, sorting works perfect for this case.

**Please note: the files will only work with the theme [future imperfect](https://themes.gohugo.io/future-imperfect/) - if you want the same behavior you have to adjust the files to your theme!**

{{< highlight html  "linenos=table,hl_lines=7 13 19 20">}}
{{ partial "general-title" . }}

{{ partial "header" . }}
    {{ partial "navbar" . }}
    <!-- Main -->
    <div id="main">
            {{ $.Scratch.Set "tags" .Data.Terms.Alphabetical }}
        <ul class="posts">
            <header>
                <h1>// {{ .Data.Plural }}</h1>
            </header>
            {{ $data := .Data }}
            {{ $months := dict "01" "January" "02" "February" "03" "March" "04" "April" "05" "May" "06" "June" "07" "July" "08" "August" "09" "September" "10" "October" "11" "November" "12" "December" }}
            {{ range $key, $value := $.Scratch.Get "tags" }}
                <li>
                    <article>
                        <header>
                            {{ if ne $value.Name "" }}
                                {{ $month := index $months $value.Name }}
                                <a href="{{"/" | relURL}}{{ $data.Plural }}/{{ $value.Name | urlize }}">{{ $month }}</a>
                                <span style="float:right;">({{ $value.Count }})</span>
                            {{ else }}
                                Uncategorized
                                <span style="float:right;">({{ $value.Count }})</span>
                            {{ end }}
                        </header>
                    </article>
                </li>
            {{ end }}
        </ul>
    </div>

    {{ $.Scratch.Set "showCategories" false }}
    {{ partial "sidebar" . }}
{{ partial "footer" . }}
{{< /highlight >}}

and 2019.html file:

{{< highlight html  "linenos=table,hl_lines=8 9">}}
{{ partial "general-title" . }}

{{ partial "header" . }}
    {{ partial "navbar" . }}
    <!-- Main -->
    <div id="main">
        <header>
                {{ $months := dict "01" "January" "02" "February" "03" "March" "04" "April" "05" "May" "06" "June" "07" "July" "08" "August" "09" "September" "10" "October" "11" "November" "12" "December" }}
                <h1>// {{ index $months .Title }} {{ .Section }}</h1>
        </header>
        
        {{ $paginator := .Paginate (where .Data.Pages "Type" "post") }}
        {{ range $paginator.Pages }}
            {{ .Render "content-list" }}
        {{ end }}

        {{ partial "pagination" . }}
    </div>
    {{ partial "sidebar" . }}
{{ partial "footer" . }}
{{< /highlight >}}

Then I altered my [archetype](https://gohugo.io/content-management/archetypes/) that I use to create new pages - it should automatically have the taxonomy value so I dont have to take care of it:

{{< highlight yaml   "linenos=table,hl_lines=4">}}
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
{{dateFormat "2006" .Date}}: "{{dateFormat "01" .Date}}"
author: "Max Melcher"
---
{{< /highlight >}}
Archetypes are a neat feature!

And that results in usable archive pages that fit my needs (see [/2018/12](/2018/12) or [/2018](/2018)). A bit inconvenient is, that I have to remember that I need to create a new taxonomy next year and duplicate the taxonomy list template files. Or shall I pre-provision them now? :)
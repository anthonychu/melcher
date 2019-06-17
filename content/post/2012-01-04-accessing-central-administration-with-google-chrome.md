---
title: Accessing Central Administration with Google Chrome
author: Max Melcher
aliases:
   - "/post/2012-01-04-accessing-central-administration-with-google-chrome/"
2012: "01"
type: post
date: 2012-01-04T18:30:30+00:00
url: /2012/01/accessing-central-administration-with-google-chrome/
yourls_shorturl:
  - http://melcher.it/s/k
categories:
  - Misc
  - SharePoint 2010

---
When accessing Central Administration with Google Chrome you will get the following:

<pre>"This webpage is unavailable"</pre>

with the description:

<pre>Error 312 (net::ERR_UNSAFE_PORT): Unknown error.</pre>

In order to fix that edit the Properties of the Chrome link and append the following to the "target" value:

<pre>--explicitly-allowed-ports=42</pre>

where 42 is the port for your Central Administration. You can add more ports if you want, in total it should like this:

<pre>C:\Users\mmelcher\AppData\Local\Google\Chrome\Application\chrome.exe --explicitly-allowed-ports=42,84,87</pre>

&nbsp;

Still dont like it - ports are not unsafe by default - but at least there is an option to allow it. Dont you think?

&nbsp;

&nbsp;

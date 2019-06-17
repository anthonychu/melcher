---
title: 'Quick fix: For security reasons DTD is prohibited in this XML document'
author: Max Melcher
aliases:
   - "/post/2016-02-02-for-security-reasons-dtd-is-prohibited-in-this-xml-document/"
2016: "02"
type: post
date: 2016-02-02T08:30:11+00:00
url: /2016/02/for-security-reasons-dtd-is-prohibited-in-this-xml-document/
yourls_shorturl:
  - http://melcher.it/s/73
categories:
  - Office 365
  - Quick Fix
  - SharePoint Online

---
Another day, another quick fix - I hope it helps!

## Situation

Working from home is very productive they said - not in my case, the wonderful script to [reindex SharePoint Online UserProfiles][1] from [Mikael Svenson][2] worked at work - but throws errors at home.

{{< fancybox "/wp-content/uploads" "2016-02-01-23_30_47-Windows-PowerShell.png" "IT WORKED BEFORE...?!?" "single_image" >}}

The error "For security reasons DTD is prohibited in this XML document" does not help much&#8230;

## Quick fix

Google suggested me to change my DNS entries to 8.8.8.8 or 8.8.4.4 - in my case that had no impact at all. Still, my assumption was ([Occam's razor, actually][3]), that it has something to do with DNS - to many blog posts I read said something with DNS.

Easiest way to verify? [Fiddler][4], right!

{{< fancybox "/wp-content/uploads" "2016-02-01-23_30_52-Fiddler-Web-Debugger.png" "IT WORKED BEFORE...?!?" "single_image" >}}

So in my case it was a combination of my ISP and IPv6 - I changed my DNS on my PC and disabled IPv6 - and everything is back to green!

{{< fancybox "/wp-content/uploads" "2016-02-02-00_00_04-Windows-PowerShell.png" "IT WORKED BEFORE...?!?" "single_image" >}}
  


## References

That post pushed me in the right direction: [Office 365 – DTD is prohibited in this document issue][5] - thanks a bunch!

 [1]: http://melcher.it/s/6X
 [2]: http://www.techmikael.com/
 [3]: http://melcher.it/s/6Y
 [4]: http://www.telerik.com/fiddler
 [5]: http://melcher.it/s/6Z

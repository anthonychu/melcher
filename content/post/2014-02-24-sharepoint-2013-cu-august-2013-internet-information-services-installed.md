---
title: SharePoint 2013 CU August 2013 – “Internet Information Services not installed”
author: Max Melcher
aliases:
   - "/post/2014-02-24-sharepoint-2013-cu-august-2013-internet-information-services-installed/"
2014: "02"
type: post
date: 2014-02-24T10:21:38+00:00
url: /2014/02/sharepoint-2013-cu-august-2013-internet-information-services-installed/
yourls_shorturl:
  - http://melcher.it/s/1S
categories:
  - ITPro
  - SharePoint 2013

---
Today it was time to update my SharePoint 2013 installation from March PU 2013 to [August 2013 CU][1] - mostly because the Search Schema changed under the hood and I wanted to try something out for the awesome [Search Query Tool][2].

## Download

Wow, 1.8GB patch – that is huge! Compared to the RTM version of SharePoint 2013 with 2.4GB they rewrote 75% - or the patching strategy is not that optimal.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="MSDN Subscriber Downloads_2014-02-21_15-36-30" alt="MSDN Subscriber Downloads_2014-02-21_15-36-30" src="http://melcher.it/wp-content/uploads/MSDN-Subscriber-Downloads_2014-02-21_15-36-30_thumb.png" width="244" height="29" border="0" />][3]

Its time for a new baseline so patches can be smaller again. Lets see what happens after the [SPC][4].

You can grab the **SharePoint 2013 CU August 2013** patch here: <http://support.microsoft.com/hotfix/KBHotfix.aspx?kbnum=2817616&kbln=en-us>

KB Details here: [http://support.microsoft.com/kb/2817616][1]

Patch notes of Todd Klindt (my inofficial SharePoint patch guru) are here (and no regression reported): [http://www.toddklindt.com/blog/Regressions/SP2013Aug13.aspx][1]

## Patching

For the patching part I always take the script from the article

[“Why SharePoint 2013 Cumulative Update takes 5 hours to install?”][5] – if you have not read it, go for it. This time something went bad, maybe because I started the script from ISE or something like that – it could not start the patch process so I did it myself. Took around 30 Minutes on my DEV VM – reboot and we should be ready, right?

## “Internet Information Service not installed”

After the patching you have to start the Config Wizard. I was a little surprised as it responds with a nice error –  I even tried the PowerShell command in case there is a difference, but no:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Terminals 3.4.0 (Files store)_2014-02-21_15-12-49" alt="Terminals 3.4.0 (Files store)_2014-02-21_15-12-49" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_15-12-49_thumb.png" width="244" height="211" border="0" />][6]

What? IIS not installed anymore? Something must be broken with the Patch – let’s blame Todd for it:

<blockquote class="twitter-tweet" width="500">
  <p>
    I patch my SharePoint 2013 to August CU - if that does not work I blame <a href="https://twitter.com/ToddKlindt">@ToddKlindt</a> 🙂
  </p>
  
  <p>
    &mdash; Maximilian Melcher (@maxmelcher) <a href="https://twitter.com/maxmelcher/statuses/436849642119376896">February 21, 2014</a>
  </p>
</blockquote>



But then I tried to reproduce my steps – of course it must be an user error. After reading the patch script (reading things sometimes helps), I noticed that the script disables the IIS Admin service…

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Terminals 3.4.0 (Files store)_2014-02-21_15-31-32" alt="Terminals 3.4.0 (Files store)_2014-02-21_15-31-32" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_15-31-32_thumb.png" width="216" height="244" border="0" />][7]

SharePoint does not like that – set it back to Automatic start and start the service.

Starting the site is a good idea, too:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="_2014-02-21_16-11-08" alt="_2014-02-21_16-11-08" src="http://melcher.it/wp-content/uploads/2014-02-21_16-11-08_thumb.png" width="244" height="174" border="0" />][8]

And then start the config wizard again:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="_2014-02-21_16-11-45" alt="_2014-02-21_16-11-45" src="http://melcher.it/wp-content/uploads/2014-02-21_16-11-45_thumb.png" width="244" height="126" border="0" />][9]

And wait until every database is updated:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border-width: 0px;" title="Terminals 3.4.0 (Files store)_2014-02-21_16-15-49" alt="Terminals 3.4.0 (Files store)_2014-02-21_16-15-49" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_16-15-49_thumb.png" width="244" height="126" border="0" />][10]

## Search "Paused for:External request"

Then I tried do do a Search – without a success. I went to the Search Service Application page and saw the status: “Paused for:External request” – that means something paused the Service Application (maybe, just maybe someone tried to patch):

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Terminals 3.4.0 (Files store)_2014-02-21_16-28-37" alt="Terminals 3.4.0 (Files store)_2014-02-21_16-28-37" src="http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_16-28-37_thumb.png" width="244" height="83" border="0" />][11]

and we should resume it – 3 lines of PowerShell:

<pre lang="powershell">Add-PSSnapin Microsoft.SharePoint.PowerShell
$ssa = Get-SPEnterpriseSearchServiceApplication
$ssa | Resume-SPEnterpriseSearchServiceApplication</pre>

## Lessons learned

Patching can be tough – but when you protocol what you do or can at least reproduce what you have done its pretty much straight forward. I do not blame the patch script here, I obviously did something wrong – but the error message is really misleading isn’t it?

 [1]: http://support.microsoft.com/hotfix/KBHotfix.aspx?kbnum=2817616&kbln=en-us
 [2]: https://sp2013searchtool.codeplex.com/
 [3]: http://melcher.it/wp-content/uploads/MSDN-Subscriber-Downloads_2014-02-21_15-36-30.png
 [4]: http://www.sharepointconference.com/
 [5]: http://blogs.msdn.com/b/russmax/archive/2013/04/01/why-sharepoint-2013-cumulative-update-takes-5-hours-to-install.aspx
 [6]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_15-12-49.png
 [7]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_15-31-32.png
 [8]: http://melcher.it/wp-content/uploads/2014-02-21_16-11-08.png
 [9]: http://melcher.it/wp-content/uploads/2014-02-21_16-11-45.png
 [10]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_16-15-49.png
 [11]: http://melcher.it/wp-content/uploads/Terminals-3.4.0-Files-store_2014-02-21_16-28-37.png

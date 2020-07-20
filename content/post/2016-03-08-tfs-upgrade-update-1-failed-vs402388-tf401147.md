---
title: TFS 2015 Upgrade to Update 1 failed (VS402388 / TF401147)
author: Max Melcher
aliases:
   - "/post/2016-03-08-tfs-upgrade-update-1-failed-vs402388-tf401147/"
2016: "03"
type: post
date: 2016-03-08T14:25:50+00:00
url: /2016/03/tfs-upgrade-update-1-failed-vs402388-tf401147/
yourls_shorturl:
  - http://melcher.it/s/7t
categories:
  - TFS

---
Recently I tried to upgrade a TFS 2015 installation for a client to Update 1. Because I did not find a solution in the internet (even with the error code TF401147), it's time to blog about a solution.

## Installation of Update 1 - VS402388 / TF401147

The installation of [update 1][1] worked perfectly: In the first place I installed it because we wanted to move TFS to a more performant server and I installed the new server with TFS 2015 Update 1. Once I tried to connect the new server with the configuration database it told me that the database is old and I need to update it. Well, let's just update the old server I said to myself (lessons learned here, trust me!) - installed, rebooted server during lunch time and run the upgrade wizard. It stopped because it could not create the IIS site hosting TFS:

<pre class="lang:default decode:true">[Info   @14:16:31.724] Microsoft.Web.Administration is installed: True
[Info   @14:16:31.725] finding if 8080 is available
[Info   @14:16:31.725] Iis7Manager.FindFirstFreePortBetween is called. Begin: 8080, End: 8080
[Info   @14:16:31.725] IisManagerImplementation.IsInstalled is called
[Info   @14:16:31.725] Microsoft.Web.Administration is installed: True
[Info   @14:16:31.725] scanning 1 ports
[Info   @14:16:31.745] availPort: 8080
[Warning@14:16:31.745] Storename MY of binding cannot be parsed. Use default store.
[Warning@14:16:31.747] VS402388: The previously configured binding on port 8080 cannot be re-created because the certificate with thumbprint (D6E81B40AE72B3BFE75CE6E16B6F2CE959C1994E) could not be found in the certificate store (MY). If you continue, you will need to manually re-create the binding.
[Info   @14:16:31.747] available: False
[Info   @14:16:31.747] Node returned: Error
[Error  @14:16:31.747] TF401147: The previously configured ports for the Application Tier Web Service site are currently in use.  See the log for additional details.
[Info   @14:16:31.747] Completed SiteAvailability: Error
</pre>

I checked IIS and the site was not there anymore. IISReset and deleting all app pools - same result. Removing the IIS role from the server - same result. Then I focused on the server certificate, it was in the cert store but expired on 12.01.2016 - mhh&#8230; changed the system clock back to 11.01.2016 - same result. So i was stuck.

## Always have a &#8216;Plan B' - and backups!

Luckily, as mentioned, the final goal was to move TFS to a new server. So I did the upgrade of the configuration database on the new server and installed the application tier there - changed the URL and at least the web interface was back and people could continue working. Did I mention that I was super happy that I created backups before?

## Getting help!

Once an error occurs within the TFS installation or upgrade you are requested to send the zipped logs to tfcare@microsoft.com - and I did so.

[{{< fancybox "/wp-content/uploads" "tfcare.png" "" "single_image" >}}][2]

I was really surprised to get a reply within 20 minutes - not an automated one as I expected, Vladimir Khvostov replied instantly. After explaining my problems and verifying that the IIS is really empty, Vladimir told me to delete <span class="lang:default decode:true crayon-inline">C:\ProgramData\Microsoft\Team Foundation\Configuration\SavedSettings\ApplicationTier </span>  and try again:{{< fancybox "/wp-content/uploads" "help-from-vladimir.png" "" "single_image" >}}

And that worked, thanks again Vladimir!

If that happens again with [Update 2][4] (I am really awaiting that one!), I won't even hesitate to send a line to those awesome guys!

 [1]: https://www.visualstudio.com/en-us/news/tfs2015-update1-vs.aspx
 [2]: https://melcher.it/wp-content/uploads/tfcare.png
 [3]: https://melcher.it/wp-content/uploads/help-from-vladimir.png
 [4]: https://www.visualstudio.com/en-us/news/tfs2015-update2-vs.aspx

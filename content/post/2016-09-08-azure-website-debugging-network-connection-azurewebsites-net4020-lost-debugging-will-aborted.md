---
title: 'Azure Website Debugging: The network connection to *.azurewebsites.net:4020 has been lost. Debugging will be aborted.'
author: Max Melcher
aliases:
   - "/post/2016-09-08-azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/"
2016: "09"
type: post
date: 2016-09-08T08:30:53+00:00
url: /2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/
yourls_fetching:
  - "1"
categories:
  - Apps
  - Azure
  - Development
  - SharePoint Addins

---
Recently my colleagues and I created a lot of SharePoint provider-hosted addins - in our case that is just a MVC Website hosted on Azure that talks balk to SharePoint. And I have to say it is good fun because we could actually debug a production site/business application in case something unforeseeable happens (aka. bugs). And the integration in Visual Studio via the Cloud Explorer could not be simpler. Right click on the website, attach debugger and see the problem.

{{< fancybox "/wp-content/uploads" "2016-09-07-14_26_00-CloudExplorer.png" "" "single_image" >}}

&nbsp;

That worked a long time perfectly for us - but something changed and Visual Studio 2015 dropped the connection once a breakpoint is hit (sometimes even earlier). Strangely debugging still worked with Visual Studio 2013.

## Symptoms

Attaching with a Visual Studio 2015 Debugger either from Cloud Explorer, Server Explorer or directly via "attach to process" attaches the debugger briefly (if at all) and then results in two errors:

  1. The web browser shows: 502 - Web server received an invalid response while acting as a gateway or proxy {{< fancybox "/wp-content/uploads" "2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1.png" "" "single_image" >}}
    
    &nbsp;</li> 
    
      * In Visual Studio 2015 an error box shows: The network connection to <>.azurewebsite.net:4020 has been lost. Debugging will be aborted. 
        {{< fancybox "/wp-content/uploads" "Debugging-will-be-aborted.png" "" "single_image" >}}</li> </ol> 
        
        ## Fix
        
        The fix is rather simple. In Visual Studio open **Debug** menu from the top and click on **Options**:
        
        [{{< fancybox "/wp-content/uploads" "2016-09-07-14_33_50-Debug-Options.png" "" "single_image" >}}][1]
        
        Then click on **Debugging** > **General** and find the option **"Enable UI Debugging Tools for XAML"** and **uncheck** it. [{{< fancybox "/wp-content/uploads" "2016-09-07-14_37_36-Options.png" "" "single_image" >}}][2]
        
        After that, Debugging worked like a charm again.
        
        ## Thank you!
        
        I did not find that one out myself - the awesome Microsoft Support (I am looking at you Akash Khandelwal!) spent hours troubleshooting my problem. He early noticed that there is a something with WPF in the logs but we initially ruled that one out. After a while his team suggested to disable this option - and it worked!
        
        During the debugging session I learned a lot about Azure Website troubleshooting - great stuff!

 [1]: https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options.png
 [2]: https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options.png

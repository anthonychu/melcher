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

<div id="attachment_2168" style="width: 168px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer.png"><img data-attachment-id="2168" data-permalink="https://melcher.it/2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/2016-09-07-14_26_00-cloudexplorer/" data-orig-file="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer.png" data-orig-size="360,682" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-09-07 14_26_00-CloudExplorer" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer-158x300.png" data-large-file="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer.png" class="wp-image-2168 size-medium" src="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer-158x300.png" alt="Attach debugger on your remote azure website - cant be easier!" width="158" height="300" srcset="https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer-158x300.png 158w, https://melcher.it/wp-content/uploads/2016-09-07-14_26_00-CloudExplorer.png 360w" sizes="(max-width: 158px) 100vw, 158px" /></a>
  
  <p class="wp-caption-text">
    Attach debugger on your remote azure website - cant be easier!
  </p>
</div>

&nbsp;

That worked a long time perfectly for us - but something changed and Visual Studio 2015 dropped the connection once a breakpoint is hit (sometimes even earlier). Strangely debugging still worked with Visual Studio 2013.

## Symptoms

Attaching with a Visual Studio 2015 Debugger either from Cloud Explorer, Server Explorer or directly via "attach to process" attaches the debugger briefly (if at all) and then results in two errors:

  1. The web browser shows: 502 - Web server received an invalid response while acting as a gateway or proxy <div id="attachment_2165" style="width: 310px" class="wp-caption aligncenter">
      <a href="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1.png"><img data-attachment-id="2165" data-permalink="https://melcher.it/2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/2016-09-06-18_26_40-502-web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-2/" data-orig-file="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1.png" data-orig-size="1920,205" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-09-06 18_26_40-502 - Web server received an invalid response while acting as a gateway or proxy" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-300x32.png" data-large-file="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-1024x109.png" class="wp-image-2165 size-medium" src="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-300x32.png" width="300" height="32" srcset="https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-300x32.png 300w, https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-768x82.png 768w, https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-1024x109.png 1024w, https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-930x99.png 930w, https://melcher.it/wp-content/uploads/2016-09-06-18_26_40-502-Web-server-received-an-invalid-response-while-acting-as-a-gateway-or-proxy-1-765x82.png 765w" sizes="(max-width: 300px) 100vw, 300px" /></a>
      
      <p class="wp-caption-text">
        502 - Web server received an invalid response while acting as a gateway or proxy
      </p>
    </div>
    
    &nbsp;</li> 
    
      * In Visual Studio 2015 an error box shows: The network connection to <>.azurewebsite.net:4020 has been lost. Debugging will be aborted. 
        <div id="attachment_2166" style="width: 310px" class="wp-caption aligncenter">
          <img data-attachment-id="2166" data-permalink="https://melcher.it/2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/debugging-will-be-aborted/" data-orig-file="https://melcher.it/wp-content/uploads/Debugging-will-be-aborted.png" data-orig-size="490,172" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="Debugging will be aborted" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/Debugging-will-be-aborted-300x105.png" data-large-file="https://melcher.it/wp-content/uploads/Debugging-will-be-aborted.png" class="size-medium wp-image-2166" src="https://melcher.it/wp-content/uploads/Debugging-will-be-aborted-300x105.png" alt="Debugging will be aborted" width="300" height="105" srcset="https://melcher.it/wp-content/uploads/Debugging-will-be-aborted-300x105.png 300w, https://melcher.it/wp-content/uploads/Debugging-will-be-aborted.png 490w" sizes="(max-width: 300px) 100vw, 300px" />
          
          <p class="wp-caption-text">
            Debugging will be aborted.
          </p>
        </div></li> </ol> 
        
        ## Fix
        
        The fix is rather simple. In Visual Studio open **Debug** menu from the top and click on **Options**:
        
        [<img data-attachment-id="2169" data-permalink="https://melcher.it/2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/2016-09-07-14_33_50-debug-options/" data-orig-file="https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options.png" data-orig-size="389,456" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-09-07 14_33_50-Debug Options" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options-256x300.png" data-large-file="https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options.png" class="aligncenter wp-image-2169 size-medium" src="https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options-256x300.png" alt="2016-09-07 14_33_50-Debug Options" width="256" height="300" srcset="https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options-256x300.png 256w, https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options.png 389w" sizes="(max-width: 256px) 100vw, 256px" />][1]
        
        Then click on **Debugging** > **General** and find the option **"Enable UI Debugging Tools for XAML"** and **uncheck** it. [<img data-attachment-id="2170" data-permalink="https://melcher.it/2016/09/azure-website-debugging-network-connection-azurewebsites-net4020-lost-debugging-will-aborted/2016-09-07-14_37_36-options/" data-orig-file="https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options.png" data-orig-size="1082,628" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="2016-09-07 14_37_36-Options" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-300x174.png" data-large-file="https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-1024x594.png" class="aligncenter wp-image-2170 size-medium" src="https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-300x174.png" alt="2016-09-07 14_37_36-Options" width="300" height="174" srcset="https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-300x174.png 300w, https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-768x446.png 768w, https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-1024x594.png 1024w, https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-930x540.png 930w, https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options-765x444.png 765w, https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options.png 1082w" sizes="(max-width: 300px) 100vw, 300px" />][2]
        
        After that, Debugging worked like a charm again.
        
        ## Thank you!
        
        I did not find that one out myself - the awesome Microsoft Support (I am looking at you Akash Khandelwal!) spent hours troubleshooting my problem. He early noticed that there is a something with WPF in the logs but we initially ruled that one out. After a while his team suggested to disable this option - and it worked!
        
        During the debugging session I learned a lot about Azure Website troubleshooting - great stuff!

 [1]: https://melcher.it/wp-content/uploads/2016-09-07-14_33_50-Debug-Options.png
 [2]: https://melcher.it/wp-content/uploads/2016-09-07-14_37_36-Options.png

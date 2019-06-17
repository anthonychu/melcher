---
title: SharePoint App, Custom Domain and free SSL certificate
author: Max Melcher
aliases:
   - "/post/2017-03-25-sharepoint-app-custom-domain-free-ssl-certificate/"
2017: "03"
type: post
date: 2017-03-25T11:52:43+00:00
url: /2017/03/sharepoint-app-custom-domain-free-ssl-certificate/
categories:
  - Azure
  - Office 365
  - SharePoint 2013
  - SharePoint 2016
  - SharePoint Addins
  - SharePoint Online

---
Recently I created lots of SharePoint provider hosted apps for several customers - most of them very simple apps to register a remote event receiver or send emails. But a few of them were complex business apps that used the integration options for SharePoint but stood almost separately as websites running on Azure. The first apps we created had the name <app>.azurewebsites.net - and for some customers that looked so odd that they opened tickets and asked for confirmation if the apps are legit. And that makes perfect sense because everybody could create a website and call it superlegitcustomerapp.azurewebsite.net, right? So in this blog post I will show you how to run an app on a custom domain with a free SSL certificate.

For this article I assume that you have your SharePoint App up and running on Azure - and I assume that you have a domain to use.

## Register the custom domain on Azure

<div id="attachment_2563" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/azure-website-custom-domain.png"><img data-attachment-id="2563" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/azure-website-custom-domain/" data-orig-file="https://melcher.it/wp-content/uploads/azure-website-custom-domain.png" data-orig-size="849,281" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="azure website custom domain" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/azure-website-custom-domain-300x99.png" data-large-file="https://melcher.it/wp-content/uploads/azure-website-custom-domain.png" class="size-medium wp-image-2563" src="https://melcher.it/wp-content/uploads/azure-website-custom-domain-300x99.png" alt="" width="300" height="99" srcset="https://melcher.it/wp-content/uploads/azure-website-custom-domain-300x99.png 300w, https://melcher.it/wp-content/uploads/azure-website-custom-domain-768x254.png 768w, https://melcher.it/wp-content/uploads/azure-website-custom-domain-765x253.png 765w, https://melcher.it/wp-content/uploads/azure-website-custom-domain.png 849w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    3 easy steps to register a new hostname
  </p>
</div>

First things first - tell the azure website that it will have a new hostname to respond to. Therefore go to the azure portal, open your website and click on "custom domain". Then add your domain or subdomain that should be the new entry point of your app. Once you have done that, you need to validate the websites by adding a txt record to your nameserver with the value * mapped to .azurewebsites.net - full guide is [here][1].

<div id="attachment_2566" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/domain-validation-1.png"><img data-attachment-id="2566" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/domain-validation-2/" data-orig-file="https://melcher.it/wp-content/uploads/domain-validation-1.png" data-orig-size="659,48" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="domain validation" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/domain-validation-1-300x22.png" data-large-file="https://melcher.it/wp-content/uploads/domain-validation-1.png" class="wp-image-2566 size-medium" src="https://melcher.it/wp-content/uploads/domain-validation-1-300x22.png" alt="" width="300" height="22" srcset="https://melcher.it/wp-content/uploads/domain-validation-1-300x22.png 300w, https://melcher.it/wp-content/uploads/domain-validation-1.png 659w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    domain validation via nameserver entry. The @ symbol was not allowed, but with * it worked.
  </p>
</div>

After validation was successfully it should look like that:

<div id="attachment_2567" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/azure-hostname.png"><img data-attachment-id="2567" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/azure-hostname/" data-orig-file="https://melcher.it/wp-content/uploads/azure-hostname.png" data-orig-size="1251,469" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="azure hostname" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/azure-hostname-300x112.png" data-large-file="https://melcher.it/wp-content/uploads/azure-hostname-1024x384.png" class="size-medium wp-image-2567" src="https://melcher.it/wp-content/uploads/azure-hostname-300x112.png" alt="" width="300" height="112" srcset="https://melcher.it/wp-content/uploads/azure-hostname-300x112.png 300w, https://melcher.it/wp-content/uploads/azure-hostname-768x288.png 768w, https://melcher.it/wp-content/uploads/azure-hostname-1024x384.png 1024w, https://melcher.it/wp-content/uploads/azure-hostname-930x349.png 930w, https://melcher.it/wp-content/uploads/azure-hostname-765x287.png 765w, https://melcher.it/wp-content/uploads/azure-hostname.png 1251w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    new entry was added successfully
  </p>
</div>

For the custom domain you need at least a shared instance tier for your azure website.

## New name - new problems

Ok, now we have setup the new hostname and we can open up the site with that - but that creates some problems:

  1. The app registration (/_layouts/15/appregnew.aspx) needs to be updated
  2. The app manifest and the app points to the old site
  3. There is no SSL certificate for the new name

1 & 2 are easy solvable: Open the app in Visual Studio, change the app domain, upload it to the app store, trust it and re-add it to your sites. But if you open the new app - you will either redirect to http:// and have all you traffic sent over an encrypted connection - or you send it to https:// and will be greated by a security warning in your browser because there is no SSL certificate present for your new domain.

## Free SSL certificate

In the past I heavily used free SSL certificates from [StartCom][2] because they were trusted in all browsers and were free for 1 year - but they lost trust in google chrome and firefox recently so that is no longer an option. Not using a ssl certificate is no option at all - business apps need security and trust - therefore I needed another option, preferably free so no long discussion with customers, CSRs and all that to request a certificate for your needs. I want easy.

## Let's encrypt for the rescue

There is a really great organization that provides free SSL certificates - [Let's Encrypt][3] - and I use them for this blog with ease, too. So why not use them for my Azure websites? The let's encrypt certificates only lasts 3 months and should be renewed automatically (way better than certificates that lasts 1 year and have to be renewed **manually**&#8230;) - so there should be some sort of integration right into the azure websites for that - and there is! Thanks to the awesome work of [Simon J.K. Pedersen][4] there is a [Azure Website Extension for Let's Encrypt][5].

The installation was really straightforward for me and is [well documented here][6] - I added the extension (choose the correct version for 32 or 64bit!), register a new service principal and give it contribute permissions - open the extension site https://.scm.azurewebsites.net/letsencrypt/ and enter all the required values:

[<img data-attachment-id="2568" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/letsencryptextensionsettings/" data-orig-file="https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings.png" data-orig-size="705,633" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="LetsEncryptExtensionSettings" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings-300x269.png" data-large-file="https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings.png" class="aligncenter size-medium wp-image-2568" src="https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings-300x269.png" alt="" width="300" height="269" srcset="https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings-300x269.png 300w, https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings.png 705w" sizes="(max-width: 300px) 100vw, 300px" />][7]

Once you save it the magic happens - two webjobs will be registered that request a new certificate, register them and two weeks before expiry renew them automatically for you. Awesomesauce!

For the custom ssl certificate you need at least a basic app service plan.

## Summary

So once you have done all that you will have a nice domain for your app - giving your users trust and easy to recall entry to your business application - and all that is free with zero maintenance. And all your browsers love it, too:

<div id="attachment_2569" style="width: 248px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/chrome-secure.png"><img data-attachment-id="2569" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/chrome-secure/" data-orig-file="https://melcher.it/wp-content/uploads/chrome-secure.png" data-orig-size="238,35" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="chrome-secure" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/chrome-secure.png" data-large-file="https://melcher.it/wp-content/uploads/chrome-secure.png" class="wp-image-2569 size-full" src="https://melcher.it/wp-content/uploads/chrome-secure.png" alt="" width="238" height="35" /></a>
  
  <p class="wp-caption-text">
    trusted in Google Chrome
  </p>
</div>

<div id="attachment_2570" style="width: 310px" class="wp-caption aligncenter">
  <a href="https://melcher.it/wp-content/uploads/IE-trust.png"><img data-attachment-id="2570" data-permalink="https://melcher.it/2017/03/sharepoint-app-custom-domain-free-ssl-certificate/ie-trust/" data-orig-file="https://melcher.it/wp-content/uploads/IE-trust.png" data-orig-size="350,43" data-comments-opened="1" data-image-meta="{&quot;aperture&quot;:&quot;0&quot;,&quot;credit&quot;:&quot;&quot;,&quot;camera&quot;:&quot;&quot;,&quot;caption&quot;:&quot;&quot;,&quot;created_timestamp&quot;:&quot;0&quot;,&quot;copyright&quot;:&quot;&quot;,&quot;focal_length&quot;:&quot;0&quot;,&quot;iso&quot;:&quot;0&quot;,&quot;shutter_speed&quot;:&quot;0&quot;,&quot;title&quot;:&quot;&quot;,&quot;orientation&quot;:&quot;0&quot;}" data-image-title="IE trust" data-image-description="" data-medium-file="https://melcher.it/wp-content/uploads/IE-trust-300x37.png" data-large-file="https://melcher.it/wp-content/uploads/IE-trust.png" class="wp-image-2570 size-medium" src="https://melcher.it/wp-content/uploads/IE-trust-300x37.png" alt="" width="300" height="37" srcset="https://melcher.it/wp-content/uploads/IE-trust-300x37.png 300w, https://melcher.it/wp-content/uploads/IE-trust.png 350w" sizes="(max-width: 300px) 100vw, 300px" /></a>
  
  <p class="wp-caption-text">
    trusted in IE11
  </p>
</div>

&nbsp;

So if you create a new app - register the domain first, follow the guide above and you are good to go - the secure way: customer happy, developer happy, security guy happy! 🙂

&nbsp;

&nbsp;

&nbsp;

 [1]: https://docs.microsoft.com/en-us/azure/app-service-web/web-sites-custom-domain-name
 [2]: http://startssl.com
 [3]: https://letsencrypt.org/
 [4]: https://twitter.com/simped?lang=en
 [5]: https://github.com/sjkp/letsencrypt-siteextension
 [6]: https://github.com/sjkp/letsencrypt-siteextension/wiki/How-to-install
 [7]: https://melcher.it/wp-content/uploads/LetsEncryptExtensionSettings.png

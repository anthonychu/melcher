---
title: SharePoint CSOM and NetScaler
author: Max Melcher
aliases:
   - "/post/2015-09-24-sharepoint-csom-and-netscaler/"
2015: "09"
type: post
date: 2015-09-24T07:30:08+00:00
url: /2015/09/sharepoint-csom-and-netscaler/
yourls_shorturl:
  - http://melcher.it/s/5K
categories:
  - Development
  - SharePoint 2007
  - SharePoint 2010
  - SharePoint 2013
  - SharePoint 2016

---
I am currently preparing a test dataset for a SharePoint WebPart to see how it scales on a customer SharePoint 2010 environment. The problem I faced here was that the environment is protected by Citrix Netscaler and every CSOM call was ended with a lovely exception.

## Problem 1: SSL

The underlying connection was closed: Could not establish trust relationship for the SSL/TLS secure channel.

{{< fancybox "/wp-content/uploads/" "2015-09-23-18_24_02-ProvideTestData-Debugging-Microsoft-Visual-Studio-Administrator.png" "" "single_image" >}}

The client uses https/SSL to secure the channel (good!), but the netscaler load balancer does not provide the correct certificate (I think that could be configured, but that's not my job here&#8230;) and does a redirect to a different domain (**netscaler.**yourdomain.com) for authentication:

{{< fancybox "/wp-content/uploads/" "Netscaler-Login-‎-Microsoft-Edge.png" "" "single_image" >}}

So CSOM correctly stops - oldy but goldy, right?

## Solution 1

The following snipped accepts all certificates, valid or not. Dont use it in production code, for single use CSOM as in my case it is perfectly acceptable, right? 🙂

<pre class="lang:c# decode:true ">//Trust all certificates
System.Net.ServicePointManager.ServerCertificateValidationCallback =
((sender, certificate, chain, sslPolicyErrors) =&gt; true);</pre>

## Problem 2: NetScaler Authentication

Once the SSL challenge is accepted, we have to take care of the authentication part. I have done something similar for ADFS were you emulate the authentication (basically you grab the cookie once the authentication happened and reuse it for the SharePoint CSOM).

[Fiddler][1] quickly confirmed my assumption - after login via the citrix interface, every call uses cookies for authentication:

{{< fancybox "/wp-content/uploads/" "2015-09-23-18_39_23-Fiddler-Web-Debugger1.png" "" "single_image" >}}

On the left you can see the 302 redirect to a different domain. Once I provided the login credentials it sets 4 cookies.

## Solution 2

Now lets try to convince the CSOM to use cookies for each request:

<pre class="lang:default decode:true">ClientContext context = new ClientContext("https://intranet.yourdomain.com"); //open a new context
context.ExecutingWebRequest += context_ExecutingWebRequest; //attach to the event</pre>

Once we have the event, we need to set the cookies (maybe you need different ones depending on the configuration):

<pre class="lang:c# decode:true ">private static void context_ExecutingWebRequest(object sender, WebRequestEventArgs e)
{
  HttpWebRequest webReq = e.WebRequestExecutor.WebRequest;

  if (webReq.CookieContainer == null) //no cookies means we are not yet authenticated
  {
   webReq.CookieContainer = new CookieContainer();
   //I copied that calls from fiddler:
   //Set-Cookie: NSC_TMAA=ed2b1d8a3dafae7e50e200230cb8c781;Path=/;Domain=yourdomain.com
   //Set-Cookie: NSC_TMAS=ed2b1d8a3dafae7e50e200230cb8c781;Secure;Path=/;Domain=yourdomain.com
   //Set-Cookie: NSC_CERT=xyz;Path=/;expires=Wednesday, 09-Nov-1999 23:12:40 GMT
   //Set-Cookie: NSC_TASS=xyz;Path=/;expires=Wednesday, 09-Nov-1999 23:12:40 GMT
   //Host: 123.yourdomain.com - the (sub-)domain must match or the cookies will not be sent! 
   webReq.CookieContainer.Add(new Cookie("NSC_TMAA", "ed2b1d8a3dafae7e50e200230cb8c781", "/", "123.yourdomain.com"));
   webReq.CookieContainer.Add(new Cookie("NSC_TMAS", "ed2b1d8a3dafae7e50e200230cb8c781", "/", "123.yourdomain.com"));
   webReq.CookieContainer.Add(new Cookie("NSC_CERT", "xyz", "/", "123.yourdomain.com"));
   webReq.CookieContainer.Add(new Cookie("NSC_TASS", "xyz", "/", "123.yourdomain.com"));
  }
}</pre>

This code is then executed when "ExecuteQuery" is called - and the cookies are set once. With fiddler you can verify the cookies are used then.

The approach above of course only works for a session lifetime - after expiration of the cookies, CSOM can't connect. The code could be expanded to grab the cookies with the first call or after expiration - but for my test data single purpose code that's apparently out of scope.

## Summary

At first I thought - "well that takes me 10 Minutes to provision 1000 datasets" - took me longer 🙂

Hopefully this post saves somebody some time!

 [1]: http://www.telerik.com/fiddler

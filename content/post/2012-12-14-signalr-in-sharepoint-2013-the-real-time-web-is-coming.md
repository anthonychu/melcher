---
title: SignalR in SharePoint 2013 – the real-time web is coming!
author: Max Melcher
aliases:
   - "/post/2012-12-14-signalr-in-sharepoint-2013-the-real-time-web-is-coming/"
2012: "12"
type: post
date: 2012-12-14T23:05:31+00:00
url: /2012/12/signalr-in-sharepoint-2013-the-real-time-web-is-coming/
yourls_shorturl:
  - http://melcher.it/s/B
categories:
  - Development
  - SharePoint 2013

---
If you never heard of <a href="http://signalr.net/" target="_blank">SignalR</a> – it’s a real-time web framework for bi-directional communication between a client and server – in short: your server (here SharePoint) can notify a client that something very important happened. Let’s say you want to have Task List and a Dashboard where you can see how many tasks are open (you can watch this example <a href="http://www.youtube.com/watch?feature=player_embedded&v=U47MpOzNFgE" target="_blank">here</a> by Matt Menezes)– in real-time, without hitting F5 permanently and without having an AJAX function polling the list every second. With SignalR that’s possible and the good thing its very easy, <a href="http://www.hanselman.com/blog/AsynchronousScalableWebApplicationsWithRealtimePersistentLongrunningConnectionsWithSignalR.aspx" target="_blank">some say its magic</a>! I did a <a href="http://melcher.it/2012/05/signalr-and-sharepoint-live-download-tracking/" target="_blank">small example for visualizing downloads</a> from my SharePoint farm and IMHO it looks very cool. Things change rapidly, as I wrote this I used **Microsoft.AspNet.SignalR 1.0 Alpha 2**.

&nbsp;

**<span style="color: #ff0000;">Update 02/05/2013: SignalR has changed a lot  - I will write a blog post because the current approach is to complicated for the current SignalR version. Use at your own risk!</span>**

<span style="color: #ff0000;"><strong>Update 06/05/2013: Open Source Solution available  - I released a Codeplex project for SharePoint+SignalR. Please go to <a href="http://spsignalr.codeplex.com">http://spsignalr.codeplex.com</a> </strong></span>

&nbsp;

## SharePoint 2010 makes it tough!

You all know that SharePoint 2010 runs on .NET Framework 3.5 – yepp, its not getting better. Thing is, SignalR needs .NET Framework 4.0 or 4.5. So the easiest solution was to create a second Application Pool, select .NET Framework 4.0/4.5 and host the SignalR application there. I used a WCF Service in that application, SharePoint event receivers can call the WCF Service and voila you are in the 4.0/4.5 domain (if you are lucky without cross domain issues…).

## SharePoint 2013 doesn’t make it easier!

Then SharePoint 2013 came out – finally with .NET 4.0 runtime. I said cool, this should make it easy to host SignalR in the same domain and even in the same Application Pool as SharePoint 2013. Yepp, that’s the theory and SharePoint can sometimes make it a little bit harder than it should be (still, SharePoint 2013 is a rock star!!!).

## SignalR Hub in SharePoint 2013

When you create a SignalR application you need a hub. A hub is a class with methods you can call from the clients or externally to notify other clients. In order to communicate all clients need to register on that hub. In normal asp.net world SignalR attaches to the **App_Start** event where it registers a route **“~/signalr/hubs”** so clients know the endpoint where they can talk to SignalR hubs or get the hub description file (proxy). With this behavior you have a problem:

> There is no App_Start

_(You could modify the global.asax – but I want a deployable solution…)_

<h2 align="left">
  App_Start the SharePoint way
</h2>

<p align="left">
  The only deployable way I could imagine to call a function once the app pool spins up  - with several farm nodes – is a http handler. Wait a http handler is call very often, we need to remember this one:
</p>

<pre lang="csharp">public class SignalRModule : IHttpModule
{
public static bool IsAttached = false;
private readonly object _lock = new object();

public void Dispose()
{
//nothing to clean up.
}

public void Init(HttpApplication context)
{

//check if the routes are already attached
if (!IsAttached)
{
//lock it, could be called several times in parallel
lock (_lock)
{
//check if the call before attached.
if (!IsAttached)
{
//this is usually call in the App_Start thing from SignalR and registers the hub endpoint
RouteTable.Routes.MapHubs("/signalr/hubs");
IsAttached = true;
}
}
}
}
}</pre>

Now we need to add this module to the web.config farm wide – easiest way is the **SPWebConfigModification**  and a **Web Application feature.**

<pre lang="csharp">public override void FeatureInstalled(SPFeatureReceiverProperties properties)
{
RegisterHttpModule(properties);
}

private void RegisterHttpModule(SPFeatureReceiverProperties properties)
{
SPWebConfigModification webConfigModification = CreateWebModificationObject();

SPSecurity.RunWithElevatedPrivileges(() =&gt;
{
SPWebService contentService = SPWebService.ContentService;

contentService.WebConfigModifications.Add(webConfigModification);
contentService.Update();
contentService.ApplyWebConfigModifications();
});
}

private SPWebConfigModification CreateWebModificationObject()
{
string name = String.Format("add[@name=\"{0}\"]", typeof(SignalRModule).Name);
string xpath = "/configuration/system.webServer/modules";

SPWebConfigModification webConfigModification = new SPWebConfigModification(name, xpath);

webConfigModification.Owner = "Max Melcher";
webConfigModification.Sequence = 0;
webConfigModification.Type = SPWebConfigModification.SPWebConfigModificationType.EnsureChildNode;

/*
* to be resistent to refactoring we use reflection to identity the module,
* so in case somebody changes the class name the web.config entry will be still valid
*/
webConfigModification.Value = String.Format("", typeof(SignalRModule).Name, typeof(SignalRModule).AssemblyQualifiedName);
return webConfigModification;
}</pre>

_Note: The uninstalling method is not shown here, don’t forget it because the SPWebConfigModification remembers the changes!_

With that the route will register - only once – and we should be all set right?

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image1.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="SharePoint 2013 yellow page of death" src="http://melcher.it/wp-content/uploads/image_thumb1.png" alt="" width="244" height="173" border="0" /></a>
  
  <p class="wp-caption-text">
    SharePoint 2013 yellow page of death
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image2.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Microsoft.SharePoint.ApplicationRuntime.SPRequestModule.IsExcludedPath(String virtualPath) " src="http://melcher.it/wp-content/uploads/image_thumb2.png" alt="" width="244" height="99" border="0" /></a>
  
  <p class="wp-caption-text">
    Nasty stack trace
  </p>
</div>

> Stack trace:    at Microsoft.SharePoint.ApplicationRuntime.SPRequestModule.IsExcludedPath(String virtualPath)
> 
> at Microsoft.SharePoint.ApplicationRuntime.SPVirtualPathProvider.DirectoryExists(String virtualPath)
> 
> at System.Web.Routing.RouteCollection.GetRouteData(HttpContextBase httpContext)
> 
> at System.Web.Routing.UrlRoutingModule.PostResolveRequestCache(HttpContextBase context)
> 
> at System.Web.HttpApplication.SyncEventExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
> 
> at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)

That doesn’t sound good.

## SharePoint and the ~

SharePoint doesn’t like the tilde character. If you add a route (if you don’t, SignalR does) starting with ~, SharePoint shows the yellow page of death. The “easy” fix is to create a custom VirtualPathProvider  - I didn’t know what this class is doing before, too – and just pretend the ~ is not there:

<pre lang="csharp">public class SignalRVirtualPathProvider : VirtualPathProvider
{
public override string CombineVirtualPaths(string basePath, string relativePath)
{
return Previous.CombineVirtualPaths(basePath, relativePath);
}

public override System.Runtime.Remoting.ObjRef CreateObjRef(Type requestedType)
{
return Previous.CreateObjRef(requestedType);
}

public override bool DirectoryExists(string virtualDir)
{
//removing the evil character - otherwise the hell freezes and yeah, SharePoint.
virtualDir = virtualDir.TrimStart('~');

return Previous.DirectoryExists(virtualDir);
}

public override bool FileExists(string virtualPath)
{
return Previous.FileExists(virtualPath);
}

public override System.Web.Caching.CacheDependency GetCacheDependency(string virtualPath,
System.Collections.IEnumerable virtualPathDependencies, DateTime utcStart)
{
return Previous.GetCacheDependency(virtualPath, virtualPathDependencies, utcStart);
}

public override string GetCacheKey(string virtualPath)
{
return Previous.GetCacheKey(virtualPath);
}

public override VirtualDirectory GetDirectory(string virtualDir)
{
return Previous.GetDirectory(virtualDir);
}

public override VirtualFile GetFile(string virtualPath)
{
return Previous.GetFile(virtualPath);
}

public override string GetFileHash(string virtualPath, System.Collections.IEnumerable virtualPathDependencies)
{
return Previous.GetFileHash(virtualPath, virtualPathDependencies);
}
}</pre>

Now register this little sweety in the previously created http module – two problems solved there now:

<pre lang="csharp">public void Init(HttpApplication context)
{
//check if the routes are already attached
if (!IsAttached)
{
//lock it, could be called several times in parallel
lock (_lock)
{
//check if the call before attached.
if (!IsAttached)
{
//this is usually call in the App_Start thing from SignalR and registers the hub endpoint.
RouteTable.Routes.MapHubs("/signalr/hubs");

//register the custom VirtualPath provider that trims the starting ~ from the requested url.
HostingEnvironment.RegisterVirtualPathProvider(new SignalRVirtualPathProvider());
IsAttached = true;
}
}
}
}</pre>

Okay – that’s it. Open the hub link and finally you get the hub proxy file!

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/image3.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="SignalR hub proxy" src="http://melcher.it/wp-content/uploads/image_thumb3.png" alt="" width="244" height="173" border="0" /></a>
  
  <p class="wp-caption-text">
    SignalR hub proxy
  </p>
</div>

Does not look too spectacular but a post will follow with some demos – now that I know how it works!

## SignalR in SharePoint 2013 -  is there an easier way?!

Tell me in the comments and thanks for reading!

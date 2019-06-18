---
title: 'SPC14: Build your own REST service with WebAPI 2'
author: Max Melcher
aliases:
   - "/post/2014-03-05-spc14-build-rest-service-webapi-2/"
2014: "03"
type: post
date: 2014-03-05T20:03:36+00:00
url: /2014/03/spc14-build-rest-service-webapi-2/
yourls_shorturl:
  - http://melcher.it/s/29
categories:
  - Development
  - SharePoint 2013

---
> REST and OData are the foundation of data access in a cloud-based world. Office and SharePoint developers are well aware of the new RESTful endpoints available in SharePoint 2013 and may have already consumed some publically-available RESTful endpoints from the Internet. Many apps, however, will require their own RESTful service for accessing custom app data. In this session, we'll cover the fundamentals of creating custom RESTful services with WebAPI 2 and consuming those services in Office and SharePoint apps. Additionally, the session will present approaches for securing your custom services and accessing them across domains. Attendees will exit the session ready to build custom RESTful services for their Office and SharePoint apps.

Session “Build your own REST service with WebAPI 2” by [Scot Hillier][1] – here are my notes.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1839" alt="IMG_1839" src="http://melcher.it/wp-content/uploads/IMG_1839_thumb.jpg" width="348" height="185" border="0" />][2]

Level 400 – yes!

## REST

Client pulls data – stateless, cache indication, accessible through a url.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="IMG_1842" alt="IMG_1842" src="http://melcher.it/wp-content/uploads/IMG_1842_thumb.jpg" width="348" height="185" border="0" />][3]

## WebAPI

  1. Framework to create Restful, oData, custom http based services.
  2. Part of ASP.net MVC
  3. Stand-alone or as part of an app

## Controllers

Basic methods are mapped to http verbs, you can control this through routing:
  
/api/{controller}/{id}

## Content Negotiation

WebAPI services return what you request – xml or json.

## Demo

Scot always show many demos, like it – he showed how to create the service,

## OData

A Protocol to query data in a standardized, restful way.

## Security

  1. Use SSL
  2. Validate calling domain in CORS scenario (there is a [nuget package][4] for that).

## Summary

Scot Hillier. Solid. Will try this soon, I have a project that is perfect for that.

 [1]: https://twitter.com/ScotHillier
 [2]: http://melcher.it/wp-content/uploads/IMG_1839.jpg
 [3]: http://melcher.it/wp-content/uploads/IMG_1842.jpg
 [4]: https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Cors/

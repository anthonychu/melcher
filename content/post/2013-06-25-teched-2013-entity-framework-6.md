---
title: 'TechEd 2013: Entity Framework 6'
author: Max Melcher
aliases:
   - "/post/2013-06-25-teched-2013-entity-framework-6/"
2013: "06"
type: post
date: 2013-06-25T14:20:41+00:00
url: /2013/06/teched-2013-entity-framework-6/
yourls_shorturl:
  - http://melcher.it/s/S
categories:
  - TechEd

---
Session by Glenn Condron

Okay, this room is packed – there is some serious interest in this topic.

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="2013-06-25T15-12-21_0" alt="2013-06-25T15-12-21_0" src="http://melcher.it/wp-content/uploads/2013-06-25T15-12-21_0_thumb.jpg" width="244" height="184" border="0" />][1]

Here are my notes from the session.

<!--more-->

Glenn started with question how many used Entity Framework by now – almost everyone in the audience. Code first? A lot. Migrations? Fewer. Nuget – 50%. Most of the time he hears this question:

> What is this nugget thing?

If you don’t get the joke – follow this <a href="http://nuget.org/" target="_blank">link</a>:

Now back to the session: Entity Framework is Open Source and accepts contributions. Open Source is still an obstacle for certain enterprises – even though the code review process is the same as for internal changes. And: you get the same support and quality.

There are 3 workflows for Developers: Model First (you create the database based on a model, Database First (the database exists upfront), Code First (create database or map to existing database with code).

## What’s new?

Async for query and save: Don’t need the result right now? Do it async.
  
Connection resiliency – in other words: reconnect
  
Code-based configuration
  
Database command interception/logging – I missed the logging option in EF5.
  
Performance – always good.

Okay, then Glenn increased his pace – there are many more improvements in the new version. Check the <a href="https://entityframework.codeplex.com/" target="_blank">website</a>.

## Migrations

Migrations for Code First creates a class file with instructions how to handle migration/upgrade scenarios. You can even export the migration script to SQL. The migration even works for different versions so you can update to the latest version in one jump.

## Stored Procedure

Stored procedures have been added to EF6 – some people are very happy in the audience. Glenn created a quite extensive demo in a very short time – I got the idea and why its useful.

[<img style="background-image: none; float: none; padding-top: 0px; padding-left: 0px; margin-left: auto; display: block; padding-right: 0px; margin-right: auto; border: 0px;" title="2013-06-25T16-01-00_0" alt="2013-06-25T16-01-00_0" src="http://melcher.it/wp-content/uploads/2013-06-25T16-01-00_0_thumb.jpg" width="244" height="184" border="0" />][2]

## Async

If used appropriately it can improve your performance and salability – or kill your servers. Important: You cant use two async on the same context at the same time! If you think about it, it makes sense. If you want to use them look out for the “Async” methods.

## My evaluation

Glenn knows what he is talking about – great overview about the changes and some cool demos – and he’s even entertaining. I like the presentation style!

 [1]: http://melcher.it/wp-content/uploads/2013-06-25T15-12-21_0.jpg
 [2]: http://melcher.it/wp-content/uploads/2013-06-25T16-01-00_0.jpg

---
title: 'ShareCamp.at: TypeScript'
author: Max Melcher
aliases:
   - "/post/2013-09-07-sharecamp-typescript/"
2013: "09"
type: post
date: 2013-09-07T12:34:37+00:00
url: /2013/09/sharecamp-typescript/
yourls_shorturl:
  - http://melcher.it/s/1j
categories:
  - Development

---
Session about [TypeScript][1] and SharePoint by [Martin Groblschegg][2]

Short introduction about TypeScript

> **TypeScript** is a [free and open source][3] programming language developed by [Microsoft][4]. It is a strict superset of [JavaScript][5], and essentially adds optional static typing and class-based [object oriented programming][6] to the language. [Anders Hejlsberg][7], lead architect of [C#][8], has worked on development of TypeScript.
> 
> TypeScript extends JavaScript syntax, so any existing JavaScript programs work with TypeScript without any changes. TypeScript is designed for development of large applications and when compiled it produces JavaScript to ensure compatibility. [[1]][9]

Or in my words: It let you write manageable, typed JavaScript. Awesome.

## Tooling

Visual Studio Plugin and you get almost real-time conversation from TypeScript to JavaScript.

In order to get compiler/intellisense support for SharePoint JSOM you need the definition files for it. They are available [here][10].

Very cool is that you can debug the TypeScript code in Visual Studio – no need to understand the generated code (imho: it helps a lot). To get that you have to enable the map file generation in the plugins settings.

## Key takeaway

Compiler safety and intellisense is a great benefit for bigger projects – I think I will invest some…

 [1]: http://www.typescriptlang.org/
 [2]: http://blog.ppedv.de/author/MartinG.aspx
 [3]: http://en.wikipedia.org/wiki/Free_and_open_source
 [4]: http://en.wikipedia.org/wiki/Microsoft
 [5]: http://en.wikipedia.org/wiki/JavaScript
 [6]: http://en.wikipedia.org/wiki/Object-oriented_programming
 [7]: http://en.wikipedia.org/wiki/Anders_Hejlsberg
 [8]: http://en.wikipedia.org/wiki/C_Sharp_(programming_language)
 [9]: http://en.wikipedia.org/wiki/TypeScript
 [10]: https://github.com/borisyankov/DefinitelyTyped

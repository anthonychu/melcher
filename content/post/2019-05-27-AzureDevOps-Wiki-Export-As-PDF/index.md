---
title: "Azure DevOps: Export Wiki as PDF"
date: 2019-05-27T23:30:17+02:00
2019: "05"
author: "Max Melcher"
categories:
  - Azure DevOps
tags:
  - Wiki
  - PDF
featured: "images/AzureDevOps_WikiPDFExport.png"
featuredalt : ""
hashtags: 
  - "#azure #AzureDevOps"
---

Azure DevOps has undoubtedly a great wiki. Markdown support, copy and paste of screenshots transparently managed by git - awesome. Surprisingly, a 'export as PDF' functionality is missing so I decided to create a small tool.
<!--more-->

## AzureDevOps.WikiPDFExport

It started as a tiny proof of concept and took no longer as 1 hour to hack it together - a small, self-contained .NET Core console tool that converts a Azure DevOps wiki to a PDF. 

What would be better to showcase the functionality than to convert an [actual wiki](https://dev.azure.com/mmelcher/AzureDevOps.WikiPDFExport/_wiki/wikis/AzureDevOps.WikiPDFExport.wiki?pagePath=%2FAzureDevOps.WikiPDFExport&wikiVersion=GBwikiMaster&pageId=8) to an [PDF](export.pdf)?

## Functionality

Currently, the tool has only basic features - and maybe it stays like this forever. The feature-set is the following:

- Export all wiki pages (and sub pages) in the correct order including styles and formatting.
- Includes pictures (remote and relative urls)
- Creates PDF bookmarks to all pages for easier navigation within the PDF
- If you link to other wiki pages, the link in the PDF will work, too.
- Everything self-contained. Download the .exe file, run it, done.
- Tool can be used as part of a build, see [Build Task](https://dev.azure.com/mmelcher/AzureDevOps.WikiPDFExport/_wiki/wikis/AzureDevOps.WikiPDFExport.wiki?pagePath=%2FAzureDevOps.WikiPDFExport%2FBuild%20Task&wikiVersion=GBwikiMaster&pageId=12)
- It is fast: A wiki with 160 pages is created in less than a second.

## Open Source

I put the source code in an public Azure DevOps project:
[https://dev.azure.com/mmelcher/AzureDevOps.WikiPDFExport](https://dev.azure.com/mmelcher/AzureDevOps.WikiPDFExport)

## Download

The latest version of the tool can be downloaded [here](https://dev.azure.com/mmelcher/8036eca1-fd9e-4c0f-8bef-646b32fbda0b/_apis/git/repositories/e08d1ada-7794-4b89-a3ea-cb64a26683c3/Items?path=%2Fazuredevops-export-wiki.exe&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&download=true&resolveLfs=true&%24format=octetStream&api-version=5.0-preview.1). 
With VSCode and .NET Core 2.2 installed, you can build it by yourself, too.

## License

The tool is [MIT licensed](https://dev.azure.com/mmelcher/AzureDevOps.WikiPDFExport/_wiki/wikis/AzureDevOps.WikiPDFExport.wiki?wikiVersion=GBwikiMaster&pagePath=%2FAzureDevOps.WikiPDFExport%2FLicense&pageId=10): 

> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Thanks

I use a couple of other great open source libraries:

- [CommandLineParser](https://github.com/commandlineparser/commandline)  to parse the command line
- [MarkDig](https://github.com/lunet-io/markdig/)  to parse markdown files to HTML.
- [DinkToPdf](https://github.com/rdvojmoc/DinkToPdf)  to export HTML to PDF
- [dotnet-warp](https://github.com/Hubert-Rybak/dotnet-warp)  to release a self-contained exe file

## Closing 

Building this tiny tool was good fun and I learned a lot, again. 
I build the tool entirely with VSCode and I have to say, that was an awesome experience! So lean :)

So, go create some PDFs - but please don't PRINT them.

Thanks  
Max



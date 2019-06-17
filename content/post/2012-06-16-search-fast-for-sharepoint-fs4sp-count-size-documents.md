---
title: 'Search / FAST For SharePoint (FS4SP): Count and size of all documents'
author: Max Melcher
aliases:
   - "/post/2012-06-16-search-fast-for-sharepoint-fs4sp-count-size-documents/"
2012: "06"
type: post
date: 2012-06-16T00:00:00+00:00
draft: true
url: /?p=207
aktt_notify_twitter:
  - 'no'
categories:
  - Uncategorized

---
use WSS\_Content\_001

-"count" and "size" of all docs in your SP2010 contend DB
  
-run script against your SharePoint 2010 wss_Content&#8230;.. db
  
SELECT
  
COUNT_BIG(*) AS &#8216;Count'
  
,(SUM(CONVERT(bigint,Size))/1024) AS &#8216;Size in kbyte'
  
,((SUM(CONVERT(bigint,Size))/1024)/COUNT_BIG(*)) AS &#8216;AVG Size per Doc. in kbyte'
  
from dbo.AllDocs WITH(NOLOCK)
  
WHERE ID IN
  
(
  
SELECT tp_DocID FROM dbo.AllUserData WITH(NOLOCK)-comment this clause out if you also want include the SP systemfiles
  
)
  
AND Size is NOT NULL
  
AND Extension != &#8216;000'

-"count" and "size" of all docs in your SP2010 contend DB group by fileextension
  
-run script against your SharePoint 2010 wss_Content&#8230;.. db
  
SELECT
  
COUNT_BIG(ID) AS &#8216;Count'
  
,(SUM(CONVERT(bigint,Size))/1024) AS &#8216;Size in kbyte' -covert because of an "int" overflowrisk in a lager db
  
,Extension AS &#8216;Filetype'
  
,((SUM(CONVERT(bigint,Size))/1024)/COUNT(*)) AS &#8216;AVG Size per Doc. in kbyte'
  
from dbo.AllDocs WITH(NOLOCK)
  
WHERE ID IN
  
(
  
SELECT tp_DocID FROM dbo.AllUserData WITH(NOLOCK) -comment this clause out if you also want include the SP systemfiles
  
)
  
AND Size is NOT NULL
  
AND Extension != &#8216;000'
  
GROUP BY
  
Extension
  
ORDER BY Count_BIG(ID) DESC

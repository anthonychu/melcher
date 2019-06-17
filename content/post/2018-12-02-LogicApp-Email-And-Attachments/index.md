---
title: "Logic Apps: Monitor, Email and Attachments"
date: 2018-12-09T16:05:57+01:00
aliases:
   - "/post/2018-12-02-LogicApp-Email-And-Attachments/"
2018: "12"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Logic Apps
  - Email
  - Monitoring
  - Serverless
featured: "images/chris-liverani-552652-unsplash.jpg"
featuredalt : ""
hashtags: 
  - "#azure"
---

This will be a short one: In this post I show how to use Logic Apps to monitor a file for changes - if the file was changed, send it via email as attachment.
<!--more-->

## Scenario
I have a file that is changed periodically but unknown when. I want to be informed when the file is changed with the file as attachment. The solution should run at most 3 months and shouldn't cost me too much.

## Possible Solutions
I thought of multiple solutions, but wanted an easy, throw-away solution. Serverless? Of course. So I firstly thought of Azure Functions, but I did not want to spend too much time in developing stuff that is already available. Then I thought I should give Logic Apps a quick try - and I was amazed how fast I could solve that one.

## Logic App: Monitoring File and sending them by mail

So I quickly came up with the following:
{{< fancybox "images" "Logic Apps Designer.png" "Logic App Designer" "single_image" >}}

The Logic App is executed in the following order:

1. A recurring trigger: Repeat every 30 minutes 
2. Download the target file via http. The download needs a cookie authentication, but I could easily add that in the HTTP action. Neat!
3. Parse the http headers as json. I need the header to determine if the file has changed so I extracted the content-disposition header:
  {{< highlight json >}}
  {
    "properties": {
        "content-disposition": {
            "type": "string"
        }
    },
    "type": "object"
}
  {{< /highlight >}}
4. I download a text file from a blob storage. In the blob storage I store when the file was changed the last time (see 9.).
5. I compare the blob value with the just downloaded value 
6. If equal, do nothing
7. If changed
8. Send me an email with attachment
9. Update the text file on the blob storage


I struggled the most with sending the downloaded file as attachment, so here is the relevant part of it were I use **ContentBytes** with the bytes I got from the http request:
{{< highlight json >}}
{
  "actions": {
      "Send_an_email_2": {
          "inputs": {
              "body": {
                  "Attachments": [
                      {
                          "ContentBytes": "@outputs('HTTP')['body']['$content']",
                          "Name": "file.xlsx"
                      }
                  ],
                  "Body": "New file",
                  "Subject": "New file",
                  "To": "max@melcher.it;"
              },
              "host": {
                  "connection": {
                      "name": "@parameters('$connections')['office365']['connectionId']"
                  }
              },
              "method": "post",
              "path": "/Mail"
          },
          "runAfter": {},
          "type": "ApiConnection"
      }
  }
}
{{< /highlight >}}

## Summary
Overall I built the Logic App in approx. 60 minutes - If I'd knew how to send the attachment in the first place, even faster. But still, I automated an important task for me without a hazzle. Big like!
From the cost perspective: I use 4 built-in actions and 2 standard connection actions. I repeat every 30 Minutes, so 48 times a day. So in a month that task will cost me 0.50$: 
{{< fancybox "images" "Logic App Pricing.png" "0.50$ for a month!" "single_image" >}}

Awesome, right?

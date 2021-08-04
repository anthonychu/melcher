---
title: "Release Annotations for Azure Applications Insights on linux"
date: 2021-08-04T13:11:09+02:00
2021: "08"
author: "Max Melcher"
categories:
  - Azure
tags:
  - Application Insights
featured: "images/featured.png"
featuredalt : ""
hashtags: 
  - "#azure"
---

I use [Release Annotations](https://docs.microsoft.com/en-us/azure/azure-monitor/app/annotations) to tell [Azure Application Insights](https://docs.microsoft.com/en-us/azure/azure-monitor/app/app-insights-overview) about notable changes. In exchange Application Insights can then tell me, that e.g. my latest deployment is slower than the previous one. I got a lot of value out of this so i wanted to have that for a current deployment. <!--readmore-->
My build agent is Ubuntu-based - and the provided examples in the documentation use PowerShell scripts to annotate the deployment. 
I could obviously install powershell on my build agent, but it is just a single REST call so another dependency on the build agent was too much for me.

The following snippet shows how to use a BASH runtime to annotate a deployment:

{{< highlight bash >}}
ID=$(uuidgen)
ANNOTATIONNAME=$BUILD_BUILDNUMBER
EVENTTIME=$(printf '%(%Y-%m-%dT%H:%M:%S)T')
CATEGORY="Deployment"
RESOURCE="/subscriptions/[subscriptionid]/resourceGroups/[resourcegroup]/providers/microsoft.insights/components/[appinsightname]"

JSON_STRING=$( jq -n -c \
                  --arg id "$ID" \
                  --arg an "$ANNOTATIONNAME" \
                  --arg et "$EVENTTIME" \
                  --arg cg "$CATEGORY" \
                  '{Id: $id, AnnotationName: $an, EventTime: $et, Category: $cg}' ) 
                  
JSON_STRING=$(echo $JSON_STRING | tr '"' "'")
echo $JSON_STRING

az rest --method put --uri "$RESOURCE/Annotations?api-version=2015-05-01" --body "$JSON_STRING"
{{< /highlight >}}
</code>

There are more parameters that you can submit to Azure Application Insights, but I skipped them for now.

Just drop in a Azure CLI task:  
Script Type: Shell  
Script Location: Inline SCript  
Inline script: see above  
Script Arguments: can stay empty.

{{< fancybox "images" "featured.png" "Annotate a deployment" "single_image" >}}
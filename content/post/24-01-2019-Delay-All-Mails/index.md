---
title: "Outlook Rule ProTip: Defer all sent Mails by 1 Minute"
date: 2019-01-24T22:37:25+01:00
2019: "01"
author: "Max Melcher"
categories:
  - Outlook
  - Productivity
tags:
  - Rule
  - Ooooops
featured: "images/DelayAllOutgoingMails_small.png"
featuredalt : ""
hashtags:
  - "#outlook"
---

Have you ever sent a mail to hundreds of people because "Reply all" and send is so easy? Noticed that you forgot an attachment just right after you clicked on send? Or pressed ctrl+enter in an almost finished mail?  
With one tiny change you have at least a chance to correct your mail and send it properly.<!--more-->

## My Outlook Life-Saver

When I setup Outlook on a new PC, the very first thing I configure is to submit emails with a 1 minute delay.

To configure that rule, simply open up "Rules" in the middle of the ribbon and click on "Manage Rules and Alerts":
{{< fancybox "images" "Rules.png" "Mange Rules and Alerts" "single_image" >}}

Then click on "New Rule..." and select "Apply rule on messages I send" at the very bottom of the wizard.

{{< fancybox "images" "Rules_OnSend.png" "Apply rule on messages I send" "single_image" >}}

Afterwards click on "next" without selecting a condition - and confirm that you want the rule to be applied to all messages you send.
{{< fancybox "images" "Rules_Next.png" "No condition" "single_image" >}}

Next, check "defer delivery by a number of minutes" and configure the delay you want to have. 1 minute is fine for me.
{{< fancybox "images" "Rules_Delay_1Minute.png" "Defer mails by 1 minute" "single_image" >}}

Finally you could add an exception to this. In my case I added "except if this is marked as importance" and configured high. Meaning: If I send an email that is marked with high importance, please send it ASAP.

Then you can give the rule a name and click on "Finish". Easy.
{{< fancybox "images" "Rules_Finish.png" "Name and finish" "single_image" >}}

**Important: you have to do this setting on every PC - it does not work on mobile phones or in the web version!**. Or in Outlook's words:
{{< fancybox "images" "Rules_Warning_ClientOnly.png" "Can't be good without a warning!" "single_image" >}}

> This rule will only run when you check your email in Outlook. If Outlook isn't running, this rule won't work for email you online or from another device.

It can't be any good without a warning!

It's such a small change, but makes a big difference. Right?

Hope it helps,  
Max

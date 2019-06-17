---
title: FAST for SharePoint 2010 – Cumulative Update August 2012
author: Max Melcher
aliases:
   - "/post/2013-04-05-fast-for-sharepoint-2010-cumulative-update-august-2012/"
2013: "04"
type: post
date: 2013-04-05T11:13:19+00:00
url: /2013/04/fast-for-sharepoint-2010-cumulative-update-august-2012/
yourls_shorturl:
  - http://melcher.it/s/7
categories:
  - FAST for SharePoint
  - SharePoint 2010

---
The [Cumulative Update August 2012 for FAST Search Server for SharePoint 2010][1] is out for a while now – seems like nobody has tried this one yet. Or quality control has happened…

## Updating FAST Search

When you install a service pack or a cumulative update for FAST you have to run the setup and then you have to start a FAST powershell and start “psconfig –action p” – otherwise your search won’t work because SAM Worker process is dead.

## Cumulative Update August 2012

So what happens when you install the update? The installation went fine – I rebooted my server and then, as usually, I started the powershell to start the patch command! BAM!

<pre>PS C:\FASTSearch\installer\scripts&gt; .\psconfig.ps1 -action p
<span style="color: #ff0000;">At C:\FASTSearch\installer\scripts\include\commontasks.ps1:169 char:58
+     $hostname = ReadHostConfigurationProperty -propertyName
$script:$HOST_CONFIG_HO ...
+                                                             ~~~~~~~~
Variable reference is not valid. '$' was not followed by a valid variable name
character. Consider using ${} to delimit the name.
+ CategoryInfo          : ParserError: (:) [], ParseException
+ FullyQualifiedErrorId : InvalidVariableReference

IsPostSetupConfigured : The term 'IsPostSetupConfigured' is not recognized as
the name of a cmdlet, function, script file, or operable program. Check the
spelling of the name, or if a path was included, verify that the path is
correct and try again.
At C:\FASTSearch\installer\scripts\psconfig.ps1:670 char:17
+     $isInstalled = IsPostSetupConfigured
+                    ~~~~~~~~~~~~~~~~~~~~~
+ CategoryInfo          : ObjectNotFound: (IsPostSetupConfigured:String) [
], ParentContainsErrorRecordException
+ FullyQualifiedErrorId : CommandNotFoundException</span></pre>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/fast_cu2012_aug_patchfail.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="fast_cu2012_aug_patchfail" alt="fast_cu2012_aug_patchfail" src="http://melcher.it/wp-content/uploads/fast_cu2012_aug_patchfail_thumb.png" width="244" height="112" border="0" /></a>
  
  <p class="wp-caption-text">
    Epic quality check fail!
  </p>
</div>

Wonderful!

## Solution

At least the fix for this problem is quite simple – and the powershell error is really helpful this time.

Open the file “<FASTInstall>\installer\scripts\include\commontasks.ps1” and go to line 169. Replace **$script:$HOST\_CONFIG\_HOST_NAME** with **$script:HOST\_CONFIG\_HOST_NAME.** Save the file and then start the patch again with “psconfig –action p” in the installer\scripts folder. After patching check with **nctrl status** if the SAM Worker is alive again.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/fast_cu2012_aug_patchfix.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="fast_cu2012_aug_patchfix" alt="fast_cu2012_aug_patchfix" src="http://melcher.it/wp-content/uploads/fast_cu2012_aug_patchfix_thumb.png" width="244" height="46" border="0" /></a>
  
  <p class="wp-caption-text">
    Easy fix - just remove the $
  </p>
</div>

Still, unbelievable.

 [1]: http://support.microsoft.com/kb/2687489

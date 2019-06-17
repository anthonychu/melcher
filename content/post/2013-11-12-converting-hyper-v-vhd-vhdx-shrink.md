---
title: Converting a Hyper-V VHD to VHDX – and shrink it
author: Max Melcher
aliases:
   - "/post/2013-11-12-converting-hyper-v-vhd-vhdx-shrink/"
2013: "11"
type: post
date: 2013-11-12T09:00:36+00:00
url: /2013/11/converting-hyper-v-vhd-vhdx-shrink/
yourls_shorturl:
  - http://melcher.it/s/1n
categories:
  - ITPro

---
Yesterday I thought its time to convert my SharePoint 2010 development environment Hyper-V vhd to a new vhdx.

## Why bother?

I used my environment hosted on my lovely Lenovo W520 to develop a migration tool to convert a SP2007 environment to a SP2010 environment. Therefore I needed ~300GB free space – easy with Hyper-V. Just extend your virtual drive and you are good to go. Afterwards you can easily shrink the disk back again – at least I thought so. But, no  - the Hyper-V wizard could not shrink my virtual disk after project finish. There were unmovable files – bummer. So I thought lets delay this for until… yesterday.

## Why now?

The week before I read about the new Hyper-V Generation 2 VMs – pretty good stuff. No emulated drivers – direct access to the Hosts disk drives, sounds like a SharePoint would love it. And I migrated my work PC to Windows 8.1 – this is a requirement.

## How I finally made it?

To convert a vhd to a vhdx just open the Hyper-V Manager – open the properties of a VM, go to disk settings and click on convert. Then choose vhdx and on the very last page a location with sufficient space.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Einstellungen-fr-_SP2010-DEV2014_-auf-_R9-HV1TP-MUC__2013-11-11_22-25-30.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Open the disk settings" alt="" src="http://melcher.it/wp-content/uploads/Einstellungen-fr-_SP2010-DEV2014_-auf-_R9-HV1TP-MUC__2013-11-11_22-25-30_thumb.png" width="244" height="230" border="0" /></a>
  
  <p class="wp-caption-text">
    Open the disk settings
  </p>
</div>

&nbsp;

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Assistent-zum-Bearbeiten-virtueller-Festplatten_2013-11-11_22-25-48.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Select convert" alt="" src="http://melcher.it/wp-content/uploads/Assistent-zum-Bearbeiten-virtueller-Festplatten_2013-11-11_22-25-48_thumb.png" width="244" height="155" border="0" /></a>
  
  <p class="wp-caption-text">
    Select convert
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Assistent-zum-Bearbeiten-virtueller-Festplatten_2013-11-11_22-25-58.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="select vhdx" alt="" src="http://melcher.it/wp-content/uploads/Assistent-zum-Bearbeiten-virtueller-Festplatten_2013-11-11_22-25-58_thumb.png" width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    select vhdx
  </p>
</div>

My location was on a usb 2.0 drive – apparently I had no 300GB space left on my SSD. So the whole converting took me roughly 3 hours. Then I tried to boot the converted VM – worked. Deleted the old vhd file and copied the new vhdx back. Another 3 hours.

## Now the shrinking part, right?

Okay I thought – Windows Server 2008 R2 should be capable of this – theoretically yes. But there were unmovable files detected – defrag could not move them. I tried everything. Inside and outside of the VM, nothing worked. The explorer showed me 100GB used, 200GB free space – but still 300GB on my host’s ssd.

## SSD space is expensive!

So after some research I found a nice tool called [Paragon Partition Manager 2013][1] (apparently I do not get money from them – I am not related!). With the **free edition** I could resize my mounted vmdx – took like 10 minutes. Love it.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/SP2010-DEV2014_2013-11-12_00-21-47.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="Reclaimed 180GB precious space on my ssd" alt="" src="http://melcher.it/wp-content/uploads/SP2010-DEV2014_2013-11-12_00-21-47_thumb.png" width="244" height="203" border="0" /></a>
  
  <p class="wp-caption-text">
    Reclaimed 180GB precious space on my ssd
  </p>
</div>

## Whats next?

Tomorrow I will convert my SP2013 hosted in a Windows Server 2012 into a generation 2 VM - then I will truly see the new performance. Generation 2 is only supported with Windows Server 2012 (& R2) and Windows 8 + 8.1.

 [1]: http://www.paragon-software.com/de/home/pm-express/

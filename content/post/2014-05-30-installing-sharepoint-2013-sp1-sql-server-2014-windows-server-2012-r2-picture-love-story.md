---
title: Installing SharePoint 2013 SP1 with SQL Server 2014 on Windows Server 2012 R2 – Picture Love Story
author: Max Melcher
aliases:
   - "/post/2014-05-30-installing-sharepoint-2013-sp1-sql-server-2014-windows-server-2012-r2-picture-love-story/"
2014: "05"
type: post
date: 2014-05-30T15:38:53+00:00
url: /2014/05/installing-sharepoint-2013-sp1-sql-server-2014-windows-server-2012-r2-picture-love-story/
yourls_shorturl:
  - http://melcher.it/s/2I
categories:
  - Customization
  - Development
  - ITPro
  - SharePoint 2013

---
I am trying something new for me: This will be a huge picture post.

Today we have a bridge day in Germany and that means most of my colleagues and clients are taking the day off. Ideal time for me to replace my SharePoint installation and bring it to a new level. Why did I upgrade? Well, lets say I have a fable to try everything new out before customers asks me some questions about it –  and I kinda like shiney new stuff. Hands on, here we go.

## Requirements

In this post I show you how to install a small SharePoint 2013 Development Environment in 49 pictures - and a picture is worth a thousand words, right?

You need

  * a virtualization environment with a preconfigured Active Directory (Azure, Hyper-V, VMWare -  I show it with Hyper-V on Windows 8.1 Update 1)
  * the installation images, I got mine from my activeMSDN subscription: 
      * **Windows Server 2012 R2 with Update** (en\_windows\_server\_2012\_r2\_with\_update\_x64\_dvd_4065220.iso)
      * **SQL Server 2014** (en\_sql\_server\_2014\_enterprise\_edition\_x64\_dvd\_3932700.iso)
      * **SharePoint 2013 SP1** (en\_sharepoint\_server\_2013\_with\_sp1\_x64\_dvd\_3823428)
      * **Visual Studio 2013 with Update 2** (en\_visual\_studio\_premium\_2013\_with\_update\_2\_x86\_dvd\_4238022)
      * [**AutoSPInstaller**][1] **(version 3.96)**
  * coffee & internet or some work during the installation.

## How to "read" this post?

In this post I intentionally leave a lot out - most of this the "next next next" dialogs during setups or what I consider basic stuff. Sometimes I do not show how to get to a specific dialog - if you are stuck, please drop me a comment.

**When you open one picture, you can jump to the next one if you just click on the image. - the description is above it.**

&nbsp;

## Let’ start: Windows Server 2012 R2

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-10.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="1. Create a new VM - give it a cryptic name so only you understand whats in the box :)" src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-10_thumb.png" alt="1. Create a new VM - give it a cryptic name so only you understand whats in the box :)" width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    1. Create a new VM - give it a cryptic name so only you understand whats in the box 🙂
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-23.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="2. Generation 2 has way shorter boot times and is more performant" src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-23_thumb.png" alt="2. Generation 2 has way shorter boot times and is more performant" width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    2. Generation 2 has way shorter boot times and is more performant
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-54.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="3. Give it as much RAM as you can - I will change it later once I shut down my work VM." src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-54_thumb.png" alt="3. Give it as much RAM as you can - I will change it later once I shut down my work VM." width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    3. Give it as much RAM as you can - I will change it later once I shut down my work VM.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-59.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="4. You need some network to install those precious windows updates and tools later on" src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-23-59_thumb.png" alt="4. You need some network to install those precious windows updates and tools later on" width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    4. You need some network to install those precious windows updates and tools later on
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-24-06.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="5. Storage: 127GB is good enough, you could extend later on." src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-24-06_thumb.png" alt="5. Storage: 127GB is good enough, you could extend later on." width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    5. Storage: 127GB is good enough, you could extend later on.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-24-11.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="6. Pre-mount the Windows Server 2012 R2 image" src="http://melcher.it/wp-content/uploads/New-Virtual-Machine-Wizard_2014-05-29_11-24-11_thumb.png" alt="6. Pre-mount the Windows Server 2012 R2 image" width="244" height="185" border="0" /></a>
  
  <p class="wp-caption-text">
    6. Pre-mount the Windows Server 2012 R2 image
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Hyper-V-Manager_2014-05-29_11-24-59.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="7. Ready, steady, go! Start the machine." src="http://melcher.it/wp-content/uploads/Hyper-V-Manager_2014-05-29_11-24-59_thumb.png" alt="7. Ready, steady, go! Start the machine." width="244" height="150" border="0" /></a>
  
  <p class="wp-caption-text">
    7. Ready, steady, go! Start the machine.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Connect-to-SP2013-WIN2012R2-SQL2014-DEV2014-SP1_2014-05-29_11-38-25.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="8. Thats new with Generation 2 VMs - Full Screen, copy & paste transfer and much more." src="http://melcher.it/wp-content/uploads/Connect-to-SP2013-WIN2012R2-SQL2014-DEV2014-SP1_2014-05-29_11-38-25_thumb.png" alt="8. Thats new with Generation 2 VMs - Full Screen, copy & paste transfer and much more." width="244" height="168" border="0" /></a>
  
  <p class="wp-caption-text">
    8. Thats new with Generation 2 VMs - Full Screen, copy & paste transfer and much more.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-22.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="9. Select your language options - I always install English with German keyboard layout so I dont need to break my fingers when I type @ or \" src="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-23.png" alt="9. Select your language options - I always install English with German keyboard layout so I dont need to break my fingers when I type @ or \" width="244" height="208" border="0" /></a>
  
  <p class="wp-caption-text">
    9. Select your language options - I always install English with German keyboard layout so I dont need to break my fingers when I type @ or \
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-24.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="10. Time for the first coffee" src="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-25.png" alt="10. Time for the first coffee" width="244" height="208" border="0" /></a>
  
  <p class="wp-caption-text">
    10. Time for the first coffee
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-3.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="11. I always use pass@word1 as password - don't tell anyone!" src="http://melcher.it/wp-content/uploads/SP2013-WIN2012R2-SQL2014-DEV2014-SP1-on-R9-HV1TP-MUC-Virtual-Machine-Connectio_2014-05-29_11-31.png" alt="11. I always use pass@word1 as password - don't tell anyone!" width="244" height="208" border="0" /></a>
  
  <p class="wp-caption-text">
    11. I always use pass@word1 as password - don't tell anyone!
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-36-18.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="12. Network settings - I disable IPv6 because it complicates things for me." src="http://melcher.it/wp-content/uploads/2014-05-29_11-36-18_thumb.png" alt="12. Network settings - I disable IPv6 because it complicates things for me." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    12. Network settings - I disable IPv6 because it complicates things for me.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-36-27.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="13. With this IP my Internet Connection Sharing does always work - DNS is my Active Directory Server." src="http://melcher.it/wp-content/uploads/2014-05-29_11-36-27_thumb.png" alt="13. With this IP my Internet Connection Sharing does always work - DNS is my Active Directory Server." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    13. With this IP my Internet Connection Sharing does always work - DNS is my Active Directory Server.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-36-47.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="14. Time for the domain join and a decent name. Lets call the server sp2013-2." src="http://melcher.it/wp-content/uploads/2014-05-29_11-36-47_thumb.png" alt="14. Time for the domain join and a decent name. Lets call the server sp2013-2." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    14. Time for the domain join and a decent name. Lets call the server sp2013-2.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-37-15.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="16. Lets try to join my domain &quot;demo.com&quot;" src="http://melcher.it/wp-content/uploads/2014-05-29_11-37-15_thumb.png" alt="16. Lets try to join my domain &quot;demo.com&quot;" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    16. Lets try to join my domain "demo.com"
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-37-27.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="17. A prompt is always a good sign here. Enter Domain Admin credentials." src="http://melcher.it/wp-content/uploads/2014-05-29_11-37-27_thumb.png" alt="17. A prompt is always a good sign here. Enter Domain Admin credentials." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    17. A prompt is always a good sign here. Enter Domain Admin credentials.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-37-34.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="18. Yes! It worked." src="http://melcher.it/wp-content/uploads/2014-05-29_11-37-34_thumb.png" alt="18. Yes! It worked." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    18. Yes! It worked.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_11-40-04.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="19. Important: Configure Windows Udpates. Because I frequently present, I dont want the updates to be downloaded or installed when I dont want it. Cell usage is quite costly, please ask dear windows!" src="http://melcher.it/wp-content/uploads/2014-05-29_11-40-04_thumb.png" alt="19. Important: Configure Windows Udpates. Because I frequently present, I dont want the updates to be downloaded or installed when I dont want it. Cell usage is quite costly, please ask dear windows!" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    19. Important: Configure Windows Udpates. Because I frequently present, I dont want the updates to be downloaded or installed when I dont want it. Cell usage is quite costly, please ask dear windows!
  </p>
</div>

## Install SQL Server 2014

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-15-36.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="20: Time for SQL Server 2014" src="http://melcher.it/wp-content/uploads/2014-05-29_12-15-36_thumb.png" alt="20: Time for SQL Server 2014" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    20: Time for SQL Server 2014
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-17-30.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="21: Select what you need - for me only 3 checks. Database Engine is obvious." src="http://melcher.it/wp-content/uploads/2014-05-29_12-17-30_thumb.png" alt="21: Select what you need - for me only 3 checks. Database Engine is obvious." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    21: Select what you need - for me only 3 checks. Database Engine is obvious.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-17-37.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="22: Management Studio is important, too." src="http://melcher.it/wp-content/uploads/2014-05-29_12-17-37_thumb.png" alt="22: Management Studio is important, too." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    22: Management Studio is important, too.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-18-03.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="23. Lets install - next next next, oh dear!" src="http://melcher.it/wp-content/uploads/2014-05-29_12-18-03_thumb.png" alt="23. Lets install - next next next, oh dear!" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    23. Lets install - next next next, oh dear!
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-18-27.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="24. Open server manager, top right go to &quot;Add Roles and Features&quot;" src="http://melcher.it/wp-content/uploads/2014-05-29_12-18-27_thumb.png" alt="24. Open server manager, top right go to &quot;Add Roles and Features&quot;" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    24. Open server manager, top right go to "Add Roles and Features"
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-18-56.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="25. Add .NET 3.5 and hit next" src="http://melcher.it/wp-content/uploads/2014-05-29_12-18-56_thumb.png" alt="25. Add .NET 3.5 and hit next" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    25. Add .NET 3.5 and hit next
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-28-37.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="26. I always add a named instance, lets call it SharePoint." src="http://melcher.it/wp-content/uploads/2014-05-29_12-28-37_thumb.png" alt="26. I always add a named instance, lets call it SharePoint." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    26. I always add a named instance, lets call it SharePoint.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-29-56.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="27. Add some users with admin privileges." src="http://melcher.it/wp-content/uploads/2014-05-29_12-29-56_thumb.png" alt="27. Add some users with admin privileges." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    27. Add some users with admin privileges.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-34-06.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="28. Press next and wait until this screen appears. Coffee?" src="http://melcher.it/wp-content/uploads/2014-05-29_12-34-06_thumb.png" alt="28. Press next and wait until this screen appears. Coffee?" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    28. Press next and wait until this screen appears. Coffee?
  </p>
</div>

## Installing SharePoint 2013 SP1

Please note: you need bundled SP1 to install on Windows Server 2012 R2.

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_17-46-33.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="29. Finally - the base is set, lets install SharePoint 2013 SP1." src="http://melcher.it/wp-content/uploads/2014-05-30_17-46-33_thumb.png" alt="29. Finally - the base is set, lets install SharePoint 2013 SP1." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    29. Finally - the base is set, lets install SharePoint 2013 SP1.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_12-35-27.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="30. I install the PreReqs manually with the GUI - am I old school or what?" src="http://melcher.it/wp-content/uploads/2014-05-29_12-35-27_thumb.png" alt="30. I install the PreReqs manually with the GUI - am I old school or what?" width="244" height="153" border="0" /></a>
  
  <p class="wp-caption-text">
    30. I install the PreReqs manually with the GUI - am I old school or what?
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/D__AutoSPInstaller_SP_AutoSPInstaller_AutoSPInstallerInput.xml-Notepad_2014-05-29_18-46-47.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="31. Then I configure my AutoSPInstaller File with everything I need: From Search to BCS - with a single WebApp that contains everything (Best Practice)" src="http://melcher.it/wp-content/uploads/D__AutoSPInstaller_SP_AutoSPInstaller_AutoSPInstallerInput.xml-Notepad_2014-05-29_18-46-47_thu.png" alt="31. Then I configure my AutoSPInstaller File with everything I need: From Search to BCS - with a single WebApp that contains everything (Best Practice)" width="244" height="134" border="0" /></a>
  
  <p class="wp-caption-text">
    31. Then I configure my AutoSPInstaller File with everything I need: From Search to BCS - with a single WebApp that contains everything (Best Practice)
  </p>
</div>

You can grab my config file here: [AutoSPInstallerInput.xml][2] (just rename the extension and drop it to the AutoSPInstaller SP Folder)

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_18-47-02.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="32. Copy the binaries to the SharePoint 2013 folder inside the AutoSPInstaller dir" src="http://melcher.it/wp-content/uploads/2014-05-29_18-47-02_thumb.png" alt="32. Copy the binaries to the SharePoint 2013 folder inside the AutoSPInstaller dir" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    32. Copy the binaries to the SharePoint 2013 folder inside the AutoSPInstaller dir
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <img title="33. The farm user needs some rights - my user is called spfarm" src="http://melcher.it/wp-content/uploads/2014-05-29_19-01-54_thumb.png" alt="33. The farm user needs some rights - my user is called spfarm" width="244" height="184" border="0" />
  
  <p class="wp-caption-text">
    33. The farm user needs some rights - my user is called spfarm
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <img title="34. Give it DB Creator and Security Admin rights." src="http://melcher.it/wp-content/uploads/2014-05-29_19-02-19_thumb.png" alt="34. Give it DB Creator and Security Admin rights." width="244" height="184" border="0" />
  
  <p class="wp-caption-text">
    34. Give it DB Creator and Security Admin rights.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_18-47-59.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="35. Hit play or better start the magic AutoSPInstallerLaunch.bat" src="http://melcher.it/wp-content/uploads/2014-05-29_18-47-59_thumb.png" alt="35. Hit play or better start the magic AutoSPInstallerLaunch.bat" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    35. Hit play or better start the magic AutoSPInstallerLaunch.bat
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_19-03-49.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="36. Green lines are good lines" src="http://melcher.it/wp-content/uploads/2014-05-29_19-03-49_thumb.png" alt="36. Green lines are good lines" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    36. Green lines are good lines
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_19-13-44.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="37. At least no red lines, right?" src="http://melcher.it/wp-content/uploads/2014-05-29_19-13-44_thumb.png" alt="37. At least no red lines, right?" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    37. At least no red lines, right?
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_19-10-02.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="38. A familiar window" src="http://melcher.it/wp-content/uploads/2014-05-29_19-10-02_thumb.png" alt="38. A familiar window" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    38. A familiar window
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_19-12-10.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="39. Some progress - coffee?" src="http://melcher.it/wp-content/uploads/2014-05-29_19-12-10_thumb.png" alt="39. Some progress - coffee?" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    39. Some progress - coffee?
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_18-49-24.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="40. Green green green." src="http://melcher.it/wp-content/uploads/2014-05-29_18-49-24_thumb.png" alt="40. Green green green." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    40. Green green green.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-29_20-39-39.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="41. Creating web apps, service applications, site collections, configuration - this tool is soooo impressive." src="http://melcher.it/wp-content/uploads/2014-05-29_20-39-39_thumb.png" alt="41. Creating web apps, service applications, site collections, configuration - this tool is soooo impressive." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    41. Creating web apps, service applications, site collections, configuration - this tool is soooo impressive.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_12-44-30.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="42. Voila - Central Admin opens, no red health issue thing." src="http://melcher.it/wp-content/uploads/2014-05-30_12-44-30_thumb.png" alt="42. Voila - Central Admin opens, no red health issue thingy." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    42. Voila - Central Admin opens, no red health issue thingy.
  </p>
</div>

## Install Visual Studio 2013 with Update 2

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_14-12-04.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="43. Installing Visual Studio is so easy, I skip the screenshots. Hit next next next." src="http://melcher.it/wp-content/uploads/2014-05-30_14-12-04_thumb.png" alt="43. Installing Visual Studio is so easy, I skip the screenshots. Hit next next next." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    43. Installing Visual Studio is so easy, I skip the screenshots. Hit next next next.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_13-54-56.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="44. There we go." src="http://melcher.it/wp-content/uploads/2014-05-30_13-54-56_thumb.png" alt="44. There we go." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    44. There we go.
  </p>
</div>

## Install the tools

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/Chocolatey-Gallery_2014-05-30_12-44-52.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="45. Installing 10 SharePoint must have tools - chocolatey is the answer!" src="http://melcher.it/wp-content/uploads/Chocolatey-Gallery_2014-05-30_12-44-52_thumb.png" alt="45. Installing 10 SharePoint must have tools - chocolatey is the answer!" width="244" height="192" border="0" /></a>
  
  <p class="wp-caption-text">
    45. Installing 10 SharePoint must have tools - chocolatey is the answer!
  </p>
</div>

Go to http://chocolatey.org to get the package manager to install other tools. Read this [post][3] for more info. Then open a new PowerShell and copy this into it:

> cinst 7zip cksdev11 dotPeek gitextensions GoogleChrome notepadplusplus SearchQueryTool SharePoint.HiveShortcut.Desktop SharePoint.HiveShortcut.Explorer SharePointManager2013 SPCAF SPSF ulsviewer cksdev2012

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_12-45-11.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="46: Chocolatey - sweet!" src="http://melcher.it/wp-content/uploads/2014-05-30_12-45-11_thumb.png" alt="46: Chocolatey - sweet!" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    46: Chocolatey - sweet!
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_13-53-53.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="47: Go go go!" src="http://melcher.it/wp-content/uploads/2014-05-30_13-53-53_thumb.png" alt="47: Go go go!" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    47: Go go go!
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_14-26-22.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="48: Green lines indicate new SharePoint Tools installed." src="http://melcher.it/wp-content/uploads/2014-05-30_14-26-22_thumb.png" alt="48: Green lines indicate new SharePoint Tools installed." width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    48: Green lines indicate new SharePoint Tools installed.
  </p>
</div>

<div style="width: 254px" class="wp-caption alignnone">
  <a class="thickbox" href="http://melcher.it/wp-content/uploads/2014-05-30_14-28-05.png"><img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="49: Voila, tools installed - actual work can start now!" src="http://melcher.it/wp-content/uploads/2014-05-30_14-28-05_thumb.png" alt="49: Voila, tools installed - actual work can start now!" width="244" height="184" border="0" /></a>
  
  <p class="wp-caption-text">
    49: Voila, tools installed - actual work can start now!
  </p>
</div>

## Closing thoughts

Well, writing and preparing this blog post took longer than the actual installation - AutoSPInstaller did a decent job, installing my “baseline” SharePoint Toolbox with chocolatey is easy - welcome brave new world! If I could focus on this 100% full time, I think I can install everything in roughly 2 hours, not bad, right?

To be honest, not everything worked like a charm during this setup - how could it? I did not prepare a thing: I had to run autospinstaller like 10 times to install SharePoint - but everytime I forgot a value and the tool was so nice to tell me what was missing - but you can always restart the tool and it continues, awesome! Additionally some of the chocolatey packages failed during install - I will try to fix some of them (you cant complain cause the tools are free, right?). There is room for improvement here.

But to close this post, installing everything from scratch was good fun!

Do you like the style of the picture post? If so, **please leave a comment**!

 [1]: https://autospinstaller.codeplex.com/
 [2]: http://melcher.it/wp-content/uploads/AutoSPInstallerInput.xml_.txt
 [3]: http://melcher.it/2012/11/get-all-your-sharepoint-tools-installed-in-20-minutes/

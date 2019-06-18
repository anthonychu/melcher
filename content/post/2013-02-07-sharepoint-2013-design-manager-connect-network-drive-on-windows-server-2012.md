---
title: 'SharePoint 2013 Design Manager: Map network drive on Windows Server 2012'
author: Max Melcher
aliases:
   - "/post/2013-02-07-sharepoint-2013-design-manager-connect-network-drive-on-windows-server-2012/"
2013: "02"
type: post
date: 2013-02-07T14:41:05+00:00
url: /2013/02/sharepoint-2013-design-manager-connect-network-drive-on-windows-server-2012/
yourls_shorturl:
  - http://melcher.it/s/d
categories:
  - SharePoint 2013
  - Windows Server 2012

---
So the best way to adjust and edit MasterPages and DisplayTemplates in SharePoint 2013 is to map a network drive and edit the files directly there or copy them to this location.

If your SharePoint is hosted on Windows Server 2012 this does not work without configuration – I am really surprised that the config wizard or the PreRequisite Installer does not add the required service – but lets just focus on the solution.

## Solution

Open the Server Manager.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb5.png" width="244" height="161" border="0" />][1]

Click next until “Features”.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb6.png" width="244" height="160" border="0" />][2]

Expand the greyed-out “User Interfaces and Infrastructure”, check the Desktop Experience entry _(I took the screenshot after installing it)._

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb7.png" width="244" height="158" border="0" />][3]

Click next and install the feature. Then you have to reboot the Server.

After the reboot open the Service Manager (services.msc) and start the WebClient service – and if you want set it to automatic start so it works after the next reboot.

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; margin: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb8.png" width="244" height="192" border="0" />][4]

After this open an explorer and try to connect to [\\<hostname>\_catalogs\][5] and the result should look like this:

[<img style="background-image: none; padding-top: 0px; padding-left: 0px; display: inline; padding-right: 0px; border: 0px;" title="image" alt="image" src="http://melcher.it/wp-content/uploads/image_thumb9.png" width="244" height="188" border="0" />][6]

 [1]: http://melcher.it/wp-content/uploads/image5.png
 [2]: http://melcher.it/wp-content/uploads/image6.png
 [3]: http://melcher.it/wp-content/uploads/image7.png
 [4]: http://melcher.it/wp-content/uploads/image8.png
 [5]: file://\\<hostname>\_catalogs\masterpage\Display
 [6]: http://melcher.it/wp-content/uploads/image9.png

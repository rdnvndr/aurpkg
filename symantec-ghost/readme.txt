===============================================================
Symantec Ghost Solution Suite 2.5                    README.TXT
Copyright © 2008 Symantec Corporation. All rights reserved.
Symantec, the Symantec logo, Symantec Ghost, Ghost Walker, 
Ghost Explorer, GDisk, GhostCast, and OmniFS are trademarks or 
registered trademarks of Symantec Corporation or its affiliates
in the U.S. and other countries. Other names may be trademarks 
of their respective owners. 
The Licensed Software and Documentation are deemed to be 
"commercial computer software" and "commercial computer 
software documentation" as defined in FAR Sections 
12.212 and DFARS Section 227.7202.

                                                 24 April 2008
===============================================================
Symantec Ghost 11.5 Release Notes
===============================================================

 This file covers contents of the installation CD,
 licensing, late-breaking news, and references other 
 related information. The following topics are discussed:

  1. Additional Information and Errata
  2. Known issues
  3. Technical support details
  4. Reporting problems to Technical Support



==============================================================
  1. Additional Information and Errata
==============================================================


Extra installation requirements
-------------------------------

* MSXML6 needs to be installed on the server in order to use
  Ghost Boot Wizard with WinPE.
* The Ghost Console needs to be installed on an NTFS volume in
  order to support WinPE and remote client install.

Changes to virtual partition process
------------------------------------

The Virtual Partition is now reverted at startup. If a Clone 
task fails, do not attempt to restart the computer, as this will
result in trying to boot to an incomplete OS. This applies to 
WinPE only. If you are using DOS the Virtual Partition is still
persisted. 

When you run a task within the Ghost boot partition, any data
added to the Ghost boot partition during the previous task will
be removed. 

When using the WinPE PreOS in a virtual partition, rebooting
the client computer manually will always try to return to the
target operating system -- ghreboot is not required.

WinPE support
-------------

Symantec supports only the version of WinPE that is supplied 
with the product. Other versions of WinPE are not officially 
supported.



===============================================================
  2. Known Issues
===============================================================


Symantec Ghost Console
----------------------


GhostCast progress does not display correctly when sending VMDK images
----------------------------------------------------------------------

When you restore a VMDK image from Ghostcast server, the progress bar 
does not reflect the true status of the operation. The progress bar 
stops at about 80%, but the operation has finished successfully. 


DBPatch Failure
---------------

DBPatch produces a log file, DBUpdateLog.txt, that is stored in 
the installation directory. This file contains records of the 
major database upgrade steps and, in case of error, the possible 
error source. The upgrade process also preserves a backup copy
of the database in the All Users/Application Data/Symantec folder. 
This contains the credentials that are required to restore the 
database to the previous version. 
Contact Symantec Technical Support for further assistance. 


Ghost Console Service account credentials
-----------------------------------------
If you install the Ghost Console on a computer with a 
computer name that has more than 15 characters then you cannot 
add the service account when you add a supported domain. The 
following message is displayed:
The specified username is invalid.
Error code: 2147944602
Operation failed 

The work around for this error is to edit the Console service 
account user name and password and ensure that they are
15 characters or less.


Incremental backup of Symantec AntiVirus 10.0.2
-----------------------------------------------
An incremental backup of a computer installed with Symantec
AntiVirus 10.0.2 fails to restore Symantec AntiVirus
successfully. 
The backup is successful, but on the client the following error is
displayed:
Symantec AntiVirus Auto-Protect failed to load.

The workaround for this problem is to repair the installation
of Symantec AntiVirus after restoring the backup.


Client computer with multiple network cards
-------------------------------------------
A Console task fails in the following situation:

The client is installed on a client computer with a network 
card. You unplug the network card and plug in a second network
card. After executing a Configuration Refresh, the last known
machine configuration displays the correct network card.
However, on the Properties dialog box, the Network Settings
when using Virtual Partition field shows the original card. 
A Console task using DOS as a PreOS in the Ghost boot partition
will fail, as it looks for the incorrect card. On the client
computer, you can see the following message:
Client polling for server
This indicates that the client can't connect to the server.
This scenario occurs only when the network cards use different
drivers.

Workaround: Remove the client computer from the Console and
let the Console redetect the client computer. Alternatively,
you could use the UNDI driver.

A task run from DOS fails in the following situation:

If you have two network cards in a client computer that use
the same driver then the client might not be able to connect
to the server.
On the client computer, you can see the following message:
Client polling for bound server

Workaround: Halt the task and use Ghreboot to restart the computer
back into Windows. Use the UNDI driver to run the task.


Joining a Vista computer to a domain
------------------------------------
An error occurs with the following operation:
You clone a Vista computer using an image that has been prepared
with Sysprep and apply configuration changes including joining
the computer to a domain. The following error displays on the
client computer:
Windows can't complete the installation  

Workaround: Join the computer to a domain using a different
task after the clone task.


Running a configuration refresh
-------------------------------
If you run an image restore task that includes a configuration
refresh step and the image has been prepared with Sysprep, 
then the client IP address and subnet mask are reported 
incorrectly as 0.0.0.0. 
Do not include a refresh step in a task if the image in the 
restore has been prepared with Sysprep.

Workaround: Run the refresh step in a separate task after the
restore image task.


Failure to create VMDK from console
-----------------------------------

If you are running Windows XP, you may experience problems creating 
an image from a client in VMDK format. The workaround is to repeat the 
operation, or to create the image in GHO format and subsequently 
convert it to a VMDK.


Client inventory
----------------

win32_product
-------------
Windows Server 2003 and Windows XP x64 do not install 
win32_product. 
Therefore, Symantec Ghost cannot collect the Application Product
information using the Inventory feature of the Symantec Ghost
Console on the following computers:
* Computers that are installed with Windows Server 2003
* Computers that are installed with Windows XP x64


Preserved files on Vista computers
----------------------------------
Sometimes Windows Explorer in Vista does not show the correct
name for folders that were preserved and renamed from a Vista
partition after a clone task. This problem occurs if the
renamed folder contains a copy of desktop.ini. 

Workaround: Find and delete the hidden file named desktop.ini 
inside the affected folders. Windows Explorer should then
correctly display the folder name.


Applying Novell switches on a Vista client
------------------------------------------

If you run a configuration task that includes Novell client 
settings on a Vista Novell client, the task apparently runs 
successfully, but the new credentials are not displayed after 
a reboot. 


VMWare computers
----------------
Using a Mapped Network Boot Package made with PC-DOS and the 
UNDI driver can cause the following error:
Network drive no longer exists reading drive <drive>

The work-around for this problem is to use MS-DOS under VMWare,
or use a custom network driver.

Linux boot packages on VMWare computers
---------------------------------------

Linux boot packages will not work on VMWare machines which use 
a LSI drive that requires the Fusion Passing Technology (MPT) 
driver. This depends on the hardware profile selected in VMWare.


Creating Virtual Partition boot packages with USB support
---------------------------------------------------------
Using Ghost Boot Wizard to create 1-click Virtual Partition with 
USB Support does not work for DOS. Using WinPE as the PreOS works
correctly. 


Ghost disk layout switch
------------------------
By default, Symantec Ghost informs the operating system about 
the disk layout after a clone operation. However, this might
cause the crc files created by Symantec Ghost to return a false
result, i.e. that the disks are not identical when they are 
identical.
For example, after an image-to-disk restore, a crc32 verify
operation might return an inaccurate crc result because WinPE
could change the destination file systems on the drive.

In a disk-to-disk copy operation under WinPE, the source disk
remains mounted by Windows. Therefore a CRC create on the source
disk and then a verify on the destination disk may return an
inaccurate crc result because WinPE could change the source drive. 
The -noOsLayout switch will prevent Ghost from updating the 
operating system with the destination disk changes. However
the source is still mounted by Windows and therefore the
CRC value may change due to system file changes by Windows.

If the source image and destination disk have similar 
partition layouts, then to ensure the crc checks do not give
false negatives, it is also advisable to use GDisk32 to 
delete all existing partitions on the destination disk. 
This prevents the operating system from mounting a file system
driver once the clone is complete. This can happen on
similarly partitioned disks even when you use the 
-noOsLayout switch.

Peer-to-peer Ghost operation with preserve switch
-------------------------------------------------
Error Number: 672
Message: Ghost could not locate or lock the volume containing preserved
file/directory.

This error is displayed when using Ghost in peer-to-peer TCP mode with
the -preserve switch. 

Symantec Ghost does not support the preserve file feature in a
peer-to-peer operation.


Ghost32 error 29005
-------------------
If you restore an image to a disk configured as a dynamic disk
with a single simple volume on it on a Windows Vista 
computer then Ghost32 fails with the following error:
write sector failure 29005

Workaround: In Disk Manager, convert the disk to an mbr disk
and then restore the image.


Formatting a partition in GDisk or GDisk32
-----------------------------------------
If you create a partition and formatting it as NTFS in GDisk or
GDisk32, the format is quick regardless of whether or not the
/q switch is used.


User Migration
--------------

Migrating Word 2003 to Word 2007
--------------------------------
Settings stored in Normal.dot for Microsoft Word 2003 
cannot be migrated to Microsoft Word 2007. This is due to
file format changes.
Therefore many settings cannot be migrated from Word 2003
to Word 2007.


Changing the Symantec Ghost database account and password
---------------------------------------------------------
The Symantec Ghost Implementation Guide details how to change 
the Symantec Ghost database account and password using a script.
However, the script in the Guide is not accurate. Following is 
the correct script:

' This script allows the user to get and also reset the Ghost Console's
' database account and password by using the scripting API to the Ghost
' Configuration Server service.
'
' It can be used three ways:

' - with no arguments, it retrieves the current user account name and
'   password used by the Ghost Console to access the configuration database.
' - with one argument, it sets the password for the user account used by
'   the Ghost Console to access the configuration database
' - with two arguments, the first being the string "dba", it will allow
'   a password to be set for the built-in DBA user account that some
'   existing users may have code that depends on. In Ghost Solution Suite
'   1.1 and above, this user account is disabled at installation time for
'   additional security; running this script allows it to be re-enabled.


<job id="PasswordUtility">
<script language="VBScript">
  ' Access the Configuration Server service's root COM scripting object

  set server = CreateObject("ConfigServer.Application")

  ' Get the database configuration object from the configuration server

  set dbInfo = server.ConfigDatabase

  ' Obtain the current database username and password
  user = dbInfo.Username
  pass = dbinfo.Password

  set args = WScript.Arguments

  if args.Count = 0 then
    WScript.Echo "User: " & user
    WScript.Echo "Password: " & pass
  elseif args.Count = 1 then
    pass = args.item(0)
    call dbInfo.SetCredentials (user, pass)
    WScript.Echo "User: " & user
    WScript.Echo "Password set to: " & pass
  elseif args.count = 2 and args.item(0) = "dba" then
    pass = args.item(1)
    call dbInfo.SetCredentials ("dba", pass)
    WScript.Echo "DBA Password set to: " & pass
  end if

</script>
</job>


Limitation on using the /putuser switch in command-line mode
------------------------------------------------------------

When using the command-line mode of SUM Wizard, you cannot use
the /putuser switch to restore a user from the migration package
into a user which has never logged into that computer.


Trialware
---------
You can not install the trialware version of Ghost over any
other version of Ghost, or install any version of Ghost over 
the trialware version. In all cases uninstall the currently 
installed product first.

If you have created an image of a computer with the trialware
client installed, you must first uninstall the trialware client before 
installing the licensed version of Symantec Ghost client.  
This is because in some situations the trialware Ghost.exe
remains on the client computer.


Symantec DeployCenter
--------------------
For all Symantec DeployCenter issues please see the 
DeployCenter readme, which is included in Symantec Ghost 
Solution Suite.

===============================================================
  3. Technical support details
===============================================================
 Symantec corporation maintains a comprehensive Technical 
 Support Web site for Ghost at:
 
 http://www.symantec.com/business/support/overview.jsp?pid=52023
 
 You can also contact our Technical Support department by phone.
 See the Ghost manual for the telephone numbers and an 
 explanation of your phone support options.  The telephone
 numbers can also be found online.  
 

===============================================================
  4. Reporting problems to Technical Support
===============================================================
  When contacting technical support, make sure you have included
  the following information:

  - Your name and contact details.
  - The Ghost Abort error log file if available. The Ghost
    Abort error log file is generated in the current folder and
    is named Ghosterr.txt. If this location is read-only, the
    -afile=filename command line switch can be used to alter
    the abort files output location.
  - The version number of the Ghost application and associated
    Ghost Utility in use.
  - The Abort text displayed.
  - The Abort Error Number displayed.
  - Whether or not you can reproduce the problem.
  - A description of the problem.
  - A description of what operation is being performed.

===============================================================
                                END OF FILE
===============================================================






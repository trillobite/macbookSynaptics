#Touchpad driver for the macbook 3,1.

Improvements will be made as issues and solutions are discovered.

I recently ran into a problem with the synaptics touchpad driver on the MacBook 3.1, the cursor appeared to basically draw squares as the cursor went across the screen. Through my search, the only solution was to compile a new driver with sepecific settings. Luckily for me I found a forum post where there are those who were taking the same approach a few years ago. Even through this forum post is dated, it was still possible to produce my own new driver specifically for ubuntu 14.04. I hope you enjoy it, as I do.

Recent improvements drastically enhance the mouse cursor movements and accuracy. The sacrifice is, it appears it is not possible to run circular scrolling with the current setup. If you still want circular scrolling and can sacrifice some accuracy of the mouse cursor delete appletouch.c, and rename "appletouch.c.bak" to "appletouch.c" [no quotes].

If you found this driver, you must be completely desperate to make your touchpad work properly under ubuntu 14.04. Luckily, this will help you out.

Note: Please do not use this driver on mission critical systems. The driver, repository, and instructions were originally designed for my own personal use. The use of this driver should be regarded as simply, a learning experience or experimentation. If the driver works for you, that is excellent, just be aware that I am not a developer of the Ubuntu team, and there may be some unintended conflicts with other drivers if I did not do my work properly. Although there is no customer support, if you run into an issue, I encourage you to submit a bug report within this repository by the link on the right hand side called "Issues."

System Requirements:
MacBook 3.1
Ubuntu 14.04
Linux-headers-generic

###Easy Installation:
1.	Point your terminal into the macbookSynaptics directory after decompressing the release.

2.	type: bash install.sh

3.	enter the administrator password when prompted, and it will compile and install!

###Alternate Terminal Installation Instructions:
http://ubuntuforums.org/showthread.php?t=813884&page=6&s=ac3e2b3e6cac6075581dadc2ecb31297
    -Go to post #56
    -Follow steps 6 - 10

1. 	unzip the zip you downloaded

2. 	open the terminal, cd macbooksynaptics

3. 	make

4. 	sudo rmmod appletouch
	sudo insmod appletouch.ko

5. 	ls /lib/modules <-- view note labeled: Note: Step 9.
	sudo mv /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch_OLD.ko

6.	sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko

7.	sudo cp 10-synaptics.conf /usr/share/X11/xorg.conf.d


	Done! Your touchpad should work better now!

Note:	Step 9: may be confusing, $(uname -r) is basically a command that simply automatically detects the latest kernel.

Note:	This does not make the touchpad work perfectly, but it does improve it drastically. If you discover adjustments that drastically improve the performance of the touchpad, let me know, or make the modifications and make a fork of my project.

Note: You can always cd into the directory of the driver and use this command: sudo rmmod appletouch && sudo insmod appletouch.ko && sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko

Bug fixes:
----------

March 25, 2015
-Circular Scrolling should now be enabled! Mouse movements are smoother than ever, and Horizontal two-finger scrolling is now enabled. Coasting is still disabled do to the sensitivity of Horizontal scrolling. This project is nearing the end of it's Alpha stage, and a Beta version will soon be released.

March 23, 2015

Updates to 10-synaptics.conf settings:

-Horizontal two finger scrolling was a major issue, while scrolling vertically, the system would randomly throw a powerful scroll to the right or left. This issue has been reduced, but has not been fully resolved. Best way to deal with this is to use the two finger scroll in an arched motion, rather than a precise vertical motion.

-Copy and pasting objects would sometimes throw a random scroll causing the page to flick in another direction.

March 7, 2015

-mouse cursor is now far more accurate, though the user is requried to max the mouse sensitivity in ubuntu to make it manageable.

-Two finger scrolling is now setup to operate properly automatically when the user copies the synaptics config file to the specified directory.

September 10, 2015

-Circular scrolling is now enabled once again. Horizontal scrolling issue still exists, but the problem has been reduced. If the horizontal scrolling is causing issues when you attempt to vertical scroll, try the circular scroll method to move down the page.

-I have tested this driver on ubuntu 14.04 with all of the kernel version upgrades, from the original to v3.19, with no issues.

Bugs:
-----

September 10, 2015
-A horizontal scroll may cause the window to rapid scroll to the left or right. This is actually a calculation/acceleration issue within the driver its self. When one does not perfectly touch the touchpad with two fingers, the time between the fingers touching the touchpad may cause a rapid horizontal scroll to be detected. The intensity of the accidental rapid horizontal scroll has been reduced in the most recent config settings, but it still may produce an annoyance. A temporary fix would be to use the now enabled circular scrolling method. Circular scrolling does not cause a rapid horizontal scroll to be detected. 


-The driver will not stay installed. After every kernel update, you must redo the installation process. A bash script is in the making, but is not finished, the creation of the driver its self is taking priority.

LICENSE: 
--------
NO WARRANTIES ARE EXPRESSED OR IMPLIED! USE AT YOUR OWN RISK. This project is free and open, you may copy and redistribute, but you must give me credit if you do.

The driver its self was only lightly modified by me, credit goes to the authors of the driver. My goal is to create an easy to install driver, that comes with all the required settings.

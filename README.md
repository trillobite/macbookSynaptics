This is a touchpad driver for the macbook 3,1.

Improvements will be made as issues and solutions are learned.

I recently ran into a problem with the synaptics touchpad driver on the MacBook 3.1, the cursor appeared to basically draw squares as the cursor went across the screen. Through my search, the only solution was to compile a new driver with sepecific settings. Luckily for me I found a forum post where there are those who were taking the same approach a few years ago. Even through this forum post is dated, it was still possible to produce my own new driver specifically for ubuntu 14.04. I hope you enjoy it, as I do.

Recent improvements drastically enhance the mouse cursor movements and accuracy. The sacrifice is, it appears it is not possible to run circular scrolling with the current setup. If you still want circular scrolling and can sacrifice some accuracy of the mouse cursor delete appletouch.c, and rename "appletouch.c.bak" to "appletouch.c" [no quotes].

If you found this driver, you must be completely desperate to make your touchpad work properly under ubuntu 14.04. Luckily, this will help you out.

System Requirements:
MacBook 3.1
Ubuntu 14.04
Linux-headers-generic


Installation instructions:
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

Bug fixes:
----------

March 23, 2015

Updates to 10-synaptics.conf settings:

-Horizontal two finger scrolling was a major issue, while scrolling vertically, the system would randomly throw a powerful scroll to the right or left. This issue has been reduced, but has not been fully resolved. Best way to deal with this is to use the two finger scroll in an arched motion, rather than a precise vertical motion.

-Copy and pasting objects would sometimes throw a random scroll causing the page to flick in another direction.

March 7, 2015

-mouse cursor is now far more accurate, though the user is requried to max the mouse sensitivity in ubuntu to make it manageable.

-Two finger scrolling is now setup to operate properly automatically when the user copies the synaptics config file to the specified directory.

Bugs:
-----

March 7, 2015
-Circular scrolling no longer seems to work, if you require this function, use the old appletouch.c.bak, as described above.

-The driver will not stay installed. After every kernel update, you must redo the installation process. A bash script is in the making, but is not finished, the creation of the driver its self is taking priority.

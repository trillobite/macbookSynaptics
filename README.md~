This is a touchpad driver for the macbook 3,1.

I recently ran into a problem with the synaptics touchpad driver on the MacBook 3.1, the cursor appeared to basically draw squares as the cursor went across the screen. Through my search, the only solution was to compile a new driver with sepecific settings. Luckily for me I found a forum post where there are those who were taking the same approach a few years ago. Even through this forum post is dated, it was still possible to produce my own new driver specifically for ubuntu 14.04. I hope you enjoy it, as I do.

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
	sudo mv/lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch_OLD.ko
6.	sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko

	Done! Your touchpad should work better now!

Note:	Step 9: may be confusing, you will need to actually get a list of directories within that directory, and view what folders are there, and replace $(uname -r) with the name of that folder. Command to view folder names: ls /lib/modules
	-You will use the folders labeled similar to this: 3.13.0-44-generic

Note:	This does not make the touchpad work perfectly, but it does improve it drastically. If you discover adjustments that drastically improve the performance of the touchpad, let me know, or make the modifications and make a fork of my project.

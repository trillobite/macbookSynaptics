#!/bin/sh

make

sudo rmmod appletouch 
sudo insmod appletouch.ko 
sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko
sudo cp 10-synaptics.conf /usr/share/X11/xorg.conf.d

echo "All Done."

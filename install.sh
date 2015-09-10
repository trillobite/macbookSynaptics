#!/bin/sh

make

sudo rmmod appletouch 
sudo insmod appletouch.ko 
sudo cp appletouch.ko /lib/modules/$(uname -r)/kernel/drivers/input/mouse/appletouch.ko

echo "All Done."

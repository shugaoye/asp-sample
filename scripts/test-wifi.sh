#!/bin/sh

. ~/bin/setup.sh

IMG_ROOT=~/vol1/android-6/out/target/product/x86emu

if [ -z "$1" ]; then
emulator @a23x86 -ranchu -verbose -show-kernel -system $IMG_ROOT/system.img -ramdisk $IMG_ROOT/ramdisk.img -initdata $IMG_ROOT/userdata.img -kernel $IMG_ROOT/kernel -qemu -netdev user,id=mynet1,net=10.0.2.0/24,dhcpstart=10.0.2.50 -device virtio-net,netdev=mynet1
else
emulator @a23x86 -ranchu -verbose -show-kernel -system $IMG_ROOT/system.img -ramdisk $IMG_ROOT/ramdisk.img -initdata $IMG_ROOT/userdata.img -kernel $IMG_ROOT/kernel
fi



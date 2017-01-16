#!/bin/sh

. ~/bin/setup.sh

if [ -z "$1" ]; then
  EMULATOR1=emulator
else
  EMULATOR1="/opt/VirtualGL/bin/vglrun emulator"
fi

if [ -z "$OUT" ]; then
  IMG_ROOT=.
else
  IMG_ROOT=$OUT
fi

$EMULATOR1 @a25x86 -ranchu -verbose -show-kernel -accel off -shell -system $IMG_ROOT/system.img -ramdisk $IMG_ROOT/ramdisk.img -initdata $IMG_ROOT/userdata.img -kernel $IMG_ROOT/kernel -qemu -s -S

#/home/sgye/vol1/android-sdk-linux/system-images/android-25/google_apis/x86/kernel-ranchu
# -accel off 
#  -s -S
# $IMG_ROOT/kernel -qemu 

# symbol-file /home/sgye/vol1/android/out/target/product/x86emu/obj/EXECUTABLES/init_intermediates/LINKED/init



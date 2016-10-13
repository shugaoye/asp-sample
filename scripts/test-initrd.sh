#!/bin/sh

. ~/bin/setup.sh

if [ -z "$1" ]; then
  EMULATOR1=emulator
else
  EMULATOR1="/opt/VirtualGL/bin/vglrun emulator"
fi

if [ -z "$2" ]; then
  VDI_ROOT=.
else
  VDI_ROOT=$2
fi

if [ -z "$OUT" ]; then
  IMG_ROOT=.
else
  IMG_ROOT=$OUT
fi

$EMULATOR1 @a23x86 -verbose -show-kernel -system $IMG_ROOT/system.img -ramdisk $IMG_ROOT/initrd.img -initdata $IMG_ROOT/userdata.img -kernel $IMG_ROOT/kernel -qemu -append "qemu=1 clocksource=pit android.checkjni=1 DEBUG=2 console=ttyS0,11520 androidboot.hardware=ranchu qemu.gles=1 android.qemud=1 root=/dev/sda4 SRC=x86emu" -hda $VDI_ROOT/x86emu2G.img

#!/bin/sh

if [ -z "$1" ]; then
  EMULATOR1=emulator
else
  EMULATOR1="/opt/VirtualGL/bin/vglrun emulator"
fi

IMG_ROOT=./

$EMULATOR1 @a23x86 -verbose -show-kernel -system $IMG_ROOT/userdata-qcow2.img -ramdisk $IMG_ROOT/initrd.img -initdata $IMG_ROOT/userdata-qcow2.img -kernel $IMG_ROOT/kernel -qemu -append "qemu=1 clocksource=pit android.checkjni=1 DEBUG=2 console=ttyS0,11520 androidboot.hardware=ranchu qemu.gles=1 android.qemud=1 root=/dev/sda SRC=x86emu_x86" -hda $IMG_ROOT/x86emu_x86-qcow2.img

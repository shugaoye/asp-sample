#!/bin/sh
#******************************************************************************
#
# Android System Programming
# Script to test Android images in chapter 7
#
# Copyright (c) 2017 Roger Ye.  All rights reserved.
# Software License Agreement
# 
# 
# THIS SOFTWARE IS PROVIDED "AS IS" AND WITH ALL FAULTS.
# NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING, BUT
# NOT LIMITED TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE. The AUTHOR SHALL NOT, UNDER
# ANY CIRCUMSTANCES, BE LIABLE FOR SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
# DAMAGES, FOR ANY REASON WHATSOEVER.
#
#******************************************************************************

case $0 in
        *vgl)
		EMULATOR1="/opt/VirtualGL/bin/vglrun emulator"
	;;
	*)
		EMULATOR1=emulator
	;;
esac

if [ -z "$1" ]; then
  AVD_NAME=a25x86
else
  AVD_NAME=$1
fi

if [ -z "$2" ]; then
  RAMDISK_NAME=ramdisk.img
else
  RAMDISK_NAME=$2
fi

if [ -z "$OUT" ]; then
  IMG_ROOT=.
else
  IMG_ROOT=$OUT
fi

CMD_LINE="qemu=1 androidboot.hardware=ranchu clocksource=pit console=ttyS0,38400 android.qemud=1 android.checkjni=1 qemu.gles=1 androidboot.selinux=permissive"

$EMULATOR1 @${AVD_NAME} -ranchu -verbose -show-kernel -selinux disabled -system $IMG_ROOT/system-qcow2.img -ramdisk $IMG_ROOT/${RAMDISK_NAME} -initdata $IMG_ROOT/userdata-qcow2.img -kernel $IMG_ROOT/kernel -qemu -netdev user,id=mynet1,net=10.0.2.0/24,dhcpstart=10.0.2.50 -device virtio-net,netdev=mynet1 -append "${CMD_LINE} DEBUG=2 root=/dev/sda SRC=x86emu_ch07"


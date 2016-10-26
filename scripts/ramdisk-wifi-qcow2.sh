#!/bin/sh

if [ -z "$1" ]; then
  EMULATOR1=emulator
else
  EMULATOR1="/opt/VirtualGL/bin/vglrun emulator"
fi

IMG_ROOT=.

$EMULATOR1 @a23x86 -ranchu -verbose -show-kernel -system $IMG_ROOT/system-qcow2.img -ramdisk $IMG_ROOT/ramdisk.img -initdata $IMG_ROOT/userdata-qcow2.img -kernel $IMG_ROOT/kernel -qemu -netdev user,id=mynet1,net=10.0.2.0/24,dhcpstart=10.0.2.50 -device virtio-net,netdev=mynet1


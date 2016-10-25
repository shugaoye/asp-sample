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

$EMULATOR1 @a23x86 -ranchu -verbose -show-kernel -system $IMG_ROOT/system.img -ramdisk $IMG_ROOT/initrd.img -initdata $IMG_ROOT/userdata.img -kernel $IMG_ROOT/kernel -qemu -netdev user,id=mynet1,net=10.0.2.0/24,dhcpstart=10.0.2.50 -device virtio-net,netdev=mynet1



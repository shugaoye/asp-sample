#!/bin/sh

TMPMNT=`pwd`/tmp
TGTDEV=./x86emu2G.img
if [ -z "$OUT" ]; then
  IMG_ROOT=.
else
  IMG_ROOT=$OUT
fi

dd if=/dev/zero bs=1024 count=2000000 of=${TGTDEV}
# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can 
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "default" will send a empty
# line terminated with a newline to take the fdisk default.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
  o # clear the in memory partition table
  n # new partition
  p # primary partition
  1 # partition number 1
    # default - start at beginning of disk 
  +100M # 100 MB boot parttion
  n # new partition
  p # primary partition
  2 # partion number 2
    # default, start immediately after preceding partition
    # default, extend partition to end of disk
  a # make a partition bootable
  1 # bootable partition is partition 1 -- /dev/sda1
  p # print the in-memory partition table
  w # write the partition table
  q # and we're done
EOF

sudo kpartx -a -v ${TGTDEV}
ls -F /dev/mapper
sudo mkfs.ext4 /dev/mapper/loop0p2
mkdir -p ${TMPMNT}
sudo mount /dev/mapper/loop0p2 ${TMPMNT}
sudo mkdir -p ${TMPMNT}/x86emu
sudo cp ${IMG_ROOT}/initrd.img ${TMPMNT}/x86emu/initrd.img
sudo cp ${IMG_ROOT}/ramdisk.img ${TMPMNT}/x86emu/ramdisk.img
sudo cp ${IMG_ROOT}/kernel ${TMPMNT}/x86emu/kernel
sudo cp ${IMG_ROOT}/install.img ${TMPMNT}/x86emu/install.img
sudo cp ${IMG_ROOT}/system.img ${TMPMNT}/x86emu/system.img
ls -F ${TMPMNT}/x86emu
sudo umount ${TMPMNT}
rmdir ${TMPMNT}
sudo kpartx -a -v ${TGTDEV}
qemu-img convert -c -f raw -O qcow2 ./x86emu2G.img ./x86emu2G-qcow2.img
qemu-img create -f qcow2 -b ./x86emu2G-qcow2.img ./x86emu2G.img


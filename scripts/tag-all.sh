#!/bin/bash

source build/envsetup.sh

tag_android_x86()
{
cd bootable/newinstaller; git tag $1; git push github $1; croot
cd bootable/recovery; git tag $1; git push github $1; croot
cd device/generic/common; git tag $1; git push github $1; croot

cd bionic; git tag $1; git push github $1; croot
cd device/generic/firmware; git tag $1; git push github $1; croot
cd external/alsa-lib; git tag $1; git push github $1; croot
cd external/alsa-utils; git tag $1; git push github $1; croot
cd external/bluetooth/bluez; git tag $1; git push github $1; croot
cd external/bluetooth/glib; git tag $1; git push github $1; croot
cd external/bluetooth/sbc; git tag $1; git push github $1; croot
cd external/busybox; git tag $1; git push github $1; croot
cd external/drm_gralloc; git tag $1; git push github $1; croot
cd external/drm_hwcomposer; git tag $1; git push github $1; croot
cd external/e2fsprogs; git tag $1; git push github $1; croot
cd external/ffmpeg; git tag $1; git push github $1; croot
cd external/libdrm; git tag $1; git push github $1; croot
cd external/libpciaccess; git tag $1; git push github $1; croot
cd external/libtruezip; git tag $1; git push github $1; croot
cd external/llvm; git tag $1; git push github $1; croot
cd external/mesa; git tag $1; git push github $1; croot
cd external/s2tc; git tag $1; git push github $1; croot
cd external/stagefright-plugins; git tag $1; git push github $1; croot
cd external/v86d; git tag $1; git push github $1; croot
cd frameworks/av; git tag $1; git push github $1; croot
cd frameworks/base; git tag $1; git push github $1; croot
cd frameworks/native; git tag $1; git push github $1; croot
cd hardware/broadcom/wlan; git tag $1; git push github $1; croot
cd hardware/gps; git tag $1; git push github $1; croot
cd hardware/intel/audio_media; git tag $1; git push github $1; croot
cd hardware/intel/libsensors; git tag $1; git push github $1; croot
cd hardware/libaudio; git tag $1; git push github $1; croot
cd hardware/libcamera; git tag $1; git push github $1; croot
cd hardware/libhardware; git tag $1; git push github $1; croot
cd hardware/libhardware_legacy; git tag $1; git push github $1; croot
cd hardware/liblights; git tag $1; git push github $1; croot
cd hardware/libsensors; git tag $1; git push github $1; croot
cd hardware/ril; git tag $1; git push github $1; croot
cd hardware/x86power; git tag $1; git push github $1; croot
cd system/core; git tag $1; git push github $1; croot
}

tag_goldfish()
{
cd device/generic/goldfish; git tag $1; git push github $1; croot
}

case $1 in
	android-6.0.1_r61_x86vbox*|android-7.1.0_r7_x86vbox*)
		if [ -d device/generic/x86vbox ]; then
			echo Tagging x86vbox ...
			cd device/generic/x86vbox; git tag $1; git push github $1; croot
			tag_goldfish
			tag_android_x86
		else
			echo "Cannot find x86vbox."
			exit
		fi
		;;
	android-6.0.1_r61_x86emu*)
		if [ -d device/generic/x86emu ]; then
			echo Tagging x86emu ...
			tag_goldfish
			cd device/generic/x86emu; git tag $1; git push github $1; croot
		else
			echo "Cannot find x86emu."
			exit
		fi
		;;
	android-7.1.0_r7_x86emu_ch04_r*)
		if [ -d device/generic/x86emu ]; then
			echo Tagging android-7.1.0_r7_x86emu_ch04...
			cd device/generic/x86emu; git tag $1; git push github $1; croot
		else
			echo "Cannot find x86emu."
			exit
		fi
		;;
	android-7.1.0_r7_x86emu_ch05_r*)
		if [ -d device/generic/x86emu ]; then
			echo Tagging android-7.1.0_r7_x86emu_ch05...
			cd device/generic/x86emu; git tag $1; git push github $1; croot
			cd device/generic/common; git tag $1; git push github $1; croot
		else
			echo "Cannot find x86emu."
			exit
		fi
		;;
	*)
		echo Tag is not valid.
		exit
		;;
esac

echo "Start tagging ..."
cd kernel; git tag $1; git push github $1; croot



#!/bin/bash

source build/envsetup.sh

# REPO_T is the target remote
REPO_T=github
# REPO_C is the current remote
REPO_C=

tag_android_x86()
{
	echo "Tagging $1 android_x86 projects and push to ${REPO_T} in `pwd`..."
	cd bootable/newinstaller; git tag $1; git push ${REPO_T} $1; croot
	cd device/generic/common; git tag $1; git push ${REPO_T} $1; croot

	cd bionic; git tag $1; git push ${REPO_T} $1; croot
	cd device/generic/firmware; git tag $1; git push ${REPO_T} $1; croot
	cd external/alsa-lib; git tag $1; git push ${REPO_T} $1; croot
	cd external/alsa-utils; git tag $1; git push ${REPO_T} $1; croot
	cd external/bluetooth/bluez; git tag $1; git push ${REPO_T} $1; croot
	cd external/bluetooth/glib; git tag $1; git push ${REPO_T} $1; croot
	cd external/bluetooth/sbc; git tag $1; git push ${REPO_T} $1; croot
	cd external/busybox; git tag $1; git push ${REPO_T} $1; croot
	cd external/drm_gralloc; git tag $1; git push ${REPO_T} $1; croot
	cd external/drm_hwcomposer; git tag $1; git push ${REPO_T} $1; croot
	cd external/e2fsprogs; git tag $1; git push ${REPO_T} $1; croot
	cd external/ffmpeg; git tag $1; git push ${REPO_T} $1; croot
	cd external/libdrm; git tag $1; git push ${REPO_T} $1; croot
	cd external/libtruezip; git tag $1; git push ${REPO_T} $1; croot
	cd external/llvm; git tag $1; git push ${REPO_T} $1; croot
	cd external/mesa; git tag $1; git push ${REPO_T} $1; croot
	cd external/s2tc; git tag $1; git push ${REPO_T} $1; croot
	cd external/stagefright-plugins; git tag $1; git push ${REPO_T} $1; croot
	cd external/v86d; git tag $1; git push ${REPO_T} $1; croot
	cd frameworks/av; git tag $1; git push ${REPO_T} $1; croot
	cd frameworks/base; git tag $1; git push ${REPO_T} $1; croot
	cd frameworks/native; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/broadcom/wlan; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/gps; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/intel/audio_media; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/intel/libsensors; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/libaudio; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/libcamera; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/libhardware; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/libhardware_legacy; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/liblights; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/libsensors; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/ril; git tag $1; git push ${REPO_T} $1; croot
	cd hardware/x86power; git tag $1; git push ${REPO_T} $1; croot
	cd system/core; git tag $1; git push ${REPO_T} $1; croot
}

tag_goldfish()
{
	echo "Tagging device/generic/goldfish ..."
	cd device/generic/goldfish; git tag $1; git push ${REPO_T} $1; croot
}

if [ -n "$1" ]; then
	echo "Starting to tag $1..."
else
	echo "Need to specify a tag."
	exit
fi

if [ -n "$2" ]; then
	echo "The remote is $2."
	REPO_T=$2
fi

cd kernel; REPO_C=`git remote`; croot

if [ "${REPO_T}" = "${REPO_C}" ]; then
	echo "Verified the remote ${REPO_T}."
else
	echo "The current remote is ${REPO_C}, but you want to tag ${REPO_T}."
	exit
fi

echo "REPO_T=${REPO_T} REPO_C=${REPO_C}"

case $1 in
	android-6.0.1_r61_x86vbox_ch*)
		if [ -d device/generic/x86vbox ]; then
			echo "Tagging x86vbox ..."
			cd device/generic/x86vbox; git tag $1; git push ${REPO_T} $1; croot
			cd bootable/recovery; git tag $1; git push ${REPO_T} $1; croot
			tag_goldfish $1
			tag_android_x86 $1
			cd external/libpciaccess; git tag $1; git push ${REPO_T} $1; croot
		else
			echo "Cannot find x86vbox."
			exit
		fi
		;;
	android-7.1.0_r7_x86vbox_ch*|android-7.1.1_r4_x86vbox_ch*)
		if [ -d device/generic/x86vbox ]; then
			echo "Tagging x86vbox ..."
			cd device/generic/x86vbox; git tag $1; git push ${REPO_T} $1; croot
			cd bootable/recovery; git tag $1; git push ${REPO_T} $1; croot
			tag_android_x86 $1
		else
			echo "Cannot find x86vbox."
			exit
		fi
		;;
	android-6.0.1_r61_x86emu*)
		if [ -d device/generic/x86emu ]; then
			echo Tagging x86emu ...
			tag_goldfish $1
			tag_android_x86 $1
			cd external/libpciaccess; git tag $1; git push ${REPO_T} $1; croot
			cd device/generic/x86emu; git tag $1; git push ${REPO_T} $1; croot
		else
			echo "Cannot find x86emu."
			exit
		fi
		;;
	android-7.1.0_r7_x86emu_ch0*|android-7.1.1_r4_x86emu_ch0*|android-6.0.1_r74_x86emu_ch0*)
		if [ -d device/generic/x86emu ]; then
			echo "Tagging $1..."
			PATH1="device/generic/common";[ -f ${PATH1}/Android.mk ] && (cd ${PATH1}; git tag $1; git push ${REPO_T} $1; croot)
			PATH1="device/generic/goldfish";[ -d ${PATH1} ] && (cd ${PATH1}; git tag $1; git push ${REPO_T} $1; croot)
			PATH1="device/generic/x86emu";[ -d ${PATH1} ] && (cd ${PATH1}; git tag $1; git push ${REPO_T} $1; croot)
			PATH1="bootable/newinstaller";[ -d ${PATH1} ] && (cd ${PATH1}; git tag $1; git push ${REPO_T} $1; croot)
		else
			echo "Cannot find x86emu."
			exit
		fi
		;;
	android-x86-6.0.1_r*)
		tag_android_x86 $1
		cd external/libpciaccess; git tag $1; git push ${REPO_T} $1; croot
		;;
	android-x86-7.1.1_r*)
		tag_android_x86 $1
		;;
	*)
		echo Tag is not valid.
		exit
		;;
esac

echo "Start tagging ..."
cd kernel; git tag $1; git push ${REPO_T} $1; croot



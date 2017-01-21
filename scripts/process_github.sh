#!/bin/bash
#******************************************************************************
#
# Android System Programming
# Script to push/pull specific branch or tag to/from GitHub
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

[ -f build/envsetup.sh ] && echo "Found build/envsetup.sh." || exit
source build/envsetup.sh

ASP_ACTION=no

# argument 1 - remote repository name
# argument 2 - remote repository url
git_remote_add()
{
	git remote add $1 $2
}

remote_add_github()
{
case $1 in
	bootable/newinstaller)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_bootable_newinstaller
	;;
	device/generic/common)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/device_generic_common
	;;
	bionic)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_bionic
	;;
	device/generic/firmware)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/device_generic_firmware
	;;
	external/alsa-lib)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_alsa-lib
	;;
	external/alsa-utils)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_alsa-utils
	;;
	external/bluetooth/bluez)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_bluetooth_bluez
	;;
	external/bluetooth/glib)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_bluetooth_glib
	;;
	external/bluetooth/sbc)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_bluetooth_sbc
	;;
	external/busybox)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_busybox
	;;
	external/drm_gralloc)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_drm_gralloc
	;;
	external/drm_hwcomposer)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_drm_hwcomposer
	;;
	external/e2fsprogs)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_e2fsprogs
	;;
	external/ffmpeg)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_ffmpeg
	;;
	external/libdrm)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_libdrm
	;;
	external/libtruezip)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_libtruezip
	;;
	external/llvm)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_llvm
	;;
	external/mesa)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_mesa
	;;
	external/s2tc)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_s2tc
	;;
	external/stagefright-plugins)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_stagefright-plugins
	;;
	external/v86d)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_external_v86d
	;;
	frameworks/av)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_frameworks_av
	;;
	frameworks/base)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_frameworks_base
	;;
	frameworks/native)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_frameworks_native
	;;
	hardware/broadcom/wlan)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_broadcom_wlan
	;;
	hardware/gps)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_gps
	;;
	hardware/intel/audio_media)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_intel_audio_media
	;;
	hardware/intel/libsensors)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_intel_libsensors
	;;
	hardware/libaudio)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_libaudio
	;;
	hardware/libcamera)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_libcamera
	;;
	hardware/libhardware)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_libhardware
	;;
	hardware/libhardware_legacy)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_libhardware_legacy
	;;
	hardware/liblights)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_liblights
	;;
	hardware/libsensors)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_libsensors
	;;
	hardware/ril)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_ril
	;;
	hardware/x86power)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_hardware_x86power
	;;
	system/core)
		git_remote_add github ssh://mygit/media/aosp-mirror/github/platform_system_core
	;;
	*)
		echo "Path is not found."
	;;
esac
}

remote_add_x86()
{
case $1 in
	bootable/newinstaller)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/bootable/newinstaller
		;;
	device/generic/common)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/device/generic/common
		;;
	bionic)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/bionic
		;;
	device/generic/firmware)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/device/generic/firmware
		;;
	external/alsa-lib)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/alsa-lib
		;;
	external/alsa-utils)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/alsa-utils
		;;
	external/bluetooth/bluez)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/bluetooth/bluez
		;;
	external/bluetooth/glib)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/bluetooth/glib
		;;
	external/bluetooth/sbc)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/bluetooth/sbc
		;;
	external/busybox)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/busybox
		;;
	external/drm_gralloc)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/drm_gralloc
		;;
	external/drm_hwcomposer)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/drm_hwcomposer
		;;
	external/e2fsprogs)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/e2fsprogs
		;;
	external/ffmpeg)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/ffmpeg
		;;
	external/libdrm)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/libdrm
		;;
	external/libtruezip)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/libtruezip
		;;
	external/llvm)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/llvm
		;;
	external/mesa)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/mesa
		;;
	external/s2tc)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/s2tc
		;;
	external/stagefright-plugins)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/stagefright-plugins
		;;
	external/v86d)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/external/v86d
		;;
	frameworks/av)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/frameworks/av
		;;
	frameworks/base)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/frameworks/base
		;;
	frameworks/native)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/frameworks/native
		;;
	hardware/broadcom/wlan)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/broadcom/wlan
		;;
	hardware/gps)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/gps
		;;
	hardware/intel/audio_media)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/intel/audio_media
		;;
	hardware/intel/libsensors)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/intel/libsensors
		;;
	hardware/libaudio)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/libaudio
		;;
	hardware/libcamera)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/libcamera
		;;
	hardware/libhardware)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/libhardware
		;;
	hardware/libhardware_legacy)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/libhardware_legacy
		;;
	hardware/liblights)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/liblights
		;;
	hardware/libsensors)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/libsensors
		;;
	hardware/ril)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/ril
		;;
	hardware/x86power)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/hardware/x86power
		;;
	system/core)
		git_remote_add x86 ssh://mygit/mnt/mirror/android-x86/platform/system/core
		;;
	*)
		echo "Path is not found."
	;;
esac
}

# argument 1 - relative path of a project
remote_add()
{
	REPO_C=`git remote`;
	case ${REPO_C} in
		github)
			remote_add_x86 $1
		;;
		x86)
			remote_add_github $1
		;;
		*)
			echo "Remote is wrong."
		;;
	esac
}

# argument 1 - remote git repository name
# argument 2 - remote git repository url
process_remote()
{
	echo $1 $2
}

get_remote()
{
	REPO_C=`git remote -v`;
	process_remote ${REPO_C}
}

# argument 1 - relative path of a project
# argument 2 - tag or branch
# argument 3 - remote git repository
process_git()
{
	case ${ASP_ACTION} in
		add)
		remote_add $1 $2 $3
		;;
		pull)
		echo "In $1"
		[ -n "$3" ] && (git pull $3 $2)
		;;
		push)
		echo "In $1"
		[ -n "$3" ] && (git push $3 $2)
		;;
		*)
		get_remote
		;;
	esac
}

# argument 1 - tag or branch
# argument 2 - remote git repository
# argument 3 - push or pull
process_android_x86()
{
	# echo "Processing android_x86 $1 $2 $3"
	PATH1="bootable/newinstaller";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="device/generic/common";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)

	PATH1="bionic";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="device/generic/firmware";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/alsa-lib";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/alsa-utils";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/bluetooth/bluez";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/bluetooth/glib";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/bluetooth/sbc";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/busybox";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/drm_gralloc";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/hwcomposer";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/e2fsprogs";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/ffmpeg";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/libdrm";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/libtruezip";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/llvm";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/mesa";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/s2tc";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/stagefright-plugins";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="external/v86d";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="frameworks/av";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="frameworks/base";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="frameworks/native";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/broadcom/wlan";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/gps";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/intel/audio_media";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/intel/libsensors";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/libaudio";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/libcamera";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/libhardware";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/libhardware_legacy";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/liblights";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/libsensors";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/ril";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="hardware/x86power";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
	PATH1="system/core";[ -d ${PATH1} ] && (cd ${PATH1}; process_git ${PATH1} $1 $2 $3; croot)
}


case $0 in
        *push*)
		ASP_ACTION=push
	;;
        *pull*)
		ASP_ACTION=pull
	;;
        *add*)
		echo "Adding remote..."
		ASP_ACTION=add
	;;
	*)
		echo "$0"
	;;
esac

process_android_x86 $1 $2 $3



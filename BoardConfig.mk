# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/samsung/kanas/BoardConfigVendor.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_BOARD_PLATFORM_GPU := ARM Mali-400
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOOTLOADER_BOARD_NAME := SC7735S
BOARD_VENDOR := samsung
VSYNC_EVENT_PHASE_OFFSET_NS := 0

# Config u-boot
TARGET_NO_BOOTLOADER := true

BOARD_BOOTIMAGE_PARTITION_SIZE := 12366032
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12366032
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 576716800
BOARD_USERDATAIMAGE_PARTITION_SIZE := 209715200
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# RIL
BOARD_RIL_CLASS := ../../../device/samsung/kanas/ril
COMMON_GLOBAL_CFLAGS += -DSEC_PRODUCT_FEATURE_RIL_CALL_DUALMODE_CDMAGSM

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/kanas/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/kanas/bluetooth/libbt_vndcfg.txt
#USE_BLUETOOTH_BCM4343 := true

# Wifi
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WLAN_DEVICE_REV := bcm4343
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_NVRAM_PATH_PARAM := "/sys/module/dhd/parameters/nvram_path"
WIFI_DRIVER_NVRAM_PATH := "/system/etc/wifi/nvram_net.txt"
WIFI_BAND := 802_11_ABG
BOARD_HAVE_SAMSUNG_WIFI := true

# Hardware rendering
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
HWUI_COMPILE_FOR_PERF := true
USE_SPRD_HWCOMPOSER := true
USE_OPENGL_RENDERER := true
USE_OVERLAY_COMPOSER_GPU := true
DEVICE_FORCE_VIDEO_GO_OVERLAYCOMPOSER := true
COMMON_GLOBAL_CFLAGS += -DSC8830_HWC

# Audio
BOARD_USES_TINYALSA_AUDIO := true
BOARD_USES_SS_VOIP := true
BOARD_USE_LIBATCHANNEL_WRAPPER := true

# Board specific features
#BOARD_USE_VETH := true
#BOARD_SPRD_RIL := true
#BOARD_SAMSUNG_RIL := true
BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_NEEDS_MEMORYHEAPION_SPRD := true
COMMON_GLOBAL_CFLAGS += -DSPRD_HARDWARE

# HealthD
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Camera
CAMERA_SUPPORT_SIZE := 5M
CONFIG_CAMERA_ISP := true
COMMON_GLOBAL_CFLAGS += -DCONFIG_CAMERA_ISP
TARGET_BOARD_BACK_CAMERA_INTERFACE := ccir
TARGET_BOARD_BACK_CAMERA_ROTATION := false
TARGET_BOARD_CAMERA_HAL_VERSION := HAL1.0
TARGET_BOARD_CAMERA_ANDROID_ZSL_MODE := false
TARGET_BOARD_CAMERA_ROTATION_CAPTURE := false
TARGET_BOARD_CAMERA_FLASH_CTRL := true
TARGET_BOARD_CAMERA_CAPTURE_MODE := false
TARGET_BOARD_CAMERA_FACE_DETECT := false
TARGET_BOARD_CAMERA_USE_IOMMU := true
TARGET_BOARD_CAMERA_DMA_COPY := true
TARGET_BOARD_CAMERA_CAF := true
TARGET_BOARD_FRONT_CAMERA_INTERFACE := ccir
TARGET_BOARD_FRONT_CAMERA_ROTATION := false
TARGET_BOARD_NO_FRONT_SENSOR := false

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := cyanogenmod_kanas_defconfig

# Recovery
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/kanas/cmhw/

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/kanas/ramdisk/fstab.kanas
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_RECOVERY_ALWAYS_WIPES := false
BOARD_RECOVERY_HANDLES_MOUNT := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USES_MMCUTILS := false
DEVICE_RESOLUTION := 480x800

# Device
TARGET_OTA_ASSERT_DEVICE := kanas,kanas3g,kanas3gnfcxx

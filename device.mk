# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := device/samsung/kanas

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# This device is hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Rootdir files
ROOTDIR_FILES := \
    $(LOCAL_PATH)/ramdisk/fstab.sc8830 \
    $(LOCAL_PATH)/ramdisk/init.board.rc \
    $(LOCAL_PATH)/ramdisk/init.kanas3g.rc \
    $(LOCAL_PATH)/ramdisk/init.kanas3g_base.rc \
    $(LOCAL_PATH)/ramdisk/init.recovery.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/init.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/init.sc8830.usb.rc \
    $(LOCAL_PATH)/ramdisk/init.wifi.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.sc8830.rc \
    $(LOCAL_PATH)/ramdisk/property_contexts

PRODUCT_COPY_FILES += \
    $(foreach f,$(ROOTDIR_FILES),$(f):root/$(notdir $(f)))

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/etc/extra.fstab:recovery/root/etc/extra.fstab

# Keylayouts
KEYLAYOUT_FILES := \
    $(LOCAL_PATH)/keylayouts/ist30xx_ts_input.kl \
    $(LOCAL_PATH)/keylayouts/sci-keypad.kl

PRODUCT_COPY_FILES += \
    $(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Bluetooth config
BLUETOOTH_CONFIGS := \
    $(LOCAL_PATH)/configs/bluetooth/bt_vendor.conf

PRODUCT_COPY_FILES += \
    $(foreach f,$(BLUETOOTH_CONFIGS),$(f):system/etc/bluetooth/$(notdir $(f)))

# Media config
MEDIA_CONFIGS := \
    $(LOCAL_PATH)/media/media_codecs.xml \
    $(LOCAL_PATH)/media/media_profiles.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(MEDIA_CONFIGS),$(f):system/etc/$(notdir $(f)))

WIFI_CONFIGS := \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    $(foreach f,$(WIFI_CONFIGS),$(f):system/etc/wifi/$(notdir $(f)))

# Permissions
PERMISSION_XML_FILES := \
    $(LOCAL_PATH)/permissions/platform.xml \
    $(LOCAL_PATH)/permissions/handheld_core_hardware.xml \
    $(LOCAL_PATH)/permissions/android.hardware.camera.flash.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml

PRODUCT_COPY_FILES += \
    $(foreach f,$(PERMISSION_XML_FILES),$(f):system/etc/permissions/$(notdir $(f)))

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Bluetooth
PRODUCT_PACKAGES += \
    libbluetooth_jni

# HWC
PRODUCT_PACKAGES += \
    gralloc.sc8830 \
    hwcomposer.sc8830 \
    sprd_gsp.sc8830 \
    libion

# Camera
PRODUCT_PACKAGES += \
    camera.sc8830 \
    camera2.sc8830

# Codecs
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libstagefright_sprd_soft_mpeg4dec \
    libstagefright_sprd_soft_h264dec \
    libstagefright_sprd_mpeg4dec \
    libstagefright_sprd_mpeg4enc \
    libstagefright_sprd_h264dec \
    libstagefright_sprd_h264enc \
    libstagefright_sprd_vpxdec \
    libstagefright_sprd_aacdec \
    libstagefright_sprd_mp3dec \
    libomx_aacdec_sprd.so \
    libomx_avcdec_hw_sprd.so \
    libomx_avcdec_sw_sprd.so \
    libomx_avcenc_hw_sprd.so \
    libomx_m4vh263dec_hw_sprd.so \
    libomx_m4vh263dec_sw_sprd.so \
    libomx_m4vh263enc_hw_sprd.so \
    libomx_mp3dec_sprd.so \
    libomx_vpxdec_hw_sprd.so

# Lights
PRODUCT_PACKAGES += \
    lights.sc8830

# Device-specific packages
PRODUCT_PACKAGES += \
    Torch \
    SamsungServiceMode

# Bluetooth
PRODUCT_PACKAGES += \
    bluetooth.default \
    audio.a2dp.default

# Audio
PRODUCT_PACKAGES += \
    audio.primary.sc8830 \
    audio_policy.sc8830 \
    audio.r_submix.default \
    audio.usb.default \
    audio_vbc_eq \
    libaudio-resampler \
    libatchannel \
    libatchannel_wrapper \
    libtinyalsa

# Wifi
PRODUCT_PACKAGES += \
    libnetcmdiface \
    dhcpcd.conf \
    wpa_supplicant \
    hostapd

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    e2fsck \
    f2fstat \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.f2fs

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# For userdebug builds
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure="false" \
    ro.adb.secure="false"
endif

# USB
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config="mtp"

# Device props
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim="true" \
    ro.kernel.android.checkjni="0" \
    dalvik.vm.checkjni="false"

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures="1" \
    ro.com.google.networklocation="1"

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

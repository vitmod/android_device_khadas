#
# Copyright (C) 2013 The Android Open-Source Project
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
#

ifneq ($(BOARD_USES_RECOVERY_AS_BOOT), true)
PRODUCT_COPY_FILES += device/amlogic/common/products/mbox/init.amlogic.rc:root/init.amlogic.rc

PRODUCT_COPY_FILES += \
    device/amlogic/p212/init.amlogic.usb.rc:root/init.amlogic.usb.rc \
    device/amlogic/common/products/mbox/ueventd.amlogic.rc:root/ueventd.amlogic.rc \
    device/amlogic/p212/init.amlogic.board.rc:root/init.amlogic.board.rc
else
PRODUCT_COPY_FILES += device/amlogic/common/products/mbox/init.amlogic.rc:recovery/root/init.amlogic.rc

PRODUCT_COPY_FILES += \
    device/amlogic/p212/init.amlogic.usb.$(BOARD_KERNEL_VERSION).rc:recovery/root/init.amlogic.usb.rc \
    device/amlogic/common/products/mbox/ueventd.amlogic.rc:recovery/root/ueventd.amlogic.rc \
    device/amlogic/p212/init.amlogic.board.rc:recovery/root/init.amlogic.board.rc
endif

PRODUCT_COPY_FILES += \
    device/amlogic/p212/files/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/amlogic/p212/files/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/amlogic/p212/files/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    device/amlogic/p212/files/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/amlogic/p212/files/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/amlogic/p212/files/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/amlogic/p212/files/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg \
    device/amlogic/p212/files/remote.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/remote.cfg \
    device/amlogic/p212/files/remote.tab1:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab1 \
    device/amlogic/p212/files/remote.tab2:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab2 \
    device/amlogic/p212/files/remote.tab3:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab3 \
    device/amlogic/p212/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

PRODUCT_COPY_FILES += \
    device/amlogic/p212/recovery/init.recovery.amlogic.rc:root/init.recovery.amlogic.rc \
    device/amlogic/p212/recovery/recovery.kl:recovery/root/etc/recovery.kl \
    device/amlogic/p212/files/mesondisplay.cfg:recovery/root/etc/mesondisplay.cfg \
    device/amlogic/p212/recovery/busybox:recovery/root/sbin/busybox \
    device/amlogic/p212/recovery/remotecfg:recovery/root/sbin/remotecfg \
    device/amlogic/p212/files/remote.cfg:recovery/root/etc/remote.cfg \
    device/amlogic/p212/files/remote.tab1:recovery/root/etc/remote.tab1 \
    device/amlogic/p212/files/remote.tab2:recovery/root/etc/remote.tab2 \
    device/amlogic/p212/files/remote.tab3:recovery/root/etc/remote.tab3 \
    device/amlogic/p212/recovery/sh:recovery/root/sbin/sh

# remote IME config file
PRODUCT_COPY_FILES += \
    device/amlogic/p212/files/Vendor_0001_Product_0001.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    device/amlogic/p212/files/Generic.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl
PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_CHARACTERISTICS := mbx,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/amlogic/p212/overlay

PRODUCT_TAGS += dalvik.gc.type-precise


# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

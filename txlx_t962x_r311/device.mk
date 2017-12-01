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
PRODUCT_COPY_FILES += device/amlogic/common/products/tv/init.amlogic.rc:root/init.amlogic.rc

PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/init.amlogic.usb.rc:root/init.amlogic.usb.rc \
    device/amlogic/common/products/tv/ueventd.amlogic.rc:root/ueventd.amlogic.rc \
    device/amlogic/txlx_t962x_r311/init.amlogic.board.rc:root/init.amlogic.board.rc
else
PRODUCT_COPY_FILES += device/amlogic/common/products/tv/init.amlogic.rc:recovery/root/init.amlogic.rc

PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/init.amlogic.usb.$(BOARD_KERNEL_VERSION).rc:recovery/root/init.amlogic.usb.rc \
    device/amlogic/common/products/tv/ueventd.amlogic.rc:recovery/root/ueventd.amlogic.rc \
    device/amlogic/txlx_t962x_r311/init.amlogic.board.rc:recovery/root/init.amlogic.board.rc
endif
PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/files/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml \
    device/amlogic/txlx_t962x_r311/files/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    device/amlogic/txlx_t962x_r311/files/audio_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy.conf \
    device/amlogic/txlx_t962x_r311/files/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    device/amlogic/txlx_t962x_r311/files/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    device/amlogic/txlx_t962x_r311/files/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    device/amlogic/txlx_t962x_r311/files/mesondisplay.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/mesondisplay.cfg \
    device/amlogic/txlx_t962x_r311/manifest.xml:$(TARGET_COPY_OUT_VENDOR)/manifest.xml

# remote IME config file
PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/files/remote.conf:$(TARGET_COPY_OUT_VENDOR)/etc/remote.conf \
    device/amlogic/txlx_t962x_r311/files/remote.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/remote.cfg \
    device/amlogic/txlx_t962x_r311/files/remote.tab:$(TARGET_COPY_OUT_VENDOR)/etc/remote.tab \
    device/amlogic/txlx_t962x_r311/files/Vendor_0001_Product_0001.kl:/$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_0001_Product_0001.kl \
    device/amlogic/txlx_t962x_r311/files/Generic.kl:/$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl

# recovery
PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/recovery/init.recovery.amlogic.rc:root/init.recovery.amlogic.rc \
    device/amlogic/txlx_t962x_r311/recovery/recovery.kl:recovery/root/etc/recovery.kl \
    device/amlogic/txlx_t962x_r311/files/mesondisplay.cfg:recovery/root/etc/mesondisplay.cfg \
    device/amlogic/txlx_t962x_r311/recovery/busybox:recovery/root/sbin/busybox \
    device/amlogic/txlx_t962x_r311/recovery/remotecfg:recovery/root/sbin/remotecfg \
    device/amlogic/txlx_t962x_r311/files/remote.cfg:recovery/root/etc/remote.cfg \
    device/amlogic/txlx_t962x_r311/files/remote.tab:recovery/root/etc/remote.tab \
    device/amlogic/txlx_t962x_r311/recovery/sh:recovery/root/sbin/sh

# txlx_t962x_r311 config file
PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/files/tv/tvconfig.conf:$(TARGET_COPY_OUT_VENDOR)/etc/tvconfig.conf \
    device/amlogic/txlx_t962x_r311/files/tv/tv_default.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/tv_default.cfg \
    device/amlogic/txlx_t962x_r311/files/tv/tv_default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/tv_default.xml \
    device/amlogic/txlx_t962x_r311/files/tv/tv_setting_config.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/tv_setting_config.cfg \
    device/amlogic/txlx_t962x_r311/files/tv/pq.db:$(TARGET_COPY_OUT_VENDOR)/etc/pq.db \
    device/amlogic/txlx_t962x_r311/files/tv/dec:$(TARGET_COPY_OUT_VENDOR)/bin/dec \
    device/amlogic/txlx_t962x_r311/files/tv/port_14.bin:$(TARGET_COPY_OUT_VENDOR)/etc/port_14.bin \
    device/amlogic/txlx_t962x_r311/files/tv/port_20.bin:$(TARGET_COPY_OUT_VENDOR)/etc/port_20.bin \
    device/amlogic/txlx_t962x_r311/files/tv/tv_rrt_define.xml:$(TARGET_COPY_OUT_VENDOR)/etc/tv_rrt_define.xml
#txlx_t962x_r311 tuner
PRODUCT_COPY_FILES += \
    device/amlogic/txlx_t962x_r311/files/tv/si2151_fe.ko:root/boot/si2151_fe.ko

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_CHARACTERISTICS := txlx_t962x_r311,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/amlogic/txlx_t962x_r311/overlay

PRODUCT_TAGS += dalvik.gc.type-precise


# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# set default USB configuration
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

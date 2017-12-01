$(call inherit-product, device/amlogic/common/core_amlogic.mk)


#TV input HAL
#PRODUCT_PACKAGES += \
#    android.hardware.tv.input@1.0-impl \
#    android.hardware.tv.input@1.0-service \
#    tv_input.amlogic

# TV
#PRODUCT_PACKAGES += \
#    libtv \
#    libtv_linker \
#    libtvbinder \
#    libtv_jni \
#    tvserver \
#    libtvplay \
#    libTVaudio \
#    libntsc_decode \
#    libtinyxml \
#    libzvbi \
#    tv_input.amlogic \
#    droidlogic-tv \
#    TvProvider \
#    DroidLogicTvInput \
#    DroidLogicTvSource \
#    libhpeq.so \
#    libjnidtvsubtitle \
#    libjnidtvepgscanner
#
## DTV
#PRODUCT_PACKAGES += \
#	libam_adp \
#	libam_mw \
#	libam_ver \
#	libam_sysfs

PRODUCT_PACKAGES += \
    imageserver \
    busybox \
    utility_busybox

# DLNA
ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
PRODUCT_PACKAGES += \
    DLNA
endif

PRODUCT_PACKAGES += \
    remotecfg

USE_CUSTOM_AUDIO_POLICY := 1

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
# NativeImagePlayer
PRODUCT_PACKAGES += \
    NativeImagePlayer

#MboxLauncher
PRODUCT_PACKAGES += \
    MboxLauncher
endif

#droid vold
PRODUCT_PACKAGES += \
    droidvold

# Camera Hal
PRODUCT_PACKAGES += \
    camera.amlogic

PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=0

#Tvsettings
PRODUCT_PACKAGES += \
    TvSettings


#USB PM
PRODUCT_PACKAGES += \
    usbtestpm \
    usbpower

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.live_tv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.live_tv.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.xml \
    device/amlogic/common/android.software.leanback.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.leanback.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml
#copy lowmemorykiller.txt
ifeq ($(BUILD_WITH_LOWMEM_COMMON_CONFIG),true)
PRODUCT_COPY_FILES += \
	device/amlogic/common/config/lowmemorykiller_2G.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_2G.txt \
	device/amlogic/common/config/lowmemorykiller.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller.txt \
	device/amlogic/common/config/lowmemorykiller_512M.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_512M.txt
endif

#DDR LOG
PRODUCT_COPY_FILES += \
    device/amlogic/common/ddrtest.sh:$(TARGET_COPY_OUT_VENDOR)/bin/ddrtest.sh

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

custom_keylayouts := $(wildcard device/amlogic/common/keyboards/*.kl)
PRODUCT_COPY_FILES += $(foreach file,$(custom_keylayouts),\
    $(file):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $(file)))

# hdcp_tx22
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../hdcp_tx22/hdcp_tx22:$(TARGET_COPY_OUT_VENDOR)/bin/hdcp_tx22

# bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tv.mp4:$(TARGET_COPY_OUT_VENDOR)/etc/bootvideo

# default wallpaper for mbox to fix bug 106225
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default_wallpaper.png:$(TARGET_COPY_OUT_VENDOR)/etc/default_wallpaper.png

# Include BUILD_NUMBER if defined
VERSION_ID=$(shell find device/*/$(TARGET_PRODUCT) -name version_id.mk)
$(call inherit-product, $(VERSION_ID))

DISPLAY_BUILD_NUMBER := true

# default timezone
PRODUCT_PROPERTY_OVERRIDES += \
        persist.sys.timezone=Asia/Shanghai

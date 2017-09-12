$(call inherit-product, device/amlogic/common/core_amlogic.mk)

PRODUCT_BOOT_JARS += \
    droidlogic-tv

# TV
PRODUCT_PACKAGES += \
    libtv \
    libtv_linker \
    libtvbinder \
    libtv_jni \
    tvserver \
    libtvplay \
    libTVaudio \
    libntsc_decode \
    libtinyxml \
    libzvbi \
    tv_input.amlogic \
    droidlogic-tv \
    TvProvider \
    DroidLogicTvInput \
    DroidLogicTvSource \
    libhpeq.so \
    libjnidtvsubtitle \
    libjnidtvepgscanner

# DTV
PRODUCT_PACKAGES += \
	libam_adp \
	libam_mw \
	libam_ver \
	libam_sysfs

PRODUCT_PACKAGES += \
    imageserver \
    busybox \
    utility_busybox

# DLNA
PRODUCT_PACKAGES += \
    DLNA

PRODUCT_PACKAGES += \
    remotecfg

# HDMITX CEC HAL
PRODUCT_PACKAGES += \
    hdmi_cec.amlogic

USE_CUSTOM_AUDIO_POLICY := 1

ifneq ($(TARGET_BUILD_GOOGLE_ATV), true)
# NativeImagePlayer
PRODUCT_PACKAGES += \
    NativeImagePlayer

#MboxLauncher
PRODUCT_PACKAGES += \
    MboxLauncher
endif


# Camera Hal
PRODUCT_PACKAGES += \
    camera.amlogic

# HDMITX CEC HAL
PRODUCT_PACKAGES += \
    hdmi_cec \
    libhdmicec \
    libhdmicec_jni \
    hdmi_cec.amlogic

PRODUCT_PROPERTY_OVERRIDES += ro.hdmi.device_type=0

#Tvsettings
PRODUCT_PACKAGES += \
    TvSettings

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.live_tv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.live_tv.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.location.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.xml \
    device/amlogic/common/android.software.leanback.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.leanback.xml

#copy lowmemorykiller.txt
ifeq ($(BUILD_WITH_LOWMEM_COMMON_CONFIG),true)
PRODUCT_COPY_FILES += \
	device/amlogic/common/config/lowmemorykiller_2G.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_2G.txt \
	device/amlogic/common/config/lowmemorykiller.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller.txt \
	device/amlogic/common/config/lowmemorykiller_512M.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_512M.txt
endif

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

custom_keylayouts := $(wildcard $(LOCAL_PATH)/keyboards/*.kl)
PRODUCT_COPY_FILES += $(foreach file,$(custom_keylayouts),\
    $(file):$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/$(notdir $(file)))

# hdcp_rx key tools and firmware
PRODUCT_COPY_FILES += \
    device/amlogic/common/hdcp_rx22/hdcp_rx22:$(TARGET_COPY_OUT_VENDOR)/bin/hdcp_rx22 \
    device/amlogic/common/hdcp_rx22/arm_tools/aictool:$(TARGET_COPY_OUT_VENDOR)/bin/aictool \
    device/amlogic/common/hdcp_rx22/arm_tools/esm_swap:$(TARGET_COPY_OUT_VENDOR)/bin/esm_swap \
    device/amlogic/common/hdcp_rx22/arm_tools/hdcprxkeys:$(TARGET_COPY_OUT_VENDOR)/bin/hdcprxkeys \
    device/amlogic/common/hdcp_rx22/firmware/esm_config.i:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/hdcp_rx22/esm_config.i \
    device/amlogic/common/hdcp_rx22/firmware/firmware.rom:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/hdcp_rx22/firmware.rom \
    device/amlogic/common/hdcp_rx22/firmware/firmware.aic:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/hdcp_rx22/firmware.aic \
    device/amlogic/common/hdcp_rx22/firmware/firmware.le:$(TARGET_COPY_OUT_VENDOR)/etc/firmware/hdcp_rx22/firmware.le

# bootanimation
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bootanimation.zip:system/media/bootanimation.zip


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/tv.mp4:$(TARGET_COPY_OUT_VENDOR)/etc/bootvideo

# default wallpaper for mbox to fix bug 106225
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/default_wallpaper.png:$(TARGET_COPY_OUT_VENDOR)/etc/default_wallpaper.png

ADDITIONAL_BUILD_PROPERTIES += \
    ro.config.wallpaper=/vendor/etc/default_wallpaper.png

# Include BUILD_NUMBER if defined
VERSION_ID=$(shell find device/*/$(TARGET_PRODUCT) -name version_id.mk)
$(call inherit-product, $(VERSION_ID))

DISPLAY_BUILD_NUMBER := true

# default timezone
PRODUCT_PROPERTY_OVERRIDES += \
        persist.sys.timezone=Asia/Shanghai

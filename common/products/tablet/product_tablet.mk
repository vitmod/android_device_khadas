$(call inherit-product, device/amlogic/common/core_amlogic.mk)

PRODUCT_PACKAGES += \
    camera.amlogic \
    sensors.amlogic \
    busybox \
    utility_busybox

PRODUCT_PACKAGES += \
    BlockedNumberProvider \
    BookmarkProvider \
    HdmiSwitch \
    Calculator \
    ExactCalculator \
    Calendar \
    Email \
    PicoTts \
    PrintSpooler \
    PrintRecommendationService \
    QuickSearchBox \
    Telecom \
    TeleService \
    MmsService \
    DownloadProviderUi \
    MtpDocumentsProvider \
    ManagedProvisioning

#USB PM
PRODUCT_PACKAGES += \
    usbtestpm \
    usbpower

# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml

# Print
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml

# Device Admin
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml

#copy lowmemorykiller.txt
ifeq ($(BUILD_WITH_LOWMEM_COMMON_CONFIG),true)
PRODUCT_COPY_FILES += \
	device/amlogic/common/config/lowmemorykiller_2G.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_2G.txt \
	device/amlogic/common/config/lowmemorykiller.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller.txt \
	device/amlogic/common/config/lowmemorykiller_512M.txt:$(TARGET_COPY_OUT_VENDOR)/etc/lowmemorykiller_512M.txt
endif

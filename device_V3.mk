$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# The gps config appropriate for this device
# $(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/CXQ/V3/V3-vendor.mk)

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS += device/CXQ/V3/overlay

LOCAL_PATH := device/CXQ/V3
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += Torch

PRODUCT_PACKAGES += \
    libxlog

PRODUCT_PACKAGES += \
    lights.mt6582

# audio
PRODUCT_PACKAGES += \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    audio.primary.mt6582

PRODUCT_PACKAGES += \
    audio_policy.default

PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx

PRODUCT_COPY_FILES += \
    device/CXQ/V3/rootdir/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

PRODUCT_COPY_FILES += \
    device/CXQ/V3/rootdir/root/sbin/busybox:root/sbin/busybox \
    device/CXQ/V3/rootdir/root/fstab.mt6582:root/fstab.mt6582 \
    device/CXQ/V3/rootdir/root/init.recovery.mt6582.rc:root/init.recovery.mt6582.rc \
    device/CXQ/V3/rootdir/root/init.rc:root/init.rc \
    device/CXQ/V3/rootdir/root/init.mt6582.rc:root/init.mt6582.rc \
    device/CXQ/V3/rootdir/root/init.modem.rc:root/init.modem.rc \
    device/CXQ/V3/rootdir/root/ueventd.mt6582.rc:root/ueventd.mt6582.rc \
    device/CXQ/V3/rootdir/root/init.mt6582.usb.rc:root/init.mt6582.usb.rc \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
	device/CXQ/V3/rootdir/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
	device/CXQ/V3/rootdir/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/rootdir/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/rootdir/configs/media_profiles.xml:system/etc/media_profiles.xml

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_COPY_FILES += \
    packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

PRODUCT_PROPERTY_OVERRIDES := \
	ro.mediatek.version.release=ALPS.W10.24.p0 \
	ro.mediatek.platform=MT6582 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.version.branch=KK1.MP1 \
	ro.mediatek.version.sdk=2 \
	ro.telephony.sim.count=2 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.sys.usb.config=mtp,adb \
	persist.service.adb.enable=1 \
	persist.service.debuggable=1 \
	persist.mtk.wcn.combo.chipid=-1

PRODUCT_NAME := full_V3
PRODUCT_DEVICE := V3

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

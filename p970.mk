$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/p970/p970-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/p970/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/p970/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Dummy file to help RM identify the model
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/dummy-rm:root/bootimages/ON_480x800_08fps_0000.rle

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.p970.rc:root/init.rc \
    $(LOCAL_PATH)/ueventd.p970.rc:root/ueventd.lge.rc \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Headset hook
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/Hookkey.kl:system/usr/keylayout/Hookkey.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_very_low.rle:root/chargerimages/battery_very_low.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_01.rle:root/chargerimages/battery_wait_01.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/battery_wait_02.rle:root/chargerimages/battery_wait_02.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/charger_background.rle:root/chargerimages/charger_background.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/dummy_battery.rle:root/chargerimages/dummy_battery.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/lockscreen_charge_ani_no_battery.rle:root/chargerimages/lockscreen_charge_ani_no_battery.rle \
    $(LOCAL_PATH)/chargemode/chargerimages/white_lg_logo.rle:root/chargerimages/white_lg_logo.rle \
    $(LOCAL_PATH)/chargemode/chargerlogo:root/sbin/chargerlogo

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# RIL stuffs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ipc_channels.config:system/etc/ipc_channels.config \
    $(LOCAL_PATH)/init.vsnet:system/bin/init.vsnet

## GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps_brcm_conf.xml:system/etc/gps_brcm_conf.xml

## Wifi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifimac/wlan-precheck:system/bin/wlan-precheck \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wifi/nvram.txt \
    $(LOCAL_PATH)/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf

## Alsa configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf

PRODUCT_PACKAGES += \
    libskiahw \
    overlay.p970 \
    alsa.p970 \
    acoustics.default \
    libaudiomodemgeneric \
    prb \
    wifimac

# OMX components
PRODUCT_PACKAGES += \
    libbridge \
    cexec.out \
    libOMX_Core \
    libLCML \
    libOMX.TI.Video.Decoder \
    libOMX.TI.Video.encoder \
    libOMX.TI.WBAMR.decode \
    libOMX.TI.AAC.encode \
    libOMX.TI.G722.decode \
    libOMX.TI.MP3.decode \
    libOMX.TI.WMA.decode \
    libOMX.TI.Video.encoder \
    libOMX.TI.WBAMR.encode \
    libOMX.TI.G729.encode \
    libOMX.TI.AAC.decode \
    libOMX.TI.VPP \
    libOMX.TI.G711.encode \
    libOMX.TI.JPEG.encoder \
    libOMX.TI.G711.decode \
    libOMX.TI.ILBC.decode \
    libOMX.TI.ILBC.encode \
    libOMX.TI.AMR.encode \
    libOMX.TI.G722.encode \
    libOMX.TI.JPEG.decoder \
    libOMX.TI.G726.encode \
    libOMX.TI.G729.decode \
    libOMX.TI.Video.Decoder \
    libOMX.TI.AMR.decode \
    libOMX.TI.G726.decode

# OpenMAX IL configuration
TI_OMX_POLICY_MANAGER := hardware/ti/omx/system/src/openmax_il/omx_policy_manager
PRODUCT_COPY_FILES += \
    $(TI_OMX_POLICY_MANAGER)/src/policytable.tbl:system/etc/policytable.tbl \
    $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    libomap_mm_library_jni

FRAMEWORKS_BASE_SUBDIRS += \
    $(addsuffix /java, omapmmlib )

$(call inherit-product, build/target/product/full.mk)

PRODUCT_LOCALES += hdpi

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p970
PRODUCT_DEVICE := p970
PRODUCT_MODEL := LG Optimus Black

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

LOCAL_PATH := device/asus/A68

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

$(call inherit-product-if-exists, vendor/asus/A68/A68-vendor.mk)

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Ramdisk and Startup scripts
PRODUCT_PACKAGES += \
	fstab.qcom \
	init.asus.rc \
	init.asus.sdcard.sh \
	init.asus.usb.rc \
	init.qcom.class_core.sh \
	init.qcom.class_main.sh \
	init.qcom.sh \
	init.qcom.rc \
	init.qcom.usb.sh \
	init.qcom.usb.rc \
	init.target.rc \
	init.trace.rc \
	init.usb.rc \
	init.A68.bt.sh \
	init.recovery.A68.rc \
	ueventd.qcom.rc

# WiFi
PRODUCT_PACKAGES += wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/adbd:/recovery/root/sbin/adbd
#	$(LOCAL_PATH)/fstab.qcom:root/fstab.qcom \
#	$(LOCAL_PATH)/init.asus.rc:root/init.asus.rc \
#	$(LOCAL_PATH)/init.asus.sdcard.sh:root/init.asus.sdcard.sh \
#	$(LOCAL_PATH)/init.asus.usb.rc:root/init.asus.usb.rc \
#	$(LOCAL_PATH)/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
#	$(LOCAL_PATH)/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
#	$(LOCAL_PATH)/init.qcom.sh:root/init.qcom.sh \
#	$(LOCAL_PATH)/init.qcom.rc:root/init.qcom.rc \
#	$(LOCAL_PATH)/init.qcom.usb.sh:root/init.qcom.usb.sh \
#	$(LOCAL_PATH)/init.qcom.usb.rc:root/init.qcom.usb.rc \
#	$(LOCAL_PATH)/init.target.rc:root/init.target.rc \
#	$(LOCAL_PATH)/init.trace.rc:root/init.trace.rc \
#	$(LOCAL_PATH)/init.usb.rc:root/init.usb.rc \
#	$(LOCAL_PATH)/init.A68.bt.sh:root/init.A68.bt.sh \
#	$(LOCAL_PATH)/init.recovery.A68.rc:root/init.recovery.A68.rc \
#	$(LOCAL_PATH)/ueventd.qcom.rc:root/ueventd.qcom.rc \


# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/touch_dev.idc:system/usr/idc/touch_dev.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=480

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.adb.secure=0 \
	service.adb.enable=1 \
	persist.service.adb.enable=1 \
	debug.asus.adbenable=1

# Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += debug.mdpcomp.maxlayer=3

PRODUCT_TAGS += dalvik.gc.type-precise

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960

# AUDIO
PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler \
	tnymix

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.qcom

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

# Camera
PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

# OMX
PRODUCT_PACKAGES += \
	libdivxdrmdecrypt \
	libmm-omxcore \
	libOmxCore \
	libstagefrighthw \
	libOmxVdec \
	libOmxVenc \
	libOmxAacEnc \
	libOmxAmrEnc \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
	libdashplayer \
	libc2dcolorconvert

#PRODUCT_PACKAGES += \
#	mm-vdec-omx-test \
#	mm-venc-omx-test720p \
#	libdivxdrmdecrypt \
#	libOmxVdec \
#	libOmxVenc \
#	libOmxCore \
#	libstagefrighthw \
#	libc2dcolorconvert

# GPS
PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

# QCOM enhanced A/V
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true 

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, hardware/qcom/msm8960/msm8960.mk)

# $(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_A68
PRODUCT_DEVICE := A68

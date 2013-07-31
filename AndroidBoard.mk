# LOCAL_PATH := $(call my-dir)

# include $(CLEAR_VARS)

# ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
#-include vendor/asus/A68/AndroidBoardVendor.mk

ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := device/asus/A68/kernel
endif

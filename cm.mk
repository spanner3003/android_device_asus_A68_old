## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 768

# Inherit device configuration
$(call inherit-product, device/asus/A68/device.mk)

PRODUCT_RELEASE_NAME := A68

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := A68
PRODUCT_NAME := cm_A68
PRODUCT_BRAND := Android
PRODUCT_MODEL := A68
PRODUCT_MANUFACTURER := Asus

# Release name
PRODUCT_RELEASE_NAME := V3

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/CXQ/V3/device_V3.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := V3
PRODUCT_NAME := cm_V3
PRODUCT_BRAND := CXQ
PRODUCT_MODEL := V3
PRODUCT_MANUFACTURER := CXQ

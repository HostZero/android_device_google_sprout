# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Common Omni stuff
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/google/sprout/device.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0/MRA58M/2280749:user/release-keys PRIVATE_BUILD_DESC="sprout-user 6.0 MRA58M 2280749 release-keys"

PRODUCT_NAME := omni_sprout
PRODUCT_DEVICE := sprout
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := A1

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="sprout"

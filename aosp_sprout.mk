$(call inherit-product, device/google/sprout/full_sprout.mk)

# Correct bootanimation size for the screen
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Common Omni stuff
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=6.0/MRA58M/2280749:user/release-keys PRIVATE_BUILD_DESC="sprout-user 6.0 MRA58M 2280749 release-keys"

PRODUCT_NAME := aosp_sprout
PRODUCT_DEVICE := sprout
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on SPROUT
PRODUCT_MANUFACTURER := Google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE="sprout"

#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# common sprout
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.sprout:root/fstab.sprout \
    $(LOCAL_PATH)/init.sprout_common.rc:root/init.sprout_common.rc \
    $(LOCAL_PATH)/init.protect.rc:root/init.protect.rc \
    $(LOCAL_PATH)/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/ueventd.sprout.rc:root/ueventd.sprout.rc \
    $(LOCAL_PATH)/init.sprout.usb.rc:root/init.sprout.usb.rc
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.sprout.rc:recovery/root/init.sprout.rc \
    $(LOCAL_PATH)/fstab.sprout:recovery/root/fstab.sprout \
    $(LOCAL_PATH)/factory_init.rc:recovery/root/factory_init.rc \
    $(LOCAL_PATH)/init.modem.rc:recovery/root/init.modem.rc \
    $(LOCAL_PATH)/init.protect.rc:recovery/root/init.protect.rc \
    $(LOCAL_PATH)/init.sprout.usb.rc:recovery/root/init.sprout.usb.rc \
    $(LOCAL_PATH)/init.sprout_common.rc:recovery/root/init.sprout_common.rc \
    $(LOCAL_PATH)/ueventd.sprout.rc:recovery/root/ueventd.sprout.rc

# Dynamically set props
PRODUCT_SYSTEM_PROPERTY_BLACKLIST := \
    ro.product.name \
    ro.product.manufacturer \
    ro.product.model

#
# Copyright (C) 2015 The CyanogenMod Project
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

LOCAL_PATH := device/google/sprout

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# common sprout
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
       $(LOCAL_PATH)/prebuilt/kernel:kernel

# RECOVERYOTA
PRODUCT_PACKAGES += \
        RecoveryOTA

# RECOVERYOTA Dependencies
PRODUCT_PROPERTY_OVERRIDES += \
        ro.ota.recoveryname=TWRP_for_Android_One_First_Gen (sprout) \
        ro.ota.recoveryversion=3.0.2-8 \
        ro.ota.recoverymanifest=https://raw.githubusercontent.com/HostZero/OTA/master/twrp.xml

# prebuilt-binaries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/healthd:obj/EXECUTABLES/healthd_intermediates/LINKED/healthd

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/fstab.sprout:root/fstab.sprout \
    $(LOCAL_PATH)/recovery/root/init.sprout_common.rc:root/init.sprout_common.rc \
    $(LOCAL_PATH)/recovery/root/sbin/multi_init:root/sbin/multi_init \
    $(LOCAL_PATH)/recovery/root/init.protect.rc:root/init.protect.rc \
    $(LOCAL_PATH)/recovery/root/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/recovery/root/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.sprout.rc:root/ueventd.sprout.rc \
    $(LOCAL_PATH)/recovery/root/init.sprout.usb.rc:root/init.sprout.usb.rc
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.sprout.rc:recovery/root/init.sprout.rc \
    $(LOCAL_PATH)/recovery/root/fstab.sprout:recovery/root/fstab.sprout \
    $(LOCAL_PATH)/recovery/root/factory_init.rc:recovery/root/factory_init.rc \
    $(LOCAL_PATH)/recovery/root/init.modem.rc:recovery/root/init.modem.rc \
    $(LOCAL_PATH)/recovery/root/init.protect.rc:recovery/root/init.protect.rc \
    $(LOCAL_PATH)/recovery/root/init.sprout.usb.rc:recovery/root/init.sprout.usb.rc \
    $(LOCAL_PATH)/recovery/root/init.sprout_common.rc:recovery/root/init.sprout_common.rc \

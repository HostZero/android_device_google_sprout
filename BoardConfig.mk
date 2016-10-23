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

# inherit from common sprout repo

TARGET_OTA_ASSERT_DEVICE := sprout,sprout4,sprout8

TARGET_RECOVERY_FSTAB := device/google/sprout/fstab.sprout
BOARD_CUSTOM_BOOTIMG_MK := device/google/sprout/custombootimg.mk

LOCAL_PATH := device/google/sprout

# Architecture
TARGET_BOARD_PLATFORM := mt6582
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
ARCH_ARM_HAVE_VFP := true
TARGET_CPU_SMP := true
TARGET_ARCH := arm
ARCH_ARM_HAVE_NEON := true
TARGET_NO_BOOTLOADER := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Storage allocations
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00600000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 956964608
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# USERIMAGES
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel stuff
ifneq ($(RECOVERY_BUILDTYPE),UNOFFICIAL)
TARGET_PREBUILT_KERNEL := device/google/sprout/prebuilt/kernel
PRODUCT_COPY_FILES := \
	device/google/sprout/prebuilt/kernel:kernel
endif

ifneq ($(RECOVERY_BUILDTYPE),NIGHTLY)
TARGET_KERNEL_SOURCE := kernel/google/sprout
TARGET_KERNEL_CONFIG := sprout_defconfig
endif

ifneq ($(RECOVERY_BUILDTYPE),STABLE)
TARGET_KERNEL_SOURCE := kernel/google/sprout
TARGET_KERNEL_CONFIG := sprout_defconfig
KERNEL_TOOLCHAIN_PREFIX:=$(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/ubertc-5.3/bin/arm-linux-androideabi-
endif
BOARD_KERNEL_CMDLINE :=
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x04000000 --tags_offset 0x00000100
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

# TWRP flags
TW_THEME := portrait_mdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_MAX_BRIGHTNESS := 255
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_NO_USB_STORAGE := true
TW_NO_BATT_PERCENT := false
TW_NO_REBOOT_BOOTLOADER := false
TW_NO_REBOOT_RECOVERY := false
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp

TARGET_SYSTEM_PROP := device/google/sprout/system.prop

# SELinux (Using Prebuilt as Sepolicy for 14 is not open yet)
# BOARD_SEPOLICY_DIRS += \
#   device/google/sprout/sepolicy

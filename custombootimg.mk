LZMA_BIN := /usr/bin/lzma

LOCAL_PATH := $(call my-dir)

MKELF := device/google/sprout/tools/mkelf.py
INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel $(INSTALLED_RAMDISK_TARGET) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Boot image: $@")
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/ramdisk.img,ramdisk
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel)
        @echo -e ${PRT_IMG}"----- Compressing recovery ramdisk with lzma -----"${CL_RST}
       if [ -e $(recovery_uncompressed_ramdisk).lzma ] ;\
       then \
              rm $(recovery_uncompressed_ramdisk).lzma ;\
       fi;
	$(LZMA_BIN) $(recovery_uncompressed_ramdisk)
	$(hide) cp $(recovery_uncompressed_ramdisk).lzma $(recovery_ramdisk)
        @echo -e ${PRT_IMG}"----- Making recovery image ------"${CL_RST}
	$(hide) python $(MKELF) -o $@ $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/ramdisk-recovery.img,ramdisk
#	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)

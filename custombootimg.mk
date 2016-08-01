LZMA_BIN := /usr/bin/lzma

CL_GRN="\033[32m"
PRT_INS := $(CL_GRN)
PRT_IMG := $(CL_GRN)
CL_RST="\033[0m"


$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
        $(recovery_uncompressed_ramdisk) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${PRT_IMG}"----- Compressing recovery ramdisk with lzma ------"${CL_RST}
	$(LZMA_BIN) $(recovery_uncompressed_ramdisk)
	$(hide) cp $(recovery_uncompressed_ramdisk).lzma $(recovery_ramdisk)
	@echo -e ${PRT_IMG}"----- Making recovery image ------"${CL_RST}
	$(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${PRT_IMG}"----- Made recovery image: $@ --------"${CL_RST}


$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)

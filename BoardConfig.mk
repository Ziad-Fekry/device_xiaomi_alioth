#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8250-common
include device/xiaomi/sm8250-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/alioth

# Inherit from proprietary files for miuicamera
-include vendor/xiaomi/alioth-miuicamera/products/board.mk

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

BUILD_BROKEN_DUP_RULES := true

# Board
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# Display
TARGET_SCREEN_DENSITY := 420

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):init_xiaomi_alioth
TARGET_RECOVERY_DEVICE_MODULES := init_xiaomi_alioth

# Kernel
TARGET_KERNEL_CONFIG := vendor/alioth_defconfig

# OTA assert
TARGET_OTA_ASSERT_DEVICE := alioth,aliothin

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Shims
TARGET_LD_SHIM_LIBS := \
    system/lib64/libcameraservice.so|libmedia_jni_shim.so \
	system/lib64/libcamera_algoup_jni.xiaomi.so|libmedia_jni_shim.so \
	system/lib64/libcamera_mianode_jni.xiaomi.so|libmedia_jni_shim.so

# Inherit from the proprietary version
include vendor/xiaomi/alioth/BoardConfigVendor.mk

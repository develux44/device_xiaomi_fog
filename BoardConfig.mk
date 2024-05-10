# Copyright (C) 2023 Paranoid Android
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

# Disable sparse for ext/f2fs images
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true
TARGET_USERIMAGES_SPARSE_F2FS_DISABLED := true

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/tp_gesture"

DEVICE_PATH := device/xiaomi/fog

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

PRODUCT_MANIFEST_SKUS += c3qn
PRODUCT_MANIFEST_C3QN_FILES := $(DEVICE_PATH)/configs/hidl/manifest_c3qn.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_fog
TARGET_RECOVERY_DEVICE_MODULES := libinit_fog

# Kernel
BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)-kernel/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img

# OTA assert
TARGET_OTA_ASSERT_DEVICE := fog

# Screen density
TARGET_SCREEN_DENSITY := 320

HWUI_COMPILE_FOR_PERF := true

# Kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_IMAGE_NAME  := Image.gz
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_TAGS_OFFSET        := 0x00000100

BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_PREBUILT_DTBOIMAGE := device/xiaomi/fog-kernel/dtbo.img
BOARD_KERNEL_CMDLINE += \
    androidboot.init_fatal_reboot_target=recovery \
    androidboot.memcg=1 \
    androidboot.usbcontroller=4e00000.dwc3 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=2048

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := vendor/fog-perf_defconfig
TARGET_KERNEL_HEADERS := kernel/xiaomi/fog
TARGET_KERNEL_SOURCE := kernel/xiaomi/fog
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_LINUX_KERNEL_VERSION := 4.19

BOARD_USES_QCOM_HARDWARE := true

# Inherit from the proprietary version
include vendor/xiaomi/fog/BoardConfigVendor.mk

# Inherit from sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

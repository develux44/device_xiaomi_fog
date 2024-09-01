


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

DEVICE_PATH := device/xiaomi/fog

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

#ART
#ART_BUILD_TARGET_NDEBUG := true
#ART_BUILD_TARGET_DEBUG := false
#ART_BUILD_HOST_NDEBUG := true
#ART_BUILD_HOST_DEBUG := false

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/proc/tp_gesture"

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_framework_compatibility_matrix.xml
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_fog
TARGET_RECOVERY_DEVICE_MODULES := libinit_fog


# # Kernel
# BOARD_BOOT_HEADER_VERSION := 3
# BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
# BOARD_MKBOOTIMG_ARGS += --dtb $(DEVICE_PATH)-kernel/dtb.img
# TARGET_PREBUILT_KERNEL := 
#BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)-kernel/dtbo.img

# BOARD_KERNEL_BASE        := 0x00000000
# BOARD_KERNEL_IMAGE_NAME  := Image
# BOARD_KERNEL_OFFSET      := 0x00008000
# BOARD_KERNEL_PAGESIZE    := 4096
# BOARD_RAMDISK_OFFSET     := 0x01000000
# BOARD_TAGS_OFFSET        := 0x00000100

# BOARD_KERNEL_CMDLINE += \
#     androidboot.console=ttyMSM0 \
#     androidboot.fstab_suffix=qcom \
#     androidboot.init_fatal_reboot_target=recovery \
#     androidboot.hardware=qcom \
#     androidboot.memcg=1 \
#     androidboot.usbcontroller=4e00000.dwc3 \
#     console=ttyMSM0,115200n8 \
#     earlycon=msm_geni_serial,0x4a90000 \
#     loop.max_part=7 \
#     lpm_levels.sleep_disabled=1 \
#     msm_rtb.filter=0x237 \
#     service_locator.enable=1 \
#     swiotlb=2048 \
#     kpti=off

# Kernel
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_IMAGE_NAME  := Image.gz
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_RAMDISK_OFFSET     := 0x01000000
BOARD_TAGS_OFFSET        := 0x00000100

BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)

#BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
TARGET_PREBUILT_DTB := $(DEVICE_PATH)-kernel/dtb.img

BOARD_KERNEL_CMDLINE += \
    androidboot.hardware=qcom \
    androidboot.memcg=1 \
    androidboot.usbcontroller=4e00000.dwc3 \
    loop.max_part=7 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=2048 \
    kpri=off \
    cgroup_disable=pressure

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := vendor/fog-perf_defconfig
TARGET_KERNEL_HEADERS := kernel/xiaomi/fog
TARGET_KERNEL_SOURCE := kernel/xiaomi/fog
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_LINUX_KERNEL_VERSION := 4.19

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_USERDATAIMAGE_PARTITION_SIZE := 114553663488
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9122611200 # BOARD_SUPER_PARTITION_SIZE - 4MB

ifneq ($(TARGET_DISABLES_GMS),true)
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 104857600
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 104857600
else
BOARD_PRODUCTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 629145600
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 419430400
BOARD_SYSTEM_EXTIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 419430400
endif
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 104857600

BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_VENDOR := vendor

# # Kernel
# BOARD_INCLUDE_DTB_IN_BOOTIMG := true
# KERNEL_DEFCONFIG := vendor/fog-perf_defconfig
# KERNEL_CUSTOM_LLVM := true
# KERNEL_FULL_LLVM := true
# TARGET_KERNEL_SOURCE := kernel/xiaomi/sm6225

# BOARD_KERNEL_CMDLINE +=  init.is_dt2w_sensor=1
# BOARD_KERNEL_CMDLINE +=  init.is_st2w_sensor=1

# OTA assert
TARGET_OTA_ASSERT_DEVICE := fog,rain,wind

# Screen density
TARGET_SCREEN_DENSITY := 300

# Sensors
# SOONG_CONFIG_NAMESPACES += SENSORS_XIAOMI
# SOONG_CONFIG_SENSORS_XIAOMI += USES_DOUBLE_TAP_SENSOR
# SOONG_CONFIG_SENSORS_XIAOMI_USES_DOUBLE_TAP_SENSOR := true
# SOONG_CONFIG_SENSORS_XIAOMI += USES_SINGLE_TAP_SENSOR
# SOONG_CONFIG_SENSORS_XIAOMI_USES_SINGLE_TAP_SENSOR := true

# Changes from CLO and Notkerd69
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Inherit from the proprietary version
include vendor/xiaomi/fog/BoardConfigVendor.mk

# Inherit from sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk

# Copyright (C) 2023 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
LOC_HIDL_VERSION := 4.0

VENDOR_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

RODUCT_PACKAGES += \
    libstdc++_vendor \
    android.hardware.biometrics.fingerprint@2.1-service \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \

PRODUCT_PACKAGES += \
    sensors.xiaomi \
    android.hardware.bluetooth.audio-impl \
    android.hardware.bluetooth.audio-impl-qti


VENDOR_PROPERTY_OVERRIDES += \
    vendor.display.enable_async_powermode=0 \
    debug.renderengine.backend=skiaglthreaded \
    ro.hwui.render_ahead=20

PRODUCT_PRODUCT_PROPERTIES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.wfc_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1

# GFX
PRODUCT_VENDOR_PROPERTIES += \
    ro.config.avoid_gfx_accel=true

PRODUCT_PACKAGES += \
    vendor.qti.hardware.iop@2.0 \
    vendor.qti.hardware.iop@2.0-service \
    vendor.qti.hardware.iop@2.0-impl

# API Level
PRODUCT_SHIPPING_API_LEVEL := 30

# AB
TARGET_IS_VAB := true
PRODUCT_VIRTUAL_AB_OTA := true

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_bengal_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp_india.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1650
TARGET_SCREEN_WIDTH := 720

# Camera
PRODUCT_PACKAGES += \
    libpiex_shim

# Init script
PRODUCT_PACKAGES += \
    init.device.rc

# FUSE passthrough
PRODUCT_SYSTEM_PROPERTIES += \
    persist.sys.fuse.passthrough.enable=true

# Kernel

# Media
PRODUCT_PRODUCT_PROPERTIES += \
    media.settings.xml=/vendor/etc/media_profiles_khaje.xml

# NFC
TARGET_COMMON_QTI_COMPONENTS += \
    nfc

TARGET_COMMON_QTI_COMPONENTS += \
    adreno \
    alarm \
    audio \
    av \
    bt \
    display \
    gps \
    init \
    media \
    nfc \
    overlay \
    perf \
    telephony \
    vibrator \
    wfd \
    wlan 

TARGET_NFC_SKU :=  c3qn

PRODUCT_PACKAGES += \
    libchrome.vendor \
    SecureElement \
    vendor.nxp.hardware.nfc@2.0-service

PRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C \
    ro.hardware.nfc_nci=pn8x

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/nfc/,$(TARGET_COPY_OUT_VENDOR)/etc)

# Overlays
PRODUCT_PACKAGES += \
    AOSPAFogFrameworksOverlay \
    FogFrameworksOverlay \
    FogPowerFrameworksOverlay \
    FogSettingsOverlay \
    FogSystemUIOverlay \
    FogWifiOverlay \
    SettingsProvider220333QAGOverlay \
    SettingsProvider220333QLOverlay \
    SettingsProvider220333QBIOverlay \
    SettingsProvider220333QNYOverlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib/libhidlbase-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# Health
TARGET_USE_HIDL_QTI_HEALTH := true

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/fog/fog-vendor.mk)

# Inherit from sm6225-common
$(call inherit-product, device/xiaomi/sm6225-common/common.mk)

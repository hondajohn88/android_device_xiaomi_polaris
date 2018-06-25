# Copyright (C) 2010 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

include build/make/target/board/generic_arm64/BoardConfig.mk
BOARD_VENDOR := xiaomi
BOARD_PATH := device/xiaomi/polaris

PRODUCT_FULL_TREBLE := true
BOARD_VNDK_VERSION := current
PRODUCT_SHIPPING_API_LEVEL := 27
TARGET_NO_KERNEL := false
BOARD_AVB_ENABLE := false
BOARD_BUILD_DISABLED_VBMETAIMAGE := true
BOARD_SEPOLICY_VERS := 30
BOARD_USES_VENDORIMAGE := true

TARGET_USE_SDCLANG := true
TARGET_OTA_ASSERT_DEVICE := polaris
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_CLANG_COMPILE := false
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true
#TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
TARGET_NEEDS_DTBOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := sdm845
TARGET_BOARD_PLATFORM_GPU := qcom-adreno630

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true
TARGET_COMPILE_WITH_MSM_KERNEL := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0xA84000 androidboot.hardware=qcom androidboot.console=ttyMSM0 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 service_locator.enable=1 swiotlb=2048 androidboot.configfs=true androidboot.usbcontroller=a600000.dwc3 buildvariant=user
BOARD_KERNEL_BASE 00000000
BOARD_PAGE_SIZE 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_APPEND_DTB := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/sdm845
TARGET_KERNEL_CONFIG := polaris_user_defconfig

BOARD_CUSTOM_BOOTIMG_MK := $(PLATFORM_PATH)/mkbootimg.mk
TARGET_PREBUILT_KERNEL := vendor/xiaomi/polaris/zImage

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144

BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 57453555712
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_PARTITION_SIZE := 788529152
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# global
TARGET_SPECIFIC_HEADER_PATH := $(BOARD_PATH)/include
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := false
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false

# Camera
TARGET_USES_QTI_CAMERA2CLIENT := true
USE_CAMERA_STUB := true
TARGET_USES_MEDIA_EXTENSIONS := false
BOARD_USES_SNAPDRAGONCAMERA_VERSION := 2

# Disable secure discard because it's SLOW
BOARD_SUPPRESS_SECURE_ERASE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(BOARD_PATH)/bluetooth
QCOM_BT_USE_BTNV := true
TARGET_QCOM_BLUETOOTH_VARIANT := caf-msm8998

# Wifi
TARGET_USES_QCOM_WCNSS_QMI       := false
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_FW_PATH_P2P          := "p2p"
#WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME          := "wlan"
#WIFI_DRIVER_MODULE_ARG           := ""
WIFI_DRIVER_STATE_CTRL_PARAM     := "/dev/wlan"
WIFI_DRIVER_STATE_ON             := "ON"
WIFI_DRIVER_STATE_OFF            := "OFF"
WIFI_DRIVER_BUILT                := qca_cld3
WIFI_DRIVER_DEFAULT              := qca_cld3
WIFI_HIDL_FEATURE_AWARE          := true
#WIFI_DRIVER_LOAD_DELAY           := true

CONFIG_ACS := true
CONFIG_IEEE80211AC := true

# charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_DISABLE_INIT_BLANK := true
HEALTHD_ENABLE_OP_FASTCHG_CHECK := true

# power hal
#TARGET_PROVIDES_POWERHAL := true
TARGET_USES_INTERACTION_BOOST := false

# NFC
TARGET_USES_NQ_NFC := true
BOARD_NFC_CHIPSET := pn553
NQ3XX_PRESENT := true
BOARD_NFC_HAL_SUFFIX := $(TARGET_BOARD_PLATFORM)

# ANT+
TARGET_USES_PREBUILT_ANT := true
BOARD_ANT_WIRELESS_DEVICE := "qualcomm-hidl"

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/config.fs

# Crypto
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := $(BOARD_PATH)/cryptfs_hw

#vold
TARGET_KERNEL_HAVE_NTFS := true
TARGET_KERNEL_HAVE_EXFAT := true

# CNE and DPM
#TARGET_LDPRELOAD := libNimsWrap.so
BOARD_USES_QCNE := true

TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# selinux
include device/qcom/sepolicy/sepolicy.mk
include vendor/omni/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

BOARD_SECCOMP_POLICY += $(DEVICE_PATH)/seccomp_policy

# for offmode charging
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE := 1056714752
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x04000000

BOARD_AVB_ENABLE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

BOARD_ROOT_EXTRA_SYMLINKS := /vendor/lib/dsp:/dsp

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# inherit from Oppo common
#-include device/oppo/common/BoardConfigCommon.mk

PLATFORM_PATH := device/oneplus/onyx

# Assertions
TARGET_BOARD_INFO_FILE ?= $(PLATFORM_PATH)/board-info.txt

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974

BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_PHONY_TARGETS := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=23 msm_rtb.filter=0x3b7 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := onyx_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/onyx

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# ART
TARGET_HAS_MEMFD_BACKPORT := true

# Assert
TARGET_OTA_ASSERT_DEVICE := onyx,OnePlus,E1003,ONE

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_KERNEL_CMDLINE += androidboot.btmacaddr=00:00:00:00:00:00


# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_PROCESS_SDK_VERSION_OVERRIDE := \
    /system/bin/cameraserver=22 \
    /system/bin/mediaserver=22 \
    /system/vendor/bin/mm-qcamera-daemon=22

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_ROOT_EXTRA_FOLDERS := firmware persist
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2147483648
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12611874816
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Filesystem
TARGET_FS_CONFIG_GEN := $(PLATFORM_PATH)/config.fs

# FM
BOARD_HAVE_QCOM_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Graphics
HAVE_ADRENO_SOURCE := false
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x02000000U
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USE_COMPAT_GRALLOC_PERFORM := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Init
TARGET_INIT_VENDOR_LIB := libinit_onyx
TARGET_RECOVERY_DEVICE_MODULES := libinit_onyx

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Power
TARGET_HAS_LEGACY_POWER_STATS := true
TARGET_HAS_NO_WLAN_STATS := true
TARGET_USES_INTERACTION_BOOST := true
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/double_tap_enable"

# Protobuf-c
PROTOBUF_SUPPORTED := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# SELinux
# include device/qcom/sepolicy/sepolicy.mk
 #include device/qcom/sepolicy/legacy-sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy_tmp

# SHIMS
TARGET_LD_SHIM_LIBS := \
    /system/lib/libgui.so|libshims_sensors.so \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshims_camera.so \
    /system/vendor/lib/hw/camera.vendor.msm8974.so|libshims_camera_parameters.so \
    /system/vendor/lib/libmmcamera2_stats_algorithm.so|libshims_atomic.so

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2016-11-10

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
PRODUCT_VENDOR_MOVE_ENABLED := true
TARGET_DISABLE_WCNSS_CONFIG_COPY := true
TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_MAC_ADDR_REV := true
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_HIDL_FEATURE_DISABLE_AP_MAC_RANDOMIZATION := true
WPA_SUPPLICANT_VERSION := VER_0_8_X

-include vendor/oneplus/onyx/BoardConfigVendor.mk

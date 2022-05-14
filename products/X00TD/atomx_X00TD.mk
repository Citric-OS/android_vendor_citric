#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

ifeq (atomx_X00TD,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Inherit from the AtomX configuration.
$(call inherit-product, vendor/atomx/target/product/atomx-target.mk)

# Inherit from X00TD device
$(call inherit-product, device/asus/X00TD/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := atomx_X00TD
PRODUCT_DEVICE := X00TD
PRODUCT_BRAND := asus
PRODUCT_MODEL := Zenfone Max Pro M1
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_X00T \
    PRODUCT_NAME=WW_X00T

# Boot animation resolution.
TARGET_BOOT_ANIMATION_RES := 1080

# The AtomX Project Official
ATOMX_BUILD_TYPE := OFFICIAL

endif

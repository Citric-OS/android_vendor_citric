#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AtomX Versioning
$(call inherit-product, vendor/atomx/target/product/version.mk)

# Bootanimation
$(call inherit-product, vendor/atomx/bootanimation/bootanimation.mk)

# Don't dexpreopt prebuilts. (For GMS).
DONT_DEXPREOPT_PREBUILTS := true

# Filesystem
TARGET_FS_CONFIG_GEN += vendor/atomx/target/config/config.fs

# Include Common Qualcomm Device Tree
$(call inherit-product, device/qcom/common/common.mk)

# Include definitions for Snapdragon Clang
$(call inherit-product, vendor/qcom/sdclang/config/SnapdragonClang.mk)

# Include GMS, Modules and Pixel features
$(call inherit-product, vendor/google/gms/config.mk)
$(call inherit-product-if-exists, vendor/google/modules/build/mainline_modules_s.mk)
$(call inherit-product, vendor/google/pixel/config.mk)

# Include Overlay makefile
$(call inherit-product, vendor/atomx/overlay/overlays.mk)

# Include Packages makefile
$(call inherit-product, vendor/atomx/target/product/packages.mk)

# Include Properties makefile
$(call inherit-product, vendor/atomx/target/product/properties.mk)

# Include SEPolicy makefile.
$(call inherit-product, vendor/atomx/sepolicy/sepolicy.mk)

# Move Wi-Fi modules to vendor
PRODUCT_VENDOR_MOVE_ENABLED := true

# Permissions
PRODUCT_COPY_FILES += \
    vendor/atomx/target/config/permissions/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/atomx/target/config/permissions/privapp-permissions-hotword.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-hotword.xml \
    vendor/atomx/target/config/permissions/qti_whitelist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/qti_whitelist.xml

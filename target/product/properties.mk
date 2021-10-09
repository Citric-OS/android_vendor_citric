#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable Navigation gestures.
PRODUCT_PRODUCT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.gestural

# Enforce privapp-permissions whitelist.
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.control_privapp_permissions=enforce

# Disable blur on app-launch
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.launcher.blur.appLaunch=0

# Disable async MTE on system_server
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    arm64.memtag.process.system_server=off

# Enable dex2oat64 to do dexopt
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    dalvik.vm.dex2oat64.enabled=true

# Enable IORap I/O Prefetching
PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native_boot.iorap_perfetto_enable=true

# Enable one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

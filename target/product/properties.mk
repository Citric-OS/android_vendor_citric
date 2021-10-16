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

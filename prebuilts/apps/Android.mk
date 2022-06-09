#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := Camera
LOCAL_MODULE_CLASS := APPS
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := Camera.apk
LOCAL_OVERRIDES_PACKAGES := Camera2
LOCAL_OPTIONAL_USES_LIBRARIES := androidx.camera.extensions.impl

include $(BUILD_PREBUILT)

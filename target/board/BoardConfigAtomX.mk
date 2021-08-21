#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Disable EAP Proxy because it depends on proprietary headers
# and breaks WPA Supplicant compilation.
DISABLE_EAP_PROXY := true

# Include our Qualcomm Board configuration.
include device/qcom/common/BoardConfigQcom.mk

# Kernel configuration.
include vendor/atomx/target/board/BoardConfigKernel.mk

# Soong
include vendor/atomx/target/board/BoardConfigSoong.mk

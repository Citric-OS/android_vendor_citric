#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Product Makefiles
PRODUCT_MAKEFILES += \
    $(LOCAL_DIR)/X00TD/atomx_X00TD.mk \
    $(LOCAL_DIR)/X01BD/atomx_X01BD.mk

# Lunch targets
COMMON_LUNCH_CHOICES += \
    atomx_X00TD-userdebug \
    atomx_X01BD-userdebug

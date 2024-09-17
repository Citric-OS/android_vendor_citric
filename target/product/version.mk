#
# Copyright (C) 2024 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

#
# Handle various build version information.
#
# Guarantees that the following are defined:
#     ATOMX_MAJOR_VERSION
#     ATOMX_MINOR_VERSION
#     ATOMX_BUILD_VARIANT
#

# This is the global ATOMX version flavor that determines the focal point
# behind our releases. This is bundled alongside $(ATOMX_MINOR_VERSION)
# and only changes per major Android releases.
ATOMX_MAJOR_VERSION := void

# The version code is the upgradable portion during the cycle of
# every major Android release. Each version code upgrade indicates
# our own major release during each lifecycle.
# It is based in three parts
# X for SPL changes, Y for week, and Z for hotfix.
ifdef ATOMX_BUILDVERSION
    ATOMX_MINOR_VERSION := $(ATOMX_BUILDVERSION)
endif

# Build Variants
#
# Alpha: Development / Test releases
# Beta: Public releases with CI
# Stable: Final Product | No Tagging
OFFICIAL_DEVICES = $(shell cat vendor/atomx/products/atomx.devices)
FOUND_DEVICE =  $(filter $(ATOMX_BUILD), $(OFFICIAL_DEVICES))
ifdef ATOMX_BUILDTYPE
  ifeq ($(FOUND_DEVICE),$(ATOMX_BUILD))
    ifeq ($(ATOMX_BUILDTYPE), ALPHA)
        ATOMX_BUILD_VARIANT := alpha
    else ifeq ($(ATOMX_BUILDTYPE), BETA)
        ATOMX_BUILD_VARIANT := beta
    else ifeq ($(ATOMX_BUILDTYPE), STABLE)
        ATOMX_BUILD_VARIANT := stable
    endif
  else
    ATOMX_BUILD_VARIANT := unofficial
  endif
else
ATOMX_BUILD_VARIANT := unofficial
endif

# Build Date
BUILD_DATE := $(shell date -u +%Y%m%d)

# AtomX Version
ATOMX_VERSION := $(ATOMX_MAJOR_VERSION)-
ATOMX_DISPLAY_VERSION := $(shell V1=$(ATOMX_MAJOR_VERSION); echo -n $${V1^})

ifeq ($(filter stable,$(ATOMX_BUILD_VARIANT)),)
    ATOMX_VERSION += $(ATOMX_BUILD_VARIANT)-
    ATOMX_DISPLAY_VERSION += $(shell V1=$(ATOMX_BUILD_VARIANT); echo -n $${V1^})
else
    ATOMX_VERSION += $(ATOMX_MINOR_VERSION)-
    ATOMX_DISPLAY_VERSION += $(ATOMX_MINOR_VERSION)
endif

# Add BUILD_DATE for zip naming
ATOMX_VERSION += $(ATOMX_BUILD)-$(BUILD_DATE)

# Remove unwanted characters for zip naming
ATOMX_VERSION := $(shell echo -n $(ATOMX_VERSION) | tr -d '[:space:]')

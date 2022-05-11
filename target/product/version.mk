#
# Copyright (C) 2022 The AtomX Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Versioning System
ATOMX_CODENAME := Scarlet
ATOMX_MAJOR_VERSION := 1
ATOMX_BUILD_VARIANT := Beta
ATOMX_BUILD_TYPE ?= UNOFFICIAL

# AtomX Release
ifeq ($(ATOMX_BUILD_TYPE), OFFICIAL)
  OFFICIAL_DEVICES = $(shell cat vendor/atomx/products/atomx.devices)
  FOUND_DEVICE =  $(filter $(ATOMX_BUILD), $(OFFICIAL_DEVICES))
    ifeq ($(FOUND_DEVICE),$(ATOMX_BUILD))
      ATOMX_BUILD_TYPE := OFFICIAL
    else
      ATOMX_BUILD_TYPE := UNOFFICIAL
      $(error Device is not official "$(ATOMX_BUILD)")
    endif
endif

# System version
TARGET_PRODUCT_SHORT := $(subst atomx_,,$(ATOMX_BUILD_TYPE))

ATOMX_DATE_YEAR := $(shell date -u +%Y)
ATOMX_DATE_MONTH := $(shell date -u +%m)
ATOMX_DATE_DAY := $(shell date -u +%d)
ATOMX_DATE_HOUR := $(shell date -u +%H)
ATOMX_DATE_MINUTE := $(shell date -u +%M)

ATOMX_BUILD_DATE := $(ATOMX_DATE_YEAR)$(ATOMX_DATE_MONTH)$(ATOMX_DATE_DAY)-$(ATOMX_DATE_HOUR)$(ATOMX_DATE_MINUTE)
ATOMX_BUILD_VERSION := $(ATOMX_BUILD_VARIANT)-$(ATOMX_MAJOR_VERSION)
ATOMX_VERSION := AtomX-$(ATOMX_CODENAME)-$(ATOMX_BUILD_VERSION)-$(ATOMX_BUILD)-$(ATOMX_BUILD_TYPE)-$(ATOMX_BUILD_DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.atomx.codename=$(ATOMX_CODENAME) \
  ro.atomx.device=$(ATOMX_BUILD) \
  ro.atomx.version=$(ATOMX_VERSION) \
  ro.atomx.version.major=$(ATOMX_MAJOR_VERSION) \
  ro.atomx.build.date=$(ATOMX_BUILD_DATE) \
  ro.atomx.build.type=$(ATOMX_BUILD_TYPE) \
  ro.atomx.build.variant=$(ATOMX_BUILD_VARIANT) \
  ro.atomx.build.version=$(ATOMX_BUILD_VERSION)

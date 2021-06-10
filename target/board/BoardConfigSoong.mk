# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

# AtomX Variable

SOONG_CONFIG_NAMESPACES += atomxVarsPlugin

SOONG_CONFIG_atomxVarsPlugin :=

define addVar
  SOONG_CONFIG_atomxVarsPlugin += $(1)
  SOONG_CONFIG_atomxVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += atomxGlobalVars
SOONG_CONFIG_atomxGlobalVars += \
    needs_camera_boottime \
    target_init_vendor_lib \
    target_ld_shim_libs \
    target_process_sdk_version_override \
    target_surfaceflinger_udfps_lib

# Set default values
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_SURFACEFLINGER_UDFPS_LIB ?= surfaceflinger_udfps_lib

# Soong value variables
SOONG_CONFIG_atomxGlobalVars_needs_camera_boottime := $(TARGET_CAMERA_BOOTTIME_TIMESTAMP)
SOONG_CONFIG_atomxGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_atomxGlobalVars_target_ld_shim_libs := $(subst $(space),:,$(TARGET_LD_SHIM_LIBS))
SOONG_CONFIG_atomxGlobalVars_target_process_sdk_version_override := $(TARGET_PROCESS_SDK_VERSION_OVERRIDE)
SOONG_CONFIG_atomxGlobalVars_target_surfaceflinger_udfps_lib := $(TARGET_SURFACEFLINGER_UDFPS_LIB)

# Gestures
define add-gesturevar-if-exist
$(eval vn := $(shell echo $(1) | tr '[:upper:]' '[:lower:]'))
$(if $($(1)), \
  $(eval SOONG_CONFIG_atomxGestureVars += $(vn)) \
  $(eval SOONG_CONFIG_atomxGestureVars_$(vn) := $(patsubst "%",%,$($(1)))) \
)
endef

SOONG_CONFIG_NAMESPACES += atomxGestureVars
SOONG_CONFIG_atomxGestureVars :=
GESTURE_SOONG_VARS := \
    TARGET_GESTURES_NODE \
    TARGET_TAP_TO_WAKE_NODE \
    TARGET_TAP_TO_WAKE_EVENT_NODE \
    TARGET_DRAW_V_NODE \
    TARGET_DRAW_INVERSE_V_NODE \
    TARGET_DRAW_O_NODE \
    TARGET_DRAW_M_NODE \
    TARGET_DRAW_W_NODE \
    TARGET_DRAW_ARROW_LEFT_NODE \
    TARGET_DRAW_ARROW_RIGHT_NODE \
    TARGET_ONE_FINGER_SWIPE_UP_NODE \
    TARGET_ONE_FINGER_SWIPE_RIGHT_NODE \
    TARGET_ONE_FINGER_SWIPE_DOWN_NODE \
    TARGET_ONE_FINGER_SWIPE_LEFT_NODE \
    TARGET_TWO_FINGER_SWIPE_NODE \
    TARGET_DRAW_S_NODE \
    TARGET_SINGLE_TAP_TO_WAKE_NODE \
    TARGET_POWER_FEATURE_EXT_LIB

$(foreach v,$(GESTURE_SOONG_VARS),$(eval $(call add-gesturevar-if-exist,$(v))))

# Qualcomm variables
SOONG_CONFIG_NAMESPACES += aosp_vs_qva
SOONG_CONFIG_aosp_vs_qva += aosp_or_qva
SOONG_CONFIG_aosp_vs_qva_aosp_or_qva := qva

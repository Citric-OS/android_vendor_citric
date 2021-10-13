# Rules for QCOM targets
include $(TOPDIR)vendor/citric/build/core/qcom_target.mk

# We modify several neverallows, so let the build proceed
SELINUX_IGNORE_NEVERALLOWS := true

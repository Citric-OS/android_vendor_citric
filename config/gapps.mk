# Gapps
ifeq ($(WITH_GAPPS),true)
$(call inherit-product, vendor/gapps/config.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/citric/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/citric/overlay-gapps

$(call inherit-product, vendor/citric/config/rro_overlays.mk)
endif

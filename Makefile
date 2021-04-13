export TARGET = iphone:clang:latest
export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HiddenPhotosCC
HiddenPhotosCC_BUNDLE_EXTENSION = bundle
HiddenPhotosCC_FILES = HiddenPhotosCC.x
HiddenPhotosCC_CFLAGS = -fobjc-arc
HiddenPhotosCC_PRIVATE_FRAMEWORKS = ControlCenterUIKit
HiddenPhotosCC_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk

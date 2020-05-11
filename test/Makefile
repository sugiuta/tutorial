
ARCHS = arm64 arm64e
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = test
test_FILES = test.m
test_INSTALL_PATH = /Library/PreferenceBundles
test_FRAMEWORKS = UIKit
test_PRIVATE_FRAMEWORKS = Preferences BackBoardServices
test_EXTRA_FRAMEWORKS += CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/test.plist$(ECHO_END)
include $(THEOS_MAKE_PATH)/aggregate.mk

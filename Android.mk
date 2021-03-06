#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),x2)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)


IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(IMS_SYMLINKS)


#ADSP_IMAGES := adsp.b00 adsp.b01 adsp.b02 adsp.b03 adsp.b04 adsp.b05 adsp.b06 adsp.b08 adsp.b09 adsp.mdt
#ADSP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(ADSP_IMAGES)))
#$(ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
#	@echo "ADSP firmware link: $@"
#	@mkdir -p $(dir $@)
#	@rm -rf $@
#	$(hide) ln -sf /firmware/image/$(notdir $@) $@
#
#ALL_DEFAULT_INSTALLED_MODULES += $(ADSP_SYMLINKS)


FIDOTAP_IMAGES := fidotap.b00 fidotap.b01 fidotap.b02 fidotap.b03 fidotap.b04 fidotap.b05 fidotap.b06 fidotap.mdt
FIDOTAP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(FIDOTAP_IMAGES)))
$(FIDOTAP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "FIDOTAP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(FIDOTAP_SYMLINKS)


MDTP_IMAGES := mdtp.b00 mdtp.b01 mdtp.b02 mdtp.b03 mdtp.b04 mdtp.b05 mdtp.b06 mdtp.mdt
MDTP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(MDTP_IMAGES)))
$(MDTP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MDTP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MDTP_SYMLINKS)


GOODIXFP_IMAGES := goodixfp.b00 goodixfp.b01 goodixfp.b02 goodixfp.b03 goodixfp.b04 goodixfp.b05 goodixfp.b06 goodixfp.mdt
GOODIXFP_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(GOODIXFP_IMAGES)))
$(GOODIXFP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "GOODIXFP firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(GOODIXFP_SYMLINKS)


MSADP_SYMLINKS := $(TARGET_OUT_ETC)/firmware/msadp
$(MSADP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MSADP links"
	@rm -rf $(TARGET_OUT_ETC)/firmware/msadp
	@mkdir -p $(TARGET_OUT_ETC)/firmware
	$(hide) ln -sf /dev/block/bootdevice/by-name/msadp $(TARGET_OUT_ETC)/firmware/msadp

ALL_DEFAULT_INSTALLED_MODULES += $(MSADP_SYMLINKS)

WCNSS_INI_SYMLINK := $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
$(WCNSS_INI_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS config ini link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/etc/wifi/$(notdir $@) $@

WCNSS_MAC_SYMLINK := $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/wlan_mac.bin
$(WCNSS_MAC_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS MAC bin link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_INI_SYMLINK) $(WCNSS_MAC_SYMLINK)

include device/leeco/x2/tftp.mk

endif

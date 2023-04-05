#
# Copyright (c) 2013-2018, 2020 The Linux Foundation. All rights reserved.
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted, provided that the
# above copyright notice and this permission notice appear in all copies.
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qca-nss-sfe
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2022-11-10
PKG_SOURCE_URL:=https://git.codelinaro.org/clo/qsdk/oss/lklm/shortcut-fe.git
PKG_SOURCE_VERSION:=ed5b7fefed266021ef1f8251a1a4add73b6c6be6
PKG_MIRROR_HASH:=skip

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/qca-nss-sfe
  SECTION:=kernel
  CATEGORY:=Kernel modules
  SUBMENU:=Network Support
  DEPENDS:=@IPV6 +kmod-nf-conntrack
  TITLE:=Kernel driver for SFE - QSDK 12.3
  FILES:=$(PKG_BUILD_DIR)/qca-nss-sfe.ko
  KCONFIG:= \
	   CONFIG_NF_CONNTRACK_EVENTS=y \
	   CONFIG_NF_CONNTRACK_TIMEOUT=y \
	   CONFIG_QCA_NSS_SFE=y \
	   CONFIG_XFRM=y
  PROVIDES:=$(PKG_NAME)
  AUTOLOAD:=$(call AutoLoad,09,qca-nss-sfe)
endef

define KernelPackage/qca-nss-sfe/Description
Shortcut is an in-Linux-kernel IP packet forwarding engine.
endef

define KernelPackage/qca-nss-sfe/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/usr/bin/sfe_dump $(1)/usr/bin
endef

define Build/Compile
	$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		EXTRA_CFLAGS+=SFE_SUPPORT_IPV6=y \
		-I$(PKG_BUILD_DIR)/exports \
		modules
endef

ifneq ($(CONFIG_PACKAGE_kmod-qca-nss-sfe),)
define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/qca-nss-sfe
	$(CP) -rf $(PKG_BUILD_DIR)/exports/sfe_api.h $(1)/usr/include/qca-nss-sfe
endef
endif

$(eval $(call KernelPackage,qca-nss-sfe))

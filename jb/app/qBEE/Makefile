include $(TOPDIR)/rules.mk

PKG_NAME:=qBEE
PKG_VERSION:=4.3.4.11
PKG_RELEASE=1
PKG_LICENSE:=GPL-2.0+

include $(INCLUDE_DIR)/package.mk

define Package/qBEE
  SUBMENU:=BitTorrent
  SECTION:=net
  CATEGORY:=Network
  TITLE:=bittorrent client programmed in C++ / Qt
endef

ifeq ($(ARCH),x86_64)
	PKG_ARCH_qBEE:=x86_64
endif

ifeq ($(ARCH),aarch64)
	PKG_ARCH_qBEE:=aarch64
endif

PKG_SOURCE:=qBittorrent-nox_$(PKG_ARCH_qBEE)-linux-musl_static.zip
PKG_SOURCE_URL:=https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-$(PKG_VERSION)/
UNTAR_DIR:=$(BUILD_DIR)/$(PKG_NAME)
PKG_HASH:=skip

define Package/qBEE/description
	qBEE is based on qBittorrent, it's aimed at block a leeching clients automatically.
endef

define Build/Prepare
	rm -rf $(UNTAR_DIR)
	mkdir -vp $(UNTAR_DIR)
	unzip $(DL_DIR)/$(PKG_SOURCE) -d $(UNTAR_DIR)
	mv -f $(UNTAR_DIR)/qbittorrent-nox $(UNTAR_DIR)/qBittorrentEE-nox
endef

define Build/Configure
endef

define Build/Compile
endef


define Package/qBEE/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(UNTAR_DIR)/qBittorrentEE-nox $(1)/usr/bin
	chmod 755 $(1)/usr/bin/qBittorrentEE-nox
endef

$(eval $(call BuildPackage,qBEE))

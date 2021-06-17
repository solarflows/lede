include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-qBittorrent-enhanced
PKG_VERSION:=1.0
PKG_RELEASE:=2
LUCI_TITLE:=LuCI support for qBittorrent-enhanced
LUCI_DEPENDS:=+python3 +qBittorrent-enhanced
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))
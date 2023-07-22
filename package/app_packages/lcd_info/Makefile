# 导入通用编译规则
include $(TOPDIR)/rules.mk

# name和version用来定义编译目录名$(PKG_BUILD_DIR)]
PKG_NAME:=lcdinfo
PKG_VERSION:=1.0
PKG_RELEASE:=1
#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)  # 也可以直接定义编译目录名，代替默认的目录名

# 导入包定义
include $(INCLUDE_DIR)/package.mk

# 包定义：定义我们的包在menuconfig中的位置
# Makefile中的define语法可以理解为函数，用于定义命令集合
define Package/lcdinfo
  SECTION:=app_packages
  CATEGORY:=App_packages
  TITLE:=lcdinfo, display bmp file.
endef

# 包描述：关于我们包的更详细的描述
define Package/lcdinfo/description
  display bmp file
endef

# 编译准备. 必须使用tab缩进，表示是可执行的命令
define Build/Prepare
	echo "Here is Build/Prepare"
	mkdir -p $(PKG_BUILD_DIR)
	cp ./src/* $(PKG_BUILD_DIR)/
endef

# 安装
define Package/lcdinfo/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/lcdinfo $(1)/usr/bin
endef

# 这一行总是在最后
$(eval $(call BuildPackage,lcdinfo))